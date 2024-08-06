---
title: "Wilcoxon test in Lisp"
date: 2023-03-14T18:33:21+01:00
draft: false
tags: ["lisp", "statistics"]
categories: ["2023"]
---

As a sequel of this previous post, [Mann Whitney test](/post/mann-whitney/), let's revisit the Wilcoxon-Mann-Whitney test for independent samples. In the case of paired samples, it amounts to a one-sample test, as is the case of Student t-test, since we can simply consider the signed difference between the two series of observations. The only difference with the parametric approach is that we will work with the rank of each observation, rather their raw value.

Unfortunately, there's almost zero standard function for classical test of hypothesis in LispStat. Most of user-friendly statistical routines were implemented separately for the [Vista](https://www.visualstats.org/) or [Arc](https://www.stat.umn.edu/arc/) statistical packages. There once was a dedicated repository for xlispstat on the UCLA server, but now there's only the CMU library of code which contains LispStat-related routines (when their server is not down). So let us roll our own routine.

Regarding the Wilcoxon family of non-parametric tests, the subtleties are mainly about handling tied values, and using an approximate or exact distribution, which also means dealing with continuity correction. Note that Stata, SPSS, SAS, or Mathematica, as far as I can tell, do not offer continuity correction.[^1]

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

There's more than one way to report results from a Wilcoxon-Mann-Whitney, and the test statistic is usually labelled either as U (SPSS & Co.) or W (R), statistic (Python) or TestStatistic (Mathematica), or directly as a standard normal quantile ($z$, in Stata). Even the definition of the test itself (Wilcoxon rank sum or Mann-Whitney test) is not clear, as noted in the R on-line help for `wilcox.test`. Similar comments are made in Stata manuals, or by the author of the Haskell's [statistics](https://hackage.haskell.org/package/statistics) package.

Hence, it may happen that only the sum of ranks is reported, or the sum of ranks minus a correction factor ($n_{\star}(n_{\star}+1)/2$, where $\star$ denotes the index for the first or second group[^2]), which is the case of the first two naming schemes (although, technically, U is the shifted version of the test statistic), while the $z$ value refers to the standardized test statistic that follows a normal distribution.[^3] Assuming $n_1 < n_2$, we define $W_R$ the sum of the ranks assigned to the $n_1$ observations in the first sample. Critical values for this statistic for small $n$ can be used.[^4] When $\text{min}(n_1, n_2) > 10$, we use the following Gaussian approximation:

$$ Z = \frac{W_R-\mu\_{W_R}}{\sigma\_{W_R}}, $$

where $\mu_{W_R} = \frac{n_1(n+1)}{2}$ and $\sigma_{W_R} = \sqrt{\frac{n_1n_2(n+1)}{12}}$ ($n = n_1+n_2$). The formula for the variance is only valid in the case of large samples, though. A corrected estimate, based on Fisher's randomization principles, is $\sqrt{n_1n_2s^2/n}$ with $s=\frac{1}{n-1}\sum_{i=1}^n(r_i - \bar r)^2$, which remains valid even in case of tied ranks, see the Stata [R] manual.

For this illustration, we will compute the Mann-Whitney test statistic as follows. This mostly follows the R's way since I got lost with Stata's formula:[^5]

```lisp
(defun duplicates (xs)
  ;; https://stackoverflow.com/a/65788371
  (if (endp xs)
      '()
      (let ((count (count-if #'(lambda (x) (eql x (car xs))) xs)))
        (cons count (duplicates (nthcdr count xs))))))

(defun wilcoxon-test (data)
  (let* ((n1 (length (nth 0 data)))
         (n2 (length (nth 1 data)))
         (n (+ n1 n2))
         (rs (rank2 (combine data)))
         (nties (duplicates (combine data)))
         (w nil)
         (z nil)
         (p nil))
    (setf tobs (sum (select rs (iseq n1))))
    (setf w (- tobs (/ (* n1 (1+ n1)) 2)))
    (setf mu (* n1 (/ n2 2)))
    (setf sigma (sqrt (* (* n1 (/ n2 12))
                         (- (+ n1 n2 1)
                            (/ (sum (mapcar #'- (^ nties 3) nties))
                               (* (+ n1 n2) (+ n1 (- n2 1))))))))
    (setf z (/ (- w mu) sigma))
    (setf p (* 2 (- 1 (normal-cdf (abs z)))))
    (list w z p)))
```

Note that we do adjust the estimate of variance for the case of tied ranks, as does R or as described on [Wikipedia](https://en.wikipedia.org/wiki/Mann%E2%80%93Whitney_U_test#Normal_approximation_and_tie_correction), which in this case implies using a different formula for $\mu_{W_R}$ ($\frac{n_1n_2}{2}$). However, if there's no tied values, `nties` contains only 1's values and `(sum (mapcar #'- (^ nties 3) nties))` = 0, which means the correction term has no effect and $\sigma = \sqrt{n_1n_2/12 \times (n_1+n_2-1)}. The rest msotly agrees with R intermediate computation.[^7]

Let's test this implementation using an example taken from R. The two series shown below summarize permeability constants of the human chorioamnion (a placental membrane) at term (x) and between 12 to 26 weeks gestational age (y). The alternative of interest is greater permeability of the human chorioamnion for the term pregnancy (Hollander & Wolfe (1973), 69f.). For simplicity, and because we only implemented a bilateral test, we will consider a two-sided p-value:

```lisp
(setf x '(0.80 0.83 1.89 1.04 1.45 1.38 1.91 1.64 0.73 1.46))
(setf y '(1.15 0.88 0.90 0.74 1.21))
; (sum (first-n (length x) (rank2 (combine x y))))
(sum (select (rank2 (combine x y)) (iseq (length x))))
;; => 90
(wilcoxon-test (list x y))
;; => (35 1.224744871391589 0.22067136191984682)
```

{{< figure src="/img/fig-mann-whitney-hollander.png" >}}

Here are the results I got for the same dataset with other statistical packages, using default parameters:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Software</em></td>
<td><em>Test statistic</em></td>
<td><em>P-value</em></td>
</tr>
<tr><td>R</td><td>35</td><td>0.2544</td></tr>
<tr><td>Python</td><td>35</td><td>0.2544</td></tr>
<tr><td>Stata</td><td>1.225</td><td>0.2207</td></tr>
<tr><td>Mathematica</td><td>35</td><td>0.2446</td></tr>
</tbody>
</table>
</small>

As a final remark, the Wilcoxon-Mann-Whitney is technically a permutation test, at least in the case of not too large sample size, as we've seen above. This means it is valid only when all the rearrangements of the data are equally likely under the null. When the variances differ, the test is no longer a test for the difference in location, strictly speaking.

{{% music %}}Adele • _All Night Parking_{{% /music %}}

[^1]: Stata does offer a continuity correction for the median test, though.
[^2]: Once you determined the sum of ranks in one group, you get the sum of ranks for the other group since the sum of all ranks equals $N(N+1)/2$, with $N=n_1+n_2$, so it doesn't really matter which group we base our calculation upon (usually, we take the first or the smallest in size).
[^3]: Indrayan, A. and Malhotra, R.K., _Medical Biostatistics_ (4th ed.), CRC Press, 2018.
[^4]: Wilcoxon, F., and Wilcox, R.A., Some Rapid Approximate Statistical Procedures, Lederle Laboratories, 1964.
[^5]: If I read the formulae correctly, this should work:

        (setf mu (/ (* n1 (1+ n)) 2))
        (setf ss (standard-deviation rs))
        (setf sigma (sqrt (/ (* n1 n2 (* ss ss)) n)))
        (setf z (/ (- tobs mu) sigma))

[^6]: R code from `getAnywhere(wilcox.test.default)`:

        --8<--------
        r <- c(x - mu, y)
        r <- rank(if (is.finite(digits.rank))
            signif(r, digits.rank)
        else r)
        n.x <- as.double(length(x))
        n.y <- as.double(length(y))
        if (is.null(exact))
            exact <- (n.x < 50) && (n.y < 50)
        STATISTIC <- c(W = sum(r[seq_along(x)]) - n.x * (n.x +
            1)/2)
        -------->8--

[^7]: We see that $W_X = 3 + 4 + 14 + 7 + 11 + 10 + 15 + 13 + 1 + 12 = 90 $. The sum of all ranks equals 120. Inspecting the relevant R code for `wilcox.test`,[^6] it is clear that they use the corrected statistic $W_X - n_X(n_X+1)/2$, hence $W = 90 - 10\times 11/2 = 35 $ ($10\times 11/2$ is the sum of ranks we would get for $X$ should we compute rank separately in $X$ and $Y$).
