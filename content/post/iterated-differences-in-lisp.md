---
title: "Iterated differences in Lisp"
date: 2026-11-07T19:54:33+01:00
draft: false
tags: ["lisp"]
categories: ["2026"]
---

This is a following post to yesterday's adventures with Folding in Mathematica.
Today I'll be using Common Lisp, listening to yet another album by [My Life With
The Thrill Kill Kult][1].

My original idea, which I wrote while browsing Mathematica's documentation on
Fold was to use CL equivalent (`reduce`) with an auxiliary list keeping track of
the last seen item and the running differences:[^1]

```lisp
(defun diff-one (xs)
  (if (null xs)
      nil
      (reverse 
       (cdr 
        (reduce (lambda (acc curr)
                  (let ((prev (car acc))
                        (diffs (cdr acc)))
                    (cons curr (cons (- curr prev) diffs))))
                (cdr xs)
                :initial-value (cons (car xs) nil))))))
```

This is more verbose than Mathematica code, of course. We can make it less so,
though. Should we were cheating, we would rely on the omnipotent `loop` macro:

```lisp
(defun diff-two (xs)
  (loop for (i j) on xs
        while j
        collect (- j i)))
```

A purely recursive solution using the `when` macro would also work in this case:

```lisp
(defun diff-three (xs)
  (when (cdr xs)
    (cons (- (cadr xs) (car xs))
          (diff-three (cdr xs)))))
```

My preferred solution, which I have had for years in a stat project which never
saw the light of day, like so many others, remains: shift the original list
leftwise, and then compute the difference between each pair of item from both
list; `mapcar` will stop once the shortest list has been read to its end. Here's
the one-liner:

```lisp
(defun diff-four (xs)
  (mapcar #'- (cdr xs) xs))
```

How about timing?

```lisp
(defparameter *values* (loop repeat 200 collect (random 30)))
(time (diff-one *values*))    ;; 0.000006 seconds of total run time
(time (diff-two *values*))    ;; 0.000004 seconds of total run time
(time (diff-three *values*))  ;; 0.000004 seconds of total run time
(time (diff-four *values*))   ;; 0.000006 seconds of total run time
```

The last solution is more or less how this routine is implemented in the
[Serapeum][2] package ([`deltas`][3]).

The venerable [XLispStat][4] has it too:

{{< figure src="/img/2026-11-08-09-36-08.png" >}}

### Sidenote

As for statistical applications, the mean of the squared successive differences
provides an estimate of [process variation][5] but it can also be used to assess
the randomness of chronologically ordered observations (e.g. time series data or
residuals from a regression model) by comparing its estimate with the variance
of the whole series -- this is the basis of von Neumann ratio test, and the
Durbin-Watson tests statistic for first-order serial correlation in residuals.
The [Bartels rank test][6] is the rank version of von Neumann's non parametric
test and it might be used to test the serial correlation or trend in an ordered
sample. A related test for randomness on binary events is the [Run test][7].

{{% music %}}My Life With The Thrill Kill Kult • *Leathersex*{{% /music %}}

[^1]: An equivalent version with `nreverse` is:

    ```
    (defun diff (xs)
      (if (null xs)
          nil
          (let ((init (cons (car xs) nil)))
            (nreverse 
              (cdr 
                (reduce (lambda (acc curr)
                  (let ((prev (car acc))
                       (diffs (cdr acc)))
                    (cons curr (cons (- curr prev) diffs))))
                  (cdr xs)
                  :initial-value init))))))
    ```

[1]: https://en.wikipedia.org/wiki/My_Life_with_the_Thrill_Kill_Kult
[2]: https://github.com/ruricolist/serapeum
[3]: https://github.com/ruricolist/serapeum/blob/541acbc3d2bc9fc06efce50d07766c7243b5f2b1/sequences.lisp#L1788
[4]: https://homepage.divms.uiowa.edu/~luke/xls/xlsinfo/
[5]: https://support.minitab.com/en-us/minitab/help-and-how-to/quality-and-process-improvement/control-charts/supporting-topics/estimating-variation/individuals-data/
[6]: https://www.tandfonline.com/doi/abs/10.1080/01621459.1982.10477764
[7]: https://en.wikipedia.org/wiki/Wald–Wolfowitz_runs_test
