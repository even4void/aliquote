---
title: "NewLISP and memoization"
date: 2022-07-26T11:37:04+02:00
draft: false
tags: ["lisp"]
categories: ["2022"]
---

Surely, the Fibonacci recursive algorithm that is presented everywhere serves no purpose other than introducing the recursive way of thinking,[^1] but anyway I'm here at writing another snippet of Lisp code to compute Fibonacci numbers. The real problem with those algorithms is that we are going to compute the same value over and over again. One solution is to rely on memoization, and in a [previous post] I discussed how to do so in Racket.

Using typed Racket, I wrote:

```scheme
(: fib (-> Integer Integer))
(define fib (memoize (lambda ([n : Integer])
                        (if (< n 2) 1
                            (+ (fib (- n 1))
                               (fib (- n 2)))))))
```

Now, it appears that newLISP, which I'm playing with for the Summer, also comes with a [memoization macro]:[^2]

```commonlisp
(define-macro (memoize mem-func func)
    (set (sym mem-func mem-func)
        (letex (f func c mem-func)
          (lambda ()
              (or (context c (string (args)))
              (context c (string (args)) (apply f (args))))))))

(define (fibo n)
    (if (< n 2)  1
        (+  (fibo (- n 1))
            (fibo (- n 2)))))

(memoize fibo-m fibo)
```

The later expands to:

```commonlisp
(lambda-macro (mem-func func) (set (sym mem-func mem-func)
  (letex (f func c mem-func) (lambda () (or (context c (string (args))) (context
      c
      (string (args))
      (apply f (args))))))))
(lambda (n)
 (if (< n 2)
  1
  (+ (fibo (- n 1)) (fibo (- n 2)))))
(lambda () (or (context fibo-m (string (args))) (context fibo-m (string (args)) (
    apply fibo
    (args)))))
```

Benchmarking both functions is shown below:

```commonlisp
> (time (fibo 30))
339,198
> (time (fibo-m 30))
320,943
> (time (fibo-m 30))
0,012
```

The execution time is almost instantaneous on the second run. Note, however, that it does not affect the first run, ince it first need to use a dedicated namespace to store intermediate results from recursive function calls.

{{% music %}}Cigarettes After Sex • _Dreaming Of You_{{% /music %}}

[^1]: The same applies to the factorial, see, e.g., [what's up with the factorial ?](https://eli.thegreenplace.net/2004/08/05/whats-up-with-the-factorial)
[^2]: The online documentation of NEWlisp reports that "when memoizing recursive functions, include the raw lambda specification of the function so recursive calls are memoized too", which is what we did in our Racket example.

[previous post]: /post/on-memoization
[memoization macro]: http://www.newlisp.org/downloads/CodePatterns.html#toc-5
