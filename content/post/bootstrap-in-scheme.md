---
title: "Bootstrap resampling using Scheme"
date: 2022-09-18T10:34:29+02:00
draft: false
tags: ["scheme", "statistics"]
categories: ["2022"]
---

In a [previous post], we discussed bootstrap resampling in Lisp, using LispStat. Let's revisit the idea of the bootstrap using Chicken Scheme.

Recall the nonparametric bootstrap algorithm:

1. Let $X = (x_1, x_2, \dots, x_n)$ be a sample of i.i.d observations.
2. Generate $B$ random samples of size $n$ by drawing with replacement from $X$. Let call those new samples $\{X_1^{\star}, X_2^{\star},\dots, X_B^{\star}\}$.
3. Consider a statistic $S(X)$, which may be any estimator, test statistic or average prediction for instance. Any aspect of the distribution of $S(X)$ may be assessed from the distribution of the bootstrap samples directly, $\{S(X_1^{\star}), S(X_2^{\star}),\dots, S(X_B^{\star})\}$.

The variance of the bootstrap estimate, $\mathbb{V}[S(X)]$ is then:

$$ \mathbb{\widehat V}[S(X)] = \frac{1}{B-1}\sum\_{b=1}^B\left(S(X_b^{\star}) - \bar S^{\star}\right)^2. $$

where $\bar S^{\star}$ is the bootstrap sample mean, $\frac{1}{B}\sum_{b=1}^BS(X_b^{\star})$.

Basically, we need a way to (1) shuffle (with replacement) a list of indices (the observation index in a list or vector) _or_ to shuffle the data values directly, then (2) call the same function on $B$ random lists, and finally (3) compute a sum (or any other test statistic). Below is some Chicken Scheme code.

To pick a random element from a list, one can use (replace `pseudo-random-integer` with `random` if you are using Racket), the following lambda will do the job:

```scheme
(import (chicken random))

(lambda (x) (list-ref x (pseudo-random-integer (length x))))
```

Let's test it:

```scheme
(define xs '(1 2 3 4 5 6 7 8 9 10))

(list-ref xs (pseudo-random-integer (length xs)))
;; => 9
```

Of course, your result will likely be a different one, since I don't use a fixed seed for the PRNG. To repeat the same call to the above procedure, `pick` say, `(length xs)` times we can use a simple iterator:

```scheme
(define (pick x) (list-ref x (pseudo-random-integer (length x))))

(define len (length xs))

(let loop ((n 1)
           (rs '()))
  (cond ((> n len) rs)
        (else (loop (add1 n) (cons (pick xs) rs)))))
;; => (6 6 9 4 8 3 4 2 4 10)
```

Since we sample with replacement, it is normal to expect some duplicates since the [average bootstrap sample] omits 36.8% of the original sample.

Everything is now in place. We just need to add one more outer loop to build $n$-samples $k$ times.

Let's first get some data:

```scheme
(import (chicken io))

(define fs "/home/chl/Documents/work/tutors/CESAM/cours/Stata/birthwt2.csv")

(define data (call-with-input-file fs (lambda (p) (read-lines p))))
```

The above is quite rudimentary and return a list of strings, with the header as the first element. We don't really need the header, and we want to keep birth weight (`bwt`), which is the last numerical value. To parse the data, we will split each string on a comma, using Chicken `string-split`,[^1] and extract the `bwt` value. Here is how it works:

```scheme
(import (chicken string))

(car (reverse (string-split (list-ref (cdr data) 0) ",")))
;; => 2523
```

Now, we just have to iterate over the whole list. We'll be using `map` instead of `for-each` since we want to build a list of values along the way:

```scheme
(define (value xs)
  (string->number (car (reverse (string-split xs ",")))))

(define bwt (map value (cdr data)))
```

And, now the core algorithm for the bootstrap (I will only compute the sum of the values, since it is a sufficient statistic in this case). Note that I converted the preceding named loop to a currying function:

```scheme
(define (curry n f)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x) (f ((curry (- n 1) f) x)))))

(define (sample xs)
  (if (null? xs)
      '()
      ((curry (length bwt) (lambda (xs) (cons (pick bwt) xs))) '())))

(define (boot xs b)
  (let loop ((n 1) (rs '()))
    (cond ((> n b) rs)
          (else (loop (add1 n) (cons (apply + (sample xs)) rs))))))

(boot bwt 20)
;; => (562214 564519 548880 544008 569931 587845 564206 558517 546902 555674 544962 554010 560677 559470 548108 533815 556976 548125 571216 575198)
```

Done.

From there on, it is not really diffcult to write a full standalone procedure for bootstraping a test statistic, especially since Chicken Scheme provides some basic summary statistic in the [statistics] module. In a future post, I will show how to compute a 95% confidence interval for a correlation coefficient, and compare this estimate with the asymptotic CI computed using [Fisher]'s z transformation.

{{% music %}}The Durutti Column • _Experiment in Fifth_{{% /music %}}

[^1]: See also `string-tokenize` (SRFI-13).

[previous post]: /post/bootstraping-lisp/
[statistics]: https://wiki.call-cc.org/eggref/5/statistics
[fisher]: https://en.wikipeadia.org/wiki/Fisher_transformation
[average bootstrap sample]: https://blogs.sas.com/content/iml/2017/06/28/average-bootstrap-sample-omits-data.html
