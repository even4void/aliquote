---
title: "Insertion sort and Python FFI"
date: 2019-12-18T16:14:27+01:00
draft: false
tags: ["python", "clang"]
categories: ["2019"]
---

One of Rosalind problems asks us to implement a function to perform an insertion sort. In the best case, its complexity is $\mathcal{O}(n)$, and  $\mathcal{O}(n^2)$ on average (i.e., worse than the *quick sort* we talked [earlier](/post/racket-ffi/), which is $\mathcal{O}(n\log n)$). Note that this type of sorting algorithm works best with vectors, since elements can be swapped in place without extra memory allocation. It is also quite good for [nearly sorted data](https://www.toptal.com/developers/sorting-algorithms/nearly-sorted-initial-order).

According to [this page](https://benchmarksgame-team.pages.debian.net/benchmarksgame/fastest/racket-python3.html), Racket should be a fair competitor to Python, but I would be surprised if it could beat C, even on simple task, so I tried to figure out myself. Suppose you want to compare Python and C --- or even Racket --- on such a basic sorting task. This really is a toy example since (1) [built-in](https://docs.scipy.org/doc/numpy/reference/generated/numpy.sort.html) sorting procedure are certainly better than that, and (2) there are far better benchmarks available to compare the performance of each two languages. 

> If you get into algorithmic analysis, you'll study many different sorting algorithms, and be able to characterize their performance under different conditions.  But again, for most real world sorting purposes, just use the built-in "sort" procedure. --- Neil Van Dyke, on the [Racket list](https://lists.racket-lang.org/users/archive/2013-November/060369.html)

Anyway, here are quick implementations of *insertion sort* in these languages. For the sequence of 100 numbers shown below, the number of swaps required is 2532. Timing is performed at the command line using `time`.

Python (0.06 real / 0.04 user / 0.01 sys):

```python
def ins(lst, verbose=False):
    op = 0
    for i in range(1, len(lst)):
        cur = lst[i]
        k = i - 1
        while k >= 0 and cur < lst[k]:
            lst[k+1] = lst[k]
            op += 1
            k -= 1
        lst[k+1] = cur
    if verbose:
        print("%s swaps" % op)
    return lst

# 0..100 shuffled (10 numbers per row)
lst = [44, 40, 65, 79, 42, 82, 46, 33, 57, 100,
       23, 98, 28, 35, 6, 63, 88, 18, 20, 81,
       83, 38, 67, 17, 56, 74, 60, 39, 61, 76,
       53, 66, 73, 25, 19, 50, 70, 93, 92, 14,
       37, 8, 4, 15, 27, 55, 13, 64, 71, 10,
       5, 2, 75, 77, 7, 9, 11, 49, 43, 91,
       85, 72, 32, 26, 97, 99, 34, 86, 96, 78,
       90, 59, 24, 31, 94, 80, 45, 12, 95, 1,
       16, 84, 62, 68, 87, 58, 29, 51, 52, 69,
       48, 3, 21, 22, 54, 47, 36, 41, 30, 89]
out = ins(lst, True)
```

Compared to built-in methods, without using NumPy or Cython, we are slower compared to what `sorted` achieves on the same list:

```python
In [6]: timeit sorted(lst)
1.15 µs ± 47.9 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)

In [7]: timeit out = ins(lst, False)
18.9 µs ± 658 ns per loop (mean ± std. dev. of 7 runs, 10000 loops each)
```

Now, what about C? It is pretty fast, of course: 0.00 real / 0.00 user / 0.00 sys. Here is the code I used ([full code](/pub/ins.c)):

```c
#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

int isort(int *lst, int len) {
    int i, j, count = 0;
    for(i=1; i<=len-1; i++) {
        for(j=i; j>0; j--) {
        	if (lst[j-1] > lst[j]) {
                SWAP(lst[j], lst[j-1]);
                count++;
        	}
        }
    }
    return(count);
}
```

However, it's not difficult to call the above C code in Python, thanks to the [cffi](https://cffi.readthedocs.io/en/latest/) library. Eli Bendersky has a [nice post](https://eli.thegreenplace.net/2013/03/09/python-ffi-with-ctypes-and-cffi) about `cffi` and `ctypes`. Compared to Racket FFI, C types inference is performed automagically, and you just have to copy/paste existing C implementations using `ffi.cdef`. Here is an example of "in-line mode" usage, where everything is set up every time you import your Python code, per the documentation:

```python
from cffi import FFI

ffi = FFI()
lib = ffi.dlopen('ins.dylib')
ffi.cdef("""
int isort(int *lst, int len);
""")
lib.isort(lst, 100)
```

No need to bother declaring the return type, you'll get the value returned by `isort` (an integer indicating the number of swap operations required for the given list). If you want to get the updated value of `lst`, you likely want to map the returned value to a Python variable, e.g.:

```python
a = ffi.new("int[100]")
a[0:100] = lst
lib.isort(a, 100)
list(a[0:10])
```

Of note, the [Racket code](https://rosettacode.org/wiki/Sorting_algorithms/Insertion_sort) available on Rosetta appears like an outsider among the two other competitors (at least when it is not compiled), with the following timing: 0.60 real / 0.49 user / 0.10 sys.