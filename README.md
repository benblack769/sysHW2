Filename | Description |
--- | ---
hct.cpp 					|c++ latency measurement code
cupid.cpp					|c++ tool to gather cache size data using inline asm calls to cupid
compile.sh 					|script that compiles hct.cpp and cupid.cpp
stopped_out.col 			|raw data		
graphplot.txt				|script that generates graph of the data


### Latency collecting algorithm:

##### I created a linked list which had the following properties:

1. Every element in the list resides in the buffer of a particular size
2. 98% of the buffer is part of the linked list
3. Every element in the list is pointed to by exactly one element
4. The element it points to is in a random location in the buffer
5. The linked list has no associated data, only the pointer to the next link
6. There is only a single loop, so in order to get from a link back to the same link, one must go though every other link.

To time random accesses, I simply measured the time to iterate through the links 2^28 times.

##### This has some good theoretical properties of measuring latencies:

1. It measures true latency, because it absolutely has to fully bring the memory into the register in order to even attempt to start the next memory access, so there is no possibility of instruction level parallelism making multiple memory accesses simultaneously.
2. It completely foils the prefetcher, as it is random.

##### Bad properties:
1. I am accessing 8 bytes at once instead of 1. This could theoretically lead to higher numbers than the true ones, as it might be measuring some costs of moving 8 bytes around instead of just one.
2. I am only using 98% of the buffer because my list creation method is highly inefficient, and is rather slow for high percentages of large buffer sizes. This means there is a potential that cache sizes seem larger than the really are.


#### Producing data:

To generate the data, I used g++ version 4.8, using the compile.sh script. It was done on a Intel 6700HQ processor, 2.7ghertz base, 3.5 max turbo, and seems to usually run at around 3.3. I ran the test from the Ubuntu shell with the graphical user interface entirely turned off to prevent other processes from ruining my data.

#### Data plot

I chose buffer sizes of 2^13-2^28 with 4 points between each power of two to creates a relatively continuous plot on the log scale.

![alt text](https://github.com/weepingwillowben/sysHW2/blob/master/clean.png "Clean graph")

In the plot of the data, there is a fairly clear increase in latency at 2^15, a less clear increase between 2^18 and 2^19, and other huge increase right before 2^19. So given just this data, and before I did the analysis that will follow, I thought it very reasonable that the places where there were sudden jumps in latency were exactly where the cache sizes ran out, so I guessed 32kB, around 300kB, and 7mB. I think my reasoning makes sense intuitively because the moment data has to be fetched from the next cache level (since the cache ran out), there will be many misses, and a noticeable increase in latency should follow.

According to my call to cupid (see cupid.cpp)

    L1 Cache size = 32768
    L2 Cache size = 262144
    L3 Cache size = 6291456

So my guesses were actually fairly close, all of the difference between my rough guesses and the real numbers can by explained by the fact that I did not collect that many data points, and the data tended to get kind of messy when shifting from the L2 to the L3 cache. More on that later.

With a lot more thought, I came up with a more through understanding of why the graph looks the way it does.

The graph is not monotonous or a step function, which should be expected because with random accesses, if I am using A bytes of memory over a size of B cache, then if A > B, there is a there will still be B bytes in the cache and so there will be  a B/A chance that the next bit of data is still in that cache, so in this simplistic model we should see something like the following formula:

    latency(BufferSize):
		buff_latency = 0
		cache_level = current_cache_level(BufferSize)
	 	for i < cache_level
            buff_latency += CacheSize[i] - CacheSize[i-1]) * CacheLatency[i] / BufferSize
		buff_latency += CacheLatency[cache_level] * (BufferSize - CacheSize[cache_level-1]) / BufferSize
		return buff_latency


After I got the true cache sizes from cupid, I made another plot, using the above formula and guessed values for the true latencies until the plot of the above function matched the data fairly well.

![alt text](https://github.com/weepingwillowben/sysHW2/blob/master/measured.png "fitted graph")

I think it shows that the above model is a an OK model for truly random accesses on Intel's cache system. But there are some issues. At the junction between the caches, there is a substantial difference between the expected and the real. Two places are especially interesting:

Rather than flattening out, the

By the way, the latencies I guessed which matched the data fairly well are:

    L1 = 1.14 ns
    L2 = 3.6 ns
    L3 = 13.2 ns
    Main memory = 78.5 ns

So presumably the true latencies are close to these. The numbers are fairly close to the numbers in the chart, except the L1 cache latency is twice what was expected (since my machine is running at around 3.3ghertz, 1.1ns is almost exactly 3 cycles). I have no idea why. It is very possible that the loop isn't perfectly optimized and that it is doing other things than accessing random pointers. However, unrolling the loop did not help noticeably, so this seems unlikely (the unrolled code gets turned into a series of mov instructions). It might be that system interrupts slowed it down in some consistent way, but increasing the number of iterations also did not help, so this also seems unlikely. Another possibility is that it really does take 3 cycles to access a single value, put it in a register, and start the next memory access. However, most of the time, due to the effects of pipelining and instruction-level parallelism, latency appears to be much lower.

Here is a plot of 12 latency tests conducted on 2^23 iterations:

![alt text](https://github.com/weepingwillowben/sysHW2/blob/master/box.png "error graph")

This is interesting because the points that have the most error seem to be those between the L1 and the L2 cache. Note that I seeded my random generator to a constant, so my algorithm is deterministic. So all the error shown is messiness in the system, not my code. This also shows that the dip in latency that occurs after 2^21 bytes is reasonably consistent between tests, so it is either there is something interesting going on in the L3 cache that makes things faster, or my random algorithm is doing something weird with those sizes of bytes. Unfortunately, I have not had time to check that it is the former.

One explanation of why the performance around the L2 cache size is worse than expected and has a lot of variance is that the prefetcher loads data into the L1 and L2 cache that the process will never use, or another CPU level cache optimization fails in a similar way. After all, these machines really aren't built to deal with random accesses.
