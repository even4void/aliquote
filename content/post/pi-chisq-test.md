---
title: "A quick glance at the distribution of Pi digits"
date: 2023-11-20T22:20:03+01:00
draft: false
tags: ["lisp", "statistics"]
categories: ["2023"]
---

To follow up on my [previous post](/post/computing-pi-again), here is a quick investigation of the distribution of the digits of $\pi$, using a chi-squared test. Whether $\pi$ is a [normal number](https://en.wikipedia.org/wiki/Normal_number) is out of scope for this toy example. Don Knuth also discussed the use of Pearson $\chi^2$ test for studying random data in Vol. 2 of the TAOCP, _Seminumerical Algorithms_.

Let's count how many times each digits (0..9) appears in the first 1000 decimal places of $\pi$, as computed from the preceding post: (Note that we need to discard the very first digit in this case.)

```lisp
(defun times (lst elt)
  (count elt lst :test #'equal))

(defun explode (num)
  (map 'list #'digit-char-p (prin1-to-string num)))

(defparameter *data* (cdr (explode 31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989)))

(dotimes (n 10)
    (print n)
    (prin1 (times *data* n)))

;; 0 93
;; 1 116
;; 2 103
;; 3 102
;; 4 93
;; 5 97
;; 6 94
;; 7 95
;; 8 101
;; 9 106
;; nil
```

This doesn't seem too incompatible with a hypothesis of equidistribution in which case we would expect a value of 100 for each digit. Let's run a $\chi^2$ test, which compute the sum of the squared difference between observed and expected counts, standardized by the expected counts:

```lisp
(defun int-to-float (xs)
  (mapcar (lambda (x) (coerce x 'single-float)) xs))

(defparameter *xs* '(93 116 103 102 93 97 94 95 101 106))
(defparameter *expected* (/ (list-length *data*) (list-length *xs*)))
(defparameter *statistic* (apply #'+ (mapcar (lambda (x) (/ (expt (- x *expected*) 2) *expected*)) (int-to-float *xs*))))
;; => 4.7400002
```

To get the associated p-value, I will use Larry Hunter's legacy package, augmented by Jeff Shrager, which can be found, e.g., on [GitHub](https://github.com/mrc/lhstats).

```lisp
(require "asdf")
(asdf:load-asd "/home/chl/Documents/misc/lisp/lhstats/lhstats.asd")
(asdf:load-system :lhstats)
(- 1 (nth-value 0 (statistics::gamma-incomplete (* 0.5 9) (* 0.5 *statistic*))))
;; => 0.8563586405247742d0
```

And just when I finished drafting this post, I found this related study published by Rick Wicklin on the SAS blog: [Analyzing the first 10 million digits of pi: Randomness within structure](https://blogs.sas.com/content/iml/2015/03/12/digits-of-pi.html).

>  Researchers have run dozens of statistical tests for randomness on the digits of pi. They all reach the same conclusion. Statistically speaking, the digits of pi seems to be the realization of a process that spits out digits uniformly at random. <br> Nevertheless, mathematicians have not yet been able to prove that the digits of pi are random. One of the leading researchers in the quest commented that if they are random then you can find in the sequence (appropriately converted into letters) the "entire works of Shakespeare" or any other message that you can imagine (Bailey and Borwein, 2013).

{{% music %}}New Order • _Blue Monday_{{% /music %}}
