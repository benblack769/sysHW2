

The graph is not monotonous or a step function, which should be expected because with random accesses, if I am using A bytes of memory over a size of B cache, then if A > B, there is a there will still be B bytes in the cache and so there will be  a B/A chance that the next bit of data is still in that cache, so in this simplistic model we should see

latency(BufferSize) = (Sum as i < current_cache_level of
                            CacheSize[i] * CacheLatency[i] / (BufferSize not in lower caches))
                       + CacheLatency[current_cache_level] * BufferSize not in lower caches

With this, we can apparently see
