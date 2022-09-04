---
title: "Summing random Uniform deviates"
date: 2022-09-03T17:37:55+02:00
draft: false
tags: ["math", "scheme"]
categories: ["2022"]
---

[Chris Wellons] one asked the following question before providing some code to estimate the result, which I call brute force estimate but I do it a lot too:

> How many times should a random number from [0, 1] be drawn to have it sum over 1?

Here is my brute force approach using Scheme and recursion only:

```scheme
(import (chicken random))

(set-pseudo-random-seed! 101)

(let loop ((n 1)
           (sum 0))
  (cond ((> sum 1) sum)
        (else (loop (add1 n) (+ sum (pseudo-random-real))))))

;; => 1.77838275494088
```

A more involved solution using (typed) Racket and `for/fold` is discussed on [Stack Overflow].

How about the math? There are several solutions available on math.SO, [more] or [less] complicated. See also [this application]. In essence, the probability that the sum of $n$ variables is $> 1$ while the other $n - 1$ are $< 1$ is:

$$
\begin{equation}
\begin{aligned}
P(S > 1) & = \int_1^n P_{X_1 + \dots + X_n}(u)du - \int_1^n P_{X_1 + \dots + X_{n-1}}(u)du\cr
& = \left( 1 - \frac{1}{n!} \right) - \left( 1 - \frac{1}{(n-1)!} \right)\cr
& = \frac{1}{n(n-2)!}
\end{aligned}
\end{equation}
$$

Then it follows that $\sum_{n=1}^{\infty}nP(S > 1)$ is equal to $\sum_{n=1}^{\infty}\frac{1}{(n-2)!}$, or after simplification $e$.

{{% music %}}Bauhaus • _She's in Parties_{{% /music %}}

[chris wellons]: https://nullprogram.com/blog/2013/02/25/
[stack overflow]: https://stackoverflow.com/questions/8328564/efficient-random-number-list-sum-in-racket
[more]: https://math.stackexchange.com/q/111314/26851
[less]: https://math.stackexchange.com/q/214399/26851
[this application]: https://www.fourmilab.ch/documents/random_sum/
