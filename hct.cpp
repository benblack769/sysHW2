#include <iostream>
#include <cstdint>
#include <ctime>
#include <cstdlib>
#include <cstring>
using namespace std;
#define UNROLLED
uint64_t Rand(){
	return rand();
}
uint64_t LongRand(){
	return Rand() + (Rand() << 8ULL) + (Rand() << 16ULL) + (Rand() << 24ULL) + (Rand() << 32ULL);
}
uint64_t get_time_ns(){
	timespec t;
	clock_gettime(0,&t);
 	return 1000000000ULL * t.tv_sec + t.tv_nsec;
}

struct link{
	link * next;
};
void run_random_acesses(link * arr,const uint64_t iters){
	uint64_t i = 0; 
#ifdef UNROLLED
	for(;i < iters-8; i+=8){
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		arr = arr->next;
		//sum += arr;
	}
#endif
	for(;i < iters; i++){
		arr = arr->next;
		//sum += arr;
	}
	if (arr == NULL)
		cout << "this foils the dead code elimination so that this benchmark can work\n";
}

double time_random_acesses(void * arr,const uint64_t size,const uint64_t iters){
	memset(arr,0,size);

	//larr is linked in a way that it is still random even though it is cycling in a huge loop which includes 98% of the elements
	link * larr = (link *)(arr);
	size_t lsize = size/sizeof(link*);

	link * curl = larr;
	for(size_t i = 0;i < lsize-lsize/50;i++){
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
	const uint64_t ters = 28;
	const uint64_t num_iters = (1ULL << ters);
	for(uint64_t s = 13; s < 27;s++){
		//b splits the power of two into num_bt parts, to make a more continous plot of sizes
		const int64_t num_bt = 2;
		for(int64_t b = (1 << num_bt) - 1; b >= 0; b--){
			uint64_t size = (1ULL << s) - (b << (s-num_bt-1));
			void * buff = malloc(size);
			double time = time_random_acesses(buff,size,num_iters);
			cout << size << "\t\t" << time << endl;
			free(buff);
		}
	}
	return 0;
}
