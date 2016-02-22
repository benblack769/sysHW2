#include <iostream>
#include <cstdint>
#include <ctime>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <thread>
#define MULTITHREADn
#define LL
using namespace std;
constexpr uint64_t rand_size = 256;

uint64_t rands[rand_size];
constexpr uint64_t num_threads = 4;

uint64_t Rand(){
	return rand();
}
uint64_t LongRand(){
	return Rand() + (Rand() << 8ULL) + (Rand() << 16ULL) + (Rand() << 24ULL) + (Rand() << 32ULL);
}
void calc_rands(){
	srand(10);
	for(uint64_t i = 0; i < rand_size; i++){
		rands[i] = LongRand();
	}
}
uint64_t get_time_ns(){
	timespec t;
	clock_gettime(CLOCK_MONOTONIC_RAW,&t);
 	return 1000000000ULL * t.tv_sec + t.tv_nsec;
}
#ifndef LL
#ifdef MULTITHREAD
void thread_start(uint8_t * arr8,const size_t andnum,const uint64_t start_rand,const uint64_t iters){
	uint64_t index = start_rand;
	size_t sum = 0;
	for(uint64_t iter = 0; iter < iters / num_threads; iter++){
		for (uint64_t j = 0; j < rand_size; j++){
			sum += arr8[index & andnum];
			index += rands[j];
		}
	}
	if (sum == 12312311923ULL)
		exit(1);//printf("sum thing is weird");
}
void run_random_acesses(void * arr,const uint64_t size,const size_t andnum,const uint64_t iters){
	//size_t sum = 0;
	//size_t index = 0;
	memset(arr,0,size);
	
	thread ts[num_threads];
	uint8_t * arr8 = (uint8_t *)(arr);
	for(int i = 0; i < num_threads; i++)
		ts[i] = thread(thread_start,arr8,andnum,rands[rand()%rand_size],iters);
	
	for(int i = 0; i < num_threads; i++)
		ts[i].join();
	
}

double time_random_acesses(void * arr,const uint64_t size,const size_t andnum,const uint64_t iters){
	clock_t st = clock();
	run_random_acesses(arr,size,andnum,iters);
	return (clock() - st)/((double)(CLOCKS_PER_SEC));
}

#else
void run_random_acesses(void * arr,const uint64_t size,const size_t andnum,const uint64_t iters){
	size_t sum = 0;
	size_t index = 0;
	memset(arr,0,size);
	
	uint8_t * arr8 = (uint8_t *)(arr);
	for(uint64_t i = 0; i < iters; i++){
		for (uint64_t j = 0; j < rand_size; j++){
			//asm("");
			sum += arr8[index & andnum];
			index += rands[j];
			arr8[index & andnum]++;
			index += rands[j];
		}
	}
	if (sum == 12312311923ULL && arr8[size/2] == 4)
		exit(1);//printf("sum thing is weird");
}

double time_random_acesses(void * arr,const uint64_t size,const size_t andnum,const uint64_t iters){
	clock_t st = clock();
	run_random_acesses(arr,size,andnum,iters);
	return (clock() - st)/((double)(CLOCKS_PER_SEC));
}
#endif
#else
struct link{
	link * next;
};
void run_random_acesses(link * arr,const uint64_t iters){
	for(uint64_t i = 0; i < iters; i++){
		arr = arr->next;
		//sum += arr;
	}
	if (arr == NULL)
		printf("sum thing is weird");
}

double time_random_acesses(void * arr,const uint64_t size,const size_t andnum,const uint64_t iters){
	memset(arr,0,size);
	
	link * larr = (link *)(arr);
	size_t lsize = size/8;
	
	link * curl = larr;
	for(int i = 0;i < lsize-lsize/50;i++){
		size_t nextindex;
		do{
			nextindex = LongRand() % lsize;
		}
		while(larr[nextindex].next != NULL);
		curl->next = &larr[nextindex];
		curl = curl->next;
	}
	curl->next = larr;
	
	uint64_t st = get_time_ns();
	run_random_acesses(larr,iters);
	return (get_time_ns() - st) / (double)(iters);
}

#endif

int main(){
	calc_rands();
	const uint64_t ters = 30;
	for(uint64_t s = 13; s < 27;s++){
#ifdef LL
		const int64_t num_bt = 3;
		for(int64_t b = (1 << num_bt) - 1; b >= 0; b--){
			uint64_t num_iters = (1ULL << ters);
			uint64_t size = (1ULL << s) - (b << (s-num_bt-1));
			void * buff = malloc(size);
			double time = time_random_acesses(buff,size,size-1,num_iters);
			cout << size << "\t\t" << time << endl;
			free(buff);
		}
#else
		uint64_t num_iters = (1ULL << (ters)) / rand_size;
		uint64_t size = (1ULL << s);
		void * buff = malloc(size);
		double time = time_random_acesses(buff,size,size-1,num_iters);
		cout << size << "\t\t" << time << endl;
		free(buff);
#endif
	}
	return 0;
}
