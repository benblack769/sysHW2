#include <cstdint>
#include <cstdlib>
#include <cstdio>
using namespace std;
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