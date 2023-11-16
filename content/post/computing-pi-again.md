---
title: "Computing Pi Again"
date: 2023-11-15T21:40:38+01:00
draft: true
tags: ["math", "lisp"]
categories: ["2023"]
---

Some time ago, I wrote about [computing Pi](/post/computing-pi/) using dedicated approximating formulae and continued fractions. TIL that the Corman Lisp distribution has an example of computing $\Pi$ to any number of decimal places. The [code](https://github.com/sharplispers/cormanlisp/blob/master/examples/pi.lisp) is shown below:

```lisp
(defun pi-atan (k n)
	(do* ((a 0)
      	  (w (* n k))
		  (k2 (* k k))
		  (i -1))
		((= w 0) a)
		(setq w (truncate w k2))
		(incf i 2)
		(incf a (truncate w i))
		(setq w (truncate w k2))
		(incf i 2)
		(decf a (truncate w i))))

(defun calc-pi (digits)
	(let* ((n digits)
		   (m (+ n 3))
		   (tenpower (expt 10 m)))
		(values
			(truncate
				(-
					(+ (pi-atan 18 (* tenpower 48))
					   (pi-atan 57 (* tenpower 32)))
					(pi-atan 239 (* tenpower 20)))
				1000))))
```

It works, and it's kinda fast for $n < 10^5$!

```lisp
CL-USER(4): (calc-pi 1000)

31415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989
```

As you may already have guessed, it relies on the use of arctan, which we covered in the aforementioned post. Briefly, the following expansion is used: $\sum_{n=0}^{\infty}\frac{(-1)^nx^{2n+1}}{2n+1}$ for $-1<x<1$, and we look for combination of arctan such that $\text{arctan}(1)=\pi/4$. In other words, the formula can be rewritten as:

$$ \pi = 4\sum\_{n=0}^{\infty}\frac{(-1)^nx^{2n+1}}{2n+1}\left( \text{something} \right). $$

Smaller "something" means faster convergence.[^1]

There are some magic numbers in the above code: 18, 57, etc. Where do they come from? There are [many formulae](https://mathworld.wolfram.com/PiFormulas.html), but this one is from Gauss:

$$ \pi = \sum\_{n=0}^{\infty}\frac{(-1)^n}{k}\left( 48\left(\frac{1}{18}\right)^k + 32\left(\frac{1}{57}\right)^k - 20\left(\frac{1}{239}\right)^k\right), $$

with $k=2n+1$. Other formulae are available on this [French blog post](http://pi314.net/fr/machin.php).

[^1]: Machin's formula ($\pi/4 = 4\text{arctan}(1/5) - \text{arctan}(1/239)$) is probably the easiest to use as it amounts to $\pi = \sum_{n=0}^{\infty}\frac{(-1)^n}{2n+1}\left( 4\left(\frac{1}{5}\right)^{2n+1} - \left(\frac{1}{239}\right)^{2n+1}\right)$.

{{% music %}}Monodrama • _Sarabande_{{% /music %}}
