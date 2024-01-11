---
title: "Permutation test in Lisp (con't)"
date: 2024-01-11T09:26:56+01:00
draft: true
tags: ["clojure", "statistics"]
categories: ["2024"]
---

Yet another way to carry out a permutation test as we did in [another post](/post/permutation-test-in-lisp). This time, we will simply shuffle the whole sequence of observation and take the first half part of the sequence. Moreover, this time we will rely on a Monte Carlo approach and only carry out a limited number of random draws from the original sample. Last but not least, we will replace Scheme with Clojure.

As before, we will consider the sum of the observations in one group (the original, then the randomized one) as our test statistic. Other solutions such as taking the difference in means or the detrended Student t statistic are also possible.

```clojure
(def xs [12.9 13.5 12.8 15.6 17.2 19.2 12.6 15.3 14.4 11.3])
(def ys [12.7 13.6 12.0 15.2 16.8 20.0 12.0 15.9 16.0 11.1])
(def xy (concat xs ys))
(def stat0 (apply + xs))
(def k 1000)
(defn stat [x] (apply + (take 10 (shuffle x))))
(def pdist (repeatedly k (partial stat xy)))
(def events (count (filter (fn [x] (> x stat0)) pdist)))
(double (/ events k))
;; => 0.525
```

Run time is quite decent in this case, even for large `k`. Now let's check the distribution of the permuted test statistic? Here's one with 10000 iterations (p=0.5156) and the venerable Gnuplot backend.[^1]

```shell
set terminal png size 600, 300
set output "~/tmp/pdist.png"
set xrange [130:165]
set yrange [0:7]
unset key
unset ytics
set arrow 1 from 144.8,0 to 144.8,0.8 lc "orange" nohead
set label "Original test statistic" at 145,0.75 tc "orange"
plot "pdist.dat" u 1:(1/100.) s kdens bandwidth 1 lw 2
```

![img](/img/pdist.png)

Overall, I was pleasantly surprised by how easy it was to perform this task in Clojure by using builtin stuff only.

[^1]: ot sure how to properly export the lazy sequence into a text file, so I'll be using `(spit "/home/chl/tmp/pdist.dat" (vec pdist))` but I need to remove the enclosing bracket afterwards and replace space with carriage return to please Gnuplot. The final file is available [here](/pub/pdist.dat).
