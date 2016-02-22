#include <iostream>
#include <cstdint>
using namespace std;
uint64_t mask(uint64_t size){
    return (1 << size) - 1;
}
uint64_t bits_between(uint64_t num,uint64_t bottom,uint64_t top){
    return (num & mask(top)) >> bottom;
}
uint64_t cupid_call(uint64_t in1){
    uint64_t rax,rbx,rcx,rdx;
    asm volatile (
        "movq %[initval],%%rcx\n\t"
        "movq $4,%%rax\n\t"
        "CPUID\n\t"
        "movq %%rax,%[rax]\n\t"
        "movq %%rbx,%[rbx]\n\t"
        "movq %%rcx,%[rcx]\n\t"
        "movq %%rdx,%[rdx]\n\t"
        :[rax] "=rm" (rax),[rbx] "=rm" (rbx),[rcx] "=rm" (rcx),[rdx] "=rm" (rdx)
        :[initval] "r" (in1)
        :"rax","rbx","rcx","rdx"
    );
    //this is the formula from intel's documentation (Instruction set refrence page 267)
    //on how to find the size of a cache level.
    //http://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf
    uint64_t Ways = bits_between(rbx,22,31);
    uint64_t Partitions = bits_between(rbx,12,21);
    uint64_t Line_Size = bits_between(rbx,0,11);
    uint64_t Sets = rcx;
    uint64_t Bytes =  (Ways + 1) * (Partitions + 1) * (Line_Size + 1) * (Sets + 1);
    return Bytes;
}
int main(){
    cout << "L1 Cache size = " << cupid_call(1) << endl;
    cout << "L2 Cache size = " << cupid_call(2) << endl;
    cout << "L3 Cache size = " << cupid_call(3) << endl;
    return 0;
}
