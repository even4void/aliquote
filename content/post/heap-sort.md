---
title: "Heap sort"
date: 2020-02-11T13:53:37+01:00
draft: false
tags: ["python"]
categories: ["2020"]
---

We already discussed insertion and quick sorting in [previous](/post/racket-ffi/) [posts](/post/insertion-sort-python-ffi/). Today, we are going to implement a quick function to perform heap sort in Python in order to answer one of [Rosalind problems](http://rosalind.info/problems/hs/). Like merge sort, the worst case running time of heap sort is $\mathcal{O}(n\log n)$ The idea behind this approach is to convert an array of values into a heap, which is a (perfectly balanced) binary tree where each node is greater than each of its children and all leaves are in the leftmost position available. In the case of a heap, the children of an element _n_ are at index 2*n*+1 for the left child and 2*n*+2 for the right child. Note that the [Heap queue](https://docs.python.org/3.7/library/heapq.html) algorithm is readily available in Python 3, and according to the documentation, "a heapsort can be implemented by pushing all values onto a heap and then popping off the smallest values one at a time."

Here is a recursive formulation, following the steps suggested in Cormen, Leiserson, Rivest & Stein's _Introduction to Algorithms_ (§6.2) in order to maintain the [max-heap](<https://en.wikipedia.org/wiki/Heap_(data_structure)>) property ("max-heapify"):

```python
def heapify(lst, k, n):
    curr = k
    left = 2 * k + 1
    right = 2 * k + 2
    if left < n and lst[left] > lst[curr]:
        curr = left
    if right < n and lst[right] > lst[curr]:
        curr = right
    if curr != k:
        lst[curr], lst[k] = lst[k], lst[curr]
        heapify(lst, curr, n)

def heapsort(lst):
    n = len(lst)
    for i in range(int(n/2) - 1, -1, -1):
        heapify(lst, i, n)
    for i in range(n - 1, 0, -1):
        lst[0], lst[i] = lst[i], lst[0]
        heapify(lst, 0, i)
    return lst
```

And here is the "built-in" procedure:

```python
from heapq import heappush, heappop

def heapsort2(iterable):
    h = []
    for value in iterable:
        heappush(h, value)
    return [heappop(h) for i in range(len(h))]
```

How do the two implementations compare?

```python
In [10]: import random
In [11]: xs = [random.random() for _ in range(10**6)]
In [12]: %time heapsort(xs)
CPU times: user 14.3 s, sys: 39.7 ms, total: 14.3 s
Wall time: 14.4 s
In [13]: %time heapsort2(xs)
CPU times: user 1.4 s, sys: 21.3 ms, total: 1.42 s
Wall time: 1.43 s
```

So, this is clearly a big win for the later, and it suggest that we would be better using `heapq` for solving Rosalind problems involving heap sort. As confirmed by a bit of profiling, most of the time is spent calling `heapify` multiple times in our own implementation,[^1] while Python's `heapq` allows a constant access time. For an array of size 1000, there will be 1000 "pop" and 1000 "push", at almost a zero cost.

```python
In [17]: import cProfile
In [18]: cProfile.run('heapsort2(xs[:1000])')
         2006 function calls in 0.001 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.001    0.001 <ipython-input-10-4d33d18db4ca>:2(heapsort2)
        1    0.000    0.000    0.001    0.001 <ipython-input-10-4d33d18db4ca>:6(<listcomp>)
        1    0.000    0.000    0.001    0.001 <string>:1(<module>)
     1000    0.000    0.000    0.000    0.000 {built-in method _heapq.heappop}
     1000    0.000    0.000    0.000    0.000 {built-in method _heapq.heappush}
        1    0.000    0.000    0.001    0.001 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.len}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
```

[^1]: The implementation proposed on [Rosetta](https://rosettacode.org/wiki/Sorting_algorithms/Heapsort#Python) is lightly better, but it does not improve much overall performance:

    ```
    CPU times: user 10.3 s, sys: 21.4 ms, total: 10.3 s
    Wall time: 10.4 s
    ```
