#include <iostream>
#include <cstdint>
#include <ctime>
#include <cstdlib>
#include <cstring>
using namespace std;
constexpr uint64_t rand_size = 256;


uint64_t Rand(){
	return rand();
}
uint64_t LongRand(){
	return Rand() + (Rand() << 8ULL) + (Rand() << 16ULL) + (Rand() << 24ULL) + (Rand() << 32ULL);
}
uint64_t get_time_ns(){
	timespec t;
	clock_gettime(CLOCK_MONOTONIC_RAW,&t);
 	return 1000000000ULL * t.tv_sec + t.tv_nsec;
}

struct link{
	link * next;
};
void run_random_acesses(link * arr,const uint64_t iters){
	for(uint64_t i = 0; i < iters; i++){
		arr = arr->next;
		//sum += arr;
	}
	if (arr == NULL)
		cout << "this foils the dead code elimination so that this benchmark can work\n";
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


int main(){
	const uint64_t ters = 30;
	for(uint64_t s = 13; s < 27;s++){
		const int64_t num_bt = 3;
		for(int64_t b = (1 << num_bt) - 1; b >= 0; b--){
			uint64_t num_iters = (1ULL << ters);
			uint64_t size = (1ULL << s) - (b << (s-num_bt-1));
			void * buff = malloc(size);
			double time = time_random_acesses(buff,size,size-1,num_iters);
			cout << size << "\t\t" << time << endl;
			free(buff);
		}
	}
	return 0;
}
