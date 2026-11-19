---
title: "Tribonacci numbers in Lisp"
date: 2026-11-15T18:03:40+01:00
draft: false
tags: ["math", "lisp"]
categories: ["2026"]
---

In a [previous post][1] we used discrete Markov chains and finally recurrence
relation to find the probability of hitting two heads before another player get
three heads in a row.

Here's a small Lisp function that computes Tribonacci numbers using generalized
Binet's formula rather than linear recurrence relations (with or without
memoization):

```lisp
(defun trib-number (n)
  ;; Compute Tribonacci number using Binet generalized formula
  (declare (type (integer 0 *) n))
  (let* ((s (sqrt 33.0d0))
         (a (expt (+ 19.0d0 (* 3.0d0 s)) 1/3))
         (b (expt (- 19.0d0 (* 3.0d0 s)) 1/3))
         (alpha (/ (+ 1.0d0 a b) 3.0d0))
         (denom (- (* 3.0d0 (expt alpha 2))
                   (* 2.0d0 alpha)
                   1.0d0)))
    (values (round (/ (expt alpha n) denom)))))
```

Nothing fancy. We could use a more detailed formula, see below, but for now all
we do is to ensure that we work using double precision to preserve precision as
much as possible.[^1] More involved formulae using, e.g., matrix exponentiation
do exist, though. 

Let $T_0 = 0$, $T_1 = 0$, $T_2 = 1$, with $T_n = T_{n-1} + T_{n-2} + T_{n-3}$.
Binet's formula reads:

$$
T_{n} = \frac{\alpha^{n}}{(\alpha - \beta )(\alpha - \gamma )}
          + \frac{\beta^{n}}{(\beta - \alpha )(\beta - \gamma )}
          + \frac{\gamma^{n}}{(\gamma - \alpha )(\gamma - \beta )}.
$$

Parameters $\alpha$, $\beta$ and $\gamma$ are the three roots of the polynomial
$x^3 - x^2 - x - 1 = 0$. Among those parameters, $\alpha$ is the only real root
and it equals 1.83929, approximately. The exact value can be obtained using
Cardan's formula,
$\alpha = \frac{1 + \sqrt[3]{19 + 3\sqrt{33}}+\sqrt[3]{19 - 3\sqrt{33}}}{3}$,
which is what we used above. The two other roots are conjugate complex with
modulus $\vert{}\beta\vert{} = \vert{}\gamma\vert{} \approx 0.73735$.

When $n$ is large, we can simplify things a bit by just rounding the very first
term of the formula to the nearest integer:

$$
  T_{n}
  = \left\lfloor \frac{\alpha^{n+1}}{\alpha^{2} + 4\alpha - 1} \right\rceil \quad \text{or\ equivalently}\quad T_{n}
  = \left\lfloor \frac{\alpha^{n}}{-\alpha^{2} + 4\alpha - 1} \right\rceil.
$$

Since $\alpha^3 = \alpha^2 + \alpha + 1$, the denominator
$(\alpha - \beta)(\alpha - \gamma)$ reduces to $3\alpha^2 - 2\alpha - 1$, and we
have:

$$
  T_{n}
  = \left\lfloor \frac{\alpha^{n}}{3\alpha^{2} - 2\alpha - 1} \right\rceil.
$$

```lisp
(loop for i from 0 to 14
      collect (tribonacci-binet i))
;; => (0 0 1 1 2 4 7 13 24 44 81 149 274 504 927)
```

This seems to [work nicely][3].

{{% music %}}Lamb • *Gabriel*{{% /music %}}

[^1]: This is limited to the $n \leq 57$ case since even when $T_n$ fits in
    less than 53 bits or $\approx 9.10^{15}$ there's still some error
    propagation that amplifies rounding approximation. See also [Tribonacci
    numbers that are palindromic concatenations of two distinct repdigits][2]

[1]: /post/two-heads-vs-three/
[2]: https://arxiv.org/abs/2610.15770
[3]: https://oeis.org/A000073
