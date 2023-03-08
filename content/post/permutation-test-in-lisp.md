---
title: "Permutation Test in Lisp"
date: 2023-03-08T09:26:56+01:00
draft: true
tags: []
categories: ["2023"]
---

In LispStat, we can compute the Mann-Whitney test statistic as follows:

```lisp
(defun rank' (xs)
  (let* ((rs (+ (rank xs) 1)))
    (dotimes (i (length xs))
      (if (> (length (which (= (nth i xs) xs))) 1)
          (setf (select rs (which (= (nth i xs) xs)))
                (repeat (mean (select rs (which (= (nth i xs) xs))))
                        (length (which (= (nth i xs) xs)))))))

(defun mw-test (xs)
  (let* ((x (car xs))
         (y (cdr xs))
         (n (length x))
         (xy (combine x y))
         (rs (rank' xy))
         (w (sum (select rs (iseq n)))))))
```

Let's test it using the following example data from R: Permeability constants of the human chorioamnion (a placental membrane) at term (x) and between 12 to 26 weeks gestational age (y). The alternative of interest is greater permeability of the human chorioamnion for the term pregnancy. (Hollander & Wolfe (1973), 69f.)

```lisp
(setf x '(1.83  0.50  1.62  2.48 1.68 1.88 1.55 3.06 1.30))
(setf y '(0.878 0.647 0.598 2.05 1.06 1.29 1.06 3.14 1.29))
(mw-test (list x y))
```

{{% music %}}XXX • _XXX_{{% /music %}}
