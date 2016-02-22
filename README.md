Files:
	
	
Compiler:
	g++ version 4.8, using the compile.sh script.

## Latency collecting algorithm:

##### I created a linked list which had the following properties:

1. Every element in the list resides in the buffer of a particular size
2. 98% of the buffer is part of the linked list
3. Every element in the list is pointed to by exactly one element
4. The element it points to is in a random location in the buffer
5. The linked list has no associated data, only the pointer to the next link
6. There is only a single loop, so in order to get from a link back to the same link, one must go though every other link.
	
To time random acesses, I simply measured the time to iterate through the links 2^28 times.
	
##### This has some good theoretical properties of measuring latencies:

1. It measures true latency, because it absolutly has to fully bring the memory into the cpu in order to even attempt to start the next memory acess, so there is no possibility of instruction level parelelism making multiple memory acesses simeltaniously.
2. It completely foils the prefetcher, as it is random.
		
##### Bad properties:
1. I am acessing 8 bytes at once instead of 1. This could theoretically lead to higher latency numbers than the true ones.
2. I am only using 98% of the buffer because my list creation method is highly ineficcient, and is rather slow for high percentages of large buffer sizes. This means there is a potencial that cache sizes seem larger than the really are.
		
	
I collected data by going into the linux command line, turning off the GUI entirely, and running my program.

Data plot:

![alt text](https://github.com/weepingwillowben/sysHW2/blob/master/clean.png "Clean graph")

In the plot of the data, there is a fairly clear increase in latency at 

The graph is not monotonous or a step function, which should be expected because with random accesses, if I am using A bytes of memory over a size of B cache, then if A > B, there is a there will still be B bytes in the cache and so there will be  a B/A chance that the next bit of data is still in that cache, so in this simplistic model we should see

    latency(BufferSize) = (Sum as i < current_cache_level of
                                (CacheSize[i] - CacheSize[i-1]) * CacheLatency[i] / BufferSize
    						)
                          + CacheLatency[current_cache_level] * (BufferSize - CacheSize[current_cache_level-1]) / BufferSize


After I got the true cache sizes from cupid, I made another plot, using the above formula and guessed values for the true latencies until the plot of the above function matched the data fairly well. 

The plot of the function along with the data is in "measured.png". I think it shows that this is a pretty good model for random acesses on Intel's cache system.

By the way, the latencies I guessed which matched the data fairly well are:

    L1 = 1.15 ns
    L2 = 3.5 ns
    L3 = 13 ns
    Main memory = 78 ns
	
So presumably the true latencies are close to these. The numbers are fairly close to the numbers in the chart, except the L1 cache latency is twice what was expected (since my machine is running at around 3.3ghertz, 1.1ns is almost exactly 3 cycles). I have no idea why. It is very possible that the loop isn't perfectly optimized and that it is doing other things than accessing random pointers. However, urolling the loop did not help noticably, so this seems unlikely (the unrolled code gets turned into a series of mov instructions). It might be that system iterups slowed it down in some consistent way, but increasing the number of iterations also did not help, so this also seems unlikely. Another possibility is that it really does take 3 cycles to acess a single value, put it in a register, and start the next memory acess. However, most of the time, due to the effects of pipelining and instruction-level parallelism, latency appears to be much lower.

