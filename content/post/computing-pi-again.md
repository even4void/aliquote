---
title: "Computing Pi Again"
date: 2023-11-15T21:40:38+01:00
draft: false
tags: ["math", "lisp"]
categories: ["2023"]
---

Some time ago, I wrote about [computing Pi](/post/computing-pi/) using dedicated approximating formulae and continued fractions. TIL that the Corman Lisp distribution has an example of computing $\Pi$ to any number of decimal places. The [code](https://github.com/sharplispers/cormanlisp/blob/master/examples/pi.lisp) (MIT license) is shown below:

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

3141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647
0938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652
7120190914564856692346034861045432664821339360726024914127372458700660631558817488152092096282925409171536436789259036001
1330530548820466521384146951941511609433057270365759591953092186117381932611793105118548074462379962749567351885752724891
2279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005
6812714526356082778577134275778960917363717872146844090122495343014654958537105079227968925892354201995611212902196086403
4418159813629774771309960518707211349999998372978049951059731732816096318595024459455346908302642522308253344685035261931
1881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268
066130019278766111959092164201989
```

As you may already have guessed, it relies on the use of arctan, which we covered in the aforementioned post.

The following expansion is used: $\sum_{n=0}^{\infty}\frac{(-1)^nx^{2n+1}}{2n+1}$ for $-1<x<1$, and we look for combination of arctan such that $\text{arctan}(1)=\pi/4$. In other words, the formula can be rewritten as:

$$ \pi = 4\sum\_{n=0}^{\infty}\frac{(-1)^nx^{2n+1}}{2n+1}\left( \text{something} \right). $$

Smaller "something" means faster convergence.[^1]

There are some magic numbers in the above code: 18, 57, etc. Where do they come from? There are [many formulae](https://mathworld.wolfram.com/PiFormulas.html), but this one is from Gauss:

$$ \pi = \sum\_{n=0}^{\infty}\frac{(-1)^n}{k}\left( 48\left(\frac{1}{18}\right)^k + 32\left(\frac{1}{57}\right)^k - 20\left(\frac{1}{239}\right)^k\right), $$

with $k=2n+1$. Other formulae are available on this [French blog post](http://pi314.net/fr/machin.php).

Note that in the GitHub repository, you will also find some sieves for prime numbers.

[^1]: Machin's formula ($\pi/4 = 4\text{arctan}(1/5) - \text{arctan}(1/239)$) is probably the easiest to use as it amounts to $\pi = \sum_{n=0}^{\infty}\frac{(-1)^n}{2n+1}\left( 4\left(\frac{1}{5}\right)^{2n+1} - \left(\frac{1}{239}\right)^{2n+1}\right)$.

{{% music %}}Monodrama • _Sarabande_{{% /music %}}
