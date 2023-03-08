---
title: "Wilcoxon test in LispStat"
date: 2023-03-08T18:33:21+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2023"]
---

As a sequel of this previous post, [Mann Whitney test](/post/mann-whitney/), let's revisit the Wilcoxon test for independant or paired sample. In the case of paired sample, it amounts to a one-sample test, as is the case of Student t-test, since we can simply consider the signed difference between the two series of observations. The only difference with the parametric approach is that we will work with the rank of each observation, rather their raw value.

Unfortunately, there's almost zero standard function for classical test of hypothesis in LispStat. Most of user-friendly statistical routines were implemented seprately for the [Vista](https://www.visualstats.org/) or [Arc](https://www.stat.umn.edu/arc/) statistical packages. There once was a dedicated repository for xlispstat on the UCLA server, but now there's only the CMU library of code which contains LispStat-related routines (when their server is not down). So let us roll our own routine.

Regarding the Wilcoxon family of non-parametric tests, the subtleties are mainly about handling tied values, and using an approximate or exact distribution, which also means dealing with continuity correction. Note that Stata, SPSS, SAS, or Mathematica, as far as I can tell, do not offer continuity correction.

LispStat has a `rank` function, but unfortunately it does not compute the average rank in case of ties. Here is an improved version which return average rank for ties: (Note that rank indexing start at 1 and not 0 as in LispStat's `rank`.)

```lisp
(defun rank2 (xs)
  (let* ((rs (+ (rank xs) 1)))
    (dotimes (i (length xs))
      (if (> (length (which (= (nth i xs) xs))) 1)
          (setf (select rs (which (= (nth i xs) xs)))
                (repeat (mean (select rs (which (= (nth i xs) xs))))
                        (length (which (= (nth i xs) xs)))))))
    rs))

(setf x '(1 2 4 3 2 5))
(rank2 x)
;; => (1 2.5 5 4 2.5 6)
```

There's more than one way to compute the Wilcoxon-Mann-Whitney test statistic, which is labelled either as U (SPSS & Co.) or W (R), statistic (Python) or TestStatistic (Mathematica), or directly as a standard normal quantile (Stata). The first two naming schemes usually refer to a rank sum test [shifted by $n_1(n_1+1)/2$ or not](https://stats.stackexchange.com/a/65873).

For this illustraton, we will compute the Mann-Whitney test statistic as follows:

```lisp
(defun wilcoxon-test (data)
  (let* ((x1 (car data))
         (x2 (cdr data))
         (n1 (length x1))
         (n2 (length x2))
         (n (min n1 n2))
         (xs (combine x1 x2))
         (rs (rank2 xs))
         (r nil))
    (setf rs (list (select rs (iseq n1))
                   (select rs (iseq n1 (1- (+ n1 n2))))))
    (setf r (if (>= n1 n2) (sum (first rs))
                (sum (nth 1 rs))))
    (min (abs (list r (- (* n (1- (+ n1 n2))) r))))))
```

Let's test this implementation using an example taken from R. The two series shown below summarize permeability constants of the human chorioamnion (a placental membrane) at term (x) and between 12 to 26 weeks gestational age (y). The alternative of interest is greater permeability of the human chorioamnion for the term pregnancy (Hollander & Wolfe (1973), 69f.).

```lisp
(setf x '(1.83  0.50  1.62  2.48 1.68 1.88 1.55 3.06 1.30))
(setf y '(0.878 0.647 0.598 2.05 1.06 1.29 1.06 3.14 1.29))
(wilcoxon-test (list x y))
```

As a sidenote, here are the results I got for the same dataset using other statistical packages:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Software</em></td>
<td><em>Test statistic</em></td>
<td><em>P-value</em></td>
</tr>
<tr><td>R</td><td></td><td></td></tr>
<tr><td>Python</td><td></td><td></td></tr>
<tr><td>Mathematica</td><td></td><td></td></tr>
<tr><td>SAS</td><td></td><td></td></tr>
</tbody>
</table>
</small>

{{% music %}}XXX • _XXX_{{% /music %}}
