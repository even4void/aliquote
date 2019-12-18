---
title: "Racket FFI and C"
date: 2019-12-17T19:27:13+01:00
draft: false
tags: ["racket", "clang"]
categories: ["2019"]
---

I am slowly updating a small Racket package for statistical analysis, which is a mix of R, LispStat and Stata actually. Don't expect too much from this package because it is mainly a proof of concept, and a way to learn Racket more seriously. Anyway, I didn't realize the (typed) [math](https://docs.racket-lang.org/math/) package was so complete. Beside matrices and common statistical distributions, it comes with Gram-Schmidt, QR and LU decomposition, a solver, etc. These utilities already allow to fit a simple (weighted) linear model in a few lines:

```racket
(require math)

(define T matrix-transpose)

(define (regress y x [w #f])
  (matrix-solve
   (matrix* (T x) (diagonal-matrix w) x) (matrix* (T x) (diagonal-matrix w) y)))
```

Of course, you may well prefer to rely on solid libraries for linear algebra, like LAPACK or BLAS, especially if you are going to work with large datasets or irregular design matrix ($n\ll p$ case). However, suppose you already have some C code available to estimate the parameters of such models, say the GLM routine in the [snpMatrix](https://www.bioconductor.org/packages/2.8/bioc/html/snpMatrix.html) package. Surely there are many more standalone C packages for that specific purpose, but I already used this routine in the past in a C program, so I came to appreciate it (besides its use in GWAS analysis). Being able to call the C code from Racket would alleviate the need to rewrite everything from scratch, and in the long run you could even use well-tested libraries like [liblinear](https://www.csie.ntu.edu.tw/~cjlin/liblinear/) or [wowpal](https://github.com/VowpalWabbit/vowpal_wabbit/wiki).

Calling "simple C" routine code in Racket is quite easy actually, once you figured out how to map C types to Racket data structures, plus a couple of other issues discussed in the [documentation](https://docs.racket-lang.org/foreign/index.html). In the simplest cases, you just need to create a [shared library](/post/embedding-c-code-in-java/) (`--shared` under Linux, `--dynamiclib` under macOS), write a wrapper to define the C function signature in Racket, and define a Racket function that calls the C function using Racket data structures. Note that by "simple C" I refer to C procedures that do not involve pass-by-reference return values, but only parameter of the type pass-by-value or pointers to 1D array. There's a gentle tutorial that covers such [simple cases](http://www.cs.grinnell.edu/~rebelsky/Glimmer/Summer2012/RacketFFI/tutorial.html). There's also a very nice [tutorial](https://prl.ccs.neu.edu/blog/2016/06/27/tutorial-using-racket-s-ffi/) available in 3 parts if you want to learn more.

Let's see a more complete example in action. Suppose your C function, `qs.c`, reads like this simple quick sort:

```c
#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

void qs(int *lst, int start, int end) {
    int i, j, p;
    if(start < end) {
        p = start;
        i = start;
        j = end;
        while (i < j) {
            while (lst[i] <= lst[p] && i < end)
                i++;
            while (lst[j] > lst[p])
                j--;
            if (i < j) {
                SWAP(lst[i], lst[j]);
            }
        }
        SWAP(lst[p], lst[j]);
        qs(lst, start, j-1);
        qs(lst, j+1, end);
    }
}
```

Now, we just have to compile this using `gcc` or `clang`, depending on what's available on your OS. In my case:

```bash
~/tmp  cc -dynamiclib -o qs.dylib qs.c
```

You should end up with a shared (dynamic) library, ready to be used by C programs, or Racket itself. On the Racket side, let's write the corresponding functions:

```racket
(require ffi/unsafe
         ffi/cvector
         ffi/unsafe/define)
(define-ffi-definer define-libs (ffi-lib "qs"))
(define-libs qs (_fun (a : _cvector) _int _int -> _void -> (values a)))
```

That's it! Note that sorting is done in place, hence the pass-by-reference return value (`*lst`) that we need to tag in order to be able to refer to the captured value from Racket. You'll now just need to define a C-type vector in Racket and pass it to your function as shown below:

```racket
(define-values (a) (qs (list->cvector '(1 2 6 3 7 5 9 8 4) _int) 0 9))
```

And here we are finally:

```racket
> a
#<cvector>
> (cvector->list a)
'(0 1 2 3 4 5 6 7 8)
```

<small>Note that Racket is using 0-base indexing, like Python. You could replace the last expression with <code>(map add1 (cvector->list a))</code>.</small>