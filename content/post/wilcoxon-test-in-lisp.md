---
title: "Wilcoxon test in LispStat"
date: 2023-03-08T15:33:21+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2023"]
---

As a sequel of this previous post, [Mann Whitney test](/post/mann-whitney/), let's revisit the Wilcoxon test for independant or paired sample. In the case of paired sample, it amounts to a one-sample test, as is the case of Student t-test, since we can simply consider the signed difference between the two series of observations. The only difference with the parametric approach is that we will work with the rank of each observation, rather their raw value.

LispStat has a `rank` function, but unfortunately it does not compute the average rank in case of ties. Moreover, there's almost zero standard function for classical test of hypothesis in LispStat, so we must roll our own.

We can compute the Mann-Whitney test statistic as follows:

```lisp
(defun rank2 (xs)
  (let* ((rs (+ (rank xs) 1)))
    (dotimes (i (length xs))
      (if (> (length (which (= (nth i xs) xs))) 1)
          (setf (select rs (which (= (nth i xs) xs)))
                (repeat (mean (select rs (which (= (nth i xs) xs))))
                        (length (which (= (nth i xs) xs)))))))
    rs))

(defun wilcoxon-test (xs)
  (let* ((x (car xs))
         (y (cdr xs))
         (n (length x))
         (xy (combine x y))
         (rs (rank2 xy))
         (w (sum (select rs (iseq n)))))
    w))
```

Let's test it using the following example data from R: Permeability constants of the human chorioamnion (a placental membrane) at term (x) and between 12 to 26 weeks gestational age (y). The alternative of interest is greater permeability of the human chorioamnion for the term pregnancy. (Hollander & Wolfe (1973), 69f.)

```lisp
(setf x '(1.83  0.50  1.62  2.48 1.68 1.88 1.55 3.06 1.30))
(setf y '(0.878 0.647 0.598 2.05 1.06 1.29 1.06 3.14 1.29))
(mw-test (list x y))
```

{{% music %}}XXX • _XXX_{{% /music %}}
