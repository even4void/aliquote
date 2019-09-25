---
title: "On premature optimization"
date: 2019-06-29T17:42:31+02:00
draft: false
tags: ["racket", "math", "euler"]
categories: ["2019"]
---

In which I describe my journey in the land of Fibonacci numbers.

I spent more than an hour implementing different algorithms in Racket that compute the $n$-th term of the Fibonacci sequence. Why? Because I'm solving Euler problems in my spare time, and I misread Problem 2 statement such that I tried to sum up the even values of the first 4,000,000 Fibonacci terms, instead of restricting the sum to values not exceeding 4,000,000. Huh!

The first algorithm I used was not optimized, and of course it will have a hard time to compute thousands of numbers in a decent time:

```racket
(define (fibo x)
  (define (fib-iter x a b)
    (if (= x 0)
        a
        (fib-iter (sub1 x) b (+ a b))))
  (fib-iter x 0 1))
```

Next, I look up some other (more efficient) algorithms, and I ended up with two possible candidates: Fibonacci matrix multiplication and the fast doubling algorithm which is often used to compute the $n$-th term and its successor. (I know about Lucas numbers and the golden ratio too, but I wanted to try those specific algorithms.)

Here is my implementation of the later:

```racket
(define (fib n)
  (cond [(= n 0) 0]
        [(or (= n 1) (= n 2)) 1]
        [else (let* ([k (floor (/ n 2))])
                (if (even? n)
                    (* (fib k) (- (* 2 (fib (add1 k))) (fib k)))
                    (+ (expt (fib (add1 k)) 2) (expt (fib k) 2))))]))
```

The idea behind this algorithm relies on the following two relations, with further implications explained in [this post](https://chunminchang.github.io/blog/post/calculating-fibonacci-numbers-by-fast-doubling):

$$
\begin{array}{rcl}
F(2n) &=& F(n)\cdot\left( 2F(n+1)-F(n)\right) \cr
F(2n+1) &=& F(n)^2 + F(n+1)^2
\end{array}
$$

Here are some rough timing of the two algorithms, which clearly suggest that the simple approach is an order of magnitude faster compared to the more elaborated one when $n$ is small:

```
> (time (apply + (filter even? (map fib (range 0 1000)))))
cpu time: 251 real time: 253 gc time: 1
> (time (apply + (filter even? (map fibo (range 0 1000)))))
cpu time: 33 real time: 34 gc time: 1
```

However, the second approach remains much faster when it comes to computing a given term when, say, $n>10000$.

If you are interested in computing Fibonacci numbers using optimized algorithms, don't miss this thread on the Clojure Google group: [best fibo implementation under the new laziness?](https://groups.google.com/forum/#!topic/clojure/V6EvGg2rXhs). It refers to an algorithm (posted on `comp.lang.lisp`) which relies on Lucas numbers. The [most elegant solution](https://stackoverflow.com/a/628014) that I read so far was written by Rainer Joswig, who knowns quite a bit of CL, to say the least.

*Premature optimization is evil*: It doesn't cost much to reread the statement several times.
