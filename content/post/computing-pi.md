---
title: "On computing Pi"
date: 2019-11-10T09:48:11+01:00
draft: false
tags: ["math", "mathematica"]
categories: ["2019"]
---

I am re-reading Melzak's *Companion to Concrete Mathematics*, and there's a section dedicated to $\pi$ (pp. 164–169). There are various formulas to approximate $\pi$ to a given precision, the first being probably the fraction 22/7, from Archimedes. This is only correct to three decimal places, so a better fractional approximation is 355/113 = 3.1415929, which is easy to memorize and probably the one we are first taught in (French) college (in addition to the mnemonic trick --- "que j'aime a faire apprendre ce nombre utile aux sages").

If you're familiar with the `bc` program, you will recall that it relies on the arc tangent. This follows from Leibniz's approximation, which starts with $\arctan x = x - x^3/3 + x^5/5 + \dots$, which yields $\pi/4 = 1 - 1/3 + 1/5 + \dots$ for $x = 1$. From this, there exists a variety of arctan-type formulas for $\pi$, e.g. $\pi/4 = \arctan\tfrac{1}{2} + \arctan\tfrac{1}{3}$ or  $\pi/4 = 5\arctan\tfrac{1}{7} + 2\arctan\tfrac{3}{79}$.[^1]

Let's try it in a Fish shell:

```
 echo "scale=11; 4*a(1)" | bc -l
3.14159265356
```

Of note, the `scale` parameter is quite important when a [high precision](https://www.johndcook.com/blog/2019/10/29/computing-pi-with-bc/) is required.

Another well-known formula, at least for $\LaTeX$ aficionado, is the following continued fraction, due to Brouncker:

$$ \frac{4}{\pi} = 1 + \frac{1^2}{2 + \frac{3^2}{2 + \frac{5^2}{2 + \dots}}} $$

Of course, many [more](http://mathworld.wolfram.com/PiFormulas.html) [approximations](http://mathworld.wolfram.com/PiApproximations.html) are available. Although Melzak notes that no hyperexponentially fast procedure[^2] appears to be known for computing $\pi$, there does exist [efficient algorithms](https://www.johndcook.com/blog/2011/03/14/algorithm-record-pi-calculation/) to compute $\pi$ to *n* exact figures. A short snippet of Python code is available in the case of the [Chudnovsky algorithm](https://en.wikipedia.org/wiki/Chudnovsky_algorithm), which remains the most efficient algorithm at the time of this writing. Scheme code is available on [Programming Praxis](https://programmingpraxis.com/2013/06/14/the-digits-of-pi-again/). Other iterative algorithms, like [Borwein's algorithm](https://en.wikipedia.org/wiki/Borwein%27s_algorithm), are also simple to implement in languages that offer support for large integers.

Note that this is only if you are interested in computing $\pi$ to a large number of decimal places since most PLs will provide you with built-in constants for $\pi$ or $\pi/2$. E.g., in C (using `clang` on macOS) $\pi$ is stored as a constant in `math.h`: `#define M_PI 3.14159265358979323846264338327950288`. This file is actually located under the command-line tools directory, that can be located using, e.g., `echo "#include <math.h>" | gcc -v -x c -`. Racket provides a double-precision flonum for $\pi$, but fractional approximations are used in various place the [math](https://github.com/racket/math/) library (e.g., 14488038916154245685/4611686018427387904 = 3.141592653589793).

Melzak provides two additional formulas to compute $\pi$ and $e^{-\pi}$, based on the theory of elliptic functions which is far beyond the scope of this short post. Those formulas are:


$$
\begin{align}
e^{-\pi} &= b + 2b^5 + 15b^9 +150b^{13} + 1707b^{17} + \dots \newline
\pi &= \log\frac{1}{b} - 2b^4 - 13b^8 - \frac{368}{3}b^{12} - \frac{2701}{2}b^{16} + \dots,
\end{align}
$$


with $b = \tfrac{1}{2}\frac{\sqrt[\leftroot{-1}\uproot{2}\scriptstyle 4]{2}-1}{\sqrt[\leftroot{-1}\uproot{2}\scriptstyle 4]{2}+1} = 0.0432136168629448960219378\dots$ It should be noted that the very first term, $\log\tfrac{1}{b}$, already gives $\pi$ correctly to five decimal places. Using Mathematica, I got the following result:

```
In[1]:= b = 1/2*(Power[2, (4)^-1] - 1)/(Power[2, (4)^-1] + 1)
In[2]:= N[b, 24]
Out[2]= 0.0432136168629448960219378
In[3]:= N[Log[1/b], 24]
Out[3]= 3.14159962823802109942254
In[4]:= N[Pi, 24]
Out[4]= 3.14159265358979323846264
```

As a side note, Mathematica also allows us to compute any terms of the continued fraction of $\pi$:[^3]

```
In[35]:= ContinuedFraction[Pi, 20]
Out[35]= {3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, 1, 1, 2, 2, 2, 2}
In[36]:= FromContinuedFraction[%]
Out[36]= 14885392687/4738167652
```



[^1]: Such formulas rely on the following identity, attributed to Dogson: if $qr = 1+p^2$, then $\arctan\tfrac{1}{p} = \arctan\tfrac{1}{p+q} + \arctan\tfrac{1}{p+r}$. This identity was also proposed by Euler, who further demonstrated that $\arctan\tfrac{m}{n} = \frac{mn}{m^2+n^2}\left[ 1 + \frac{2}{3}\frac{m^2}{m^2+n^2} +  \frac{2\cdot 4}{3\cdot 5}\left(\frac{m^2}{m^2+n^2}\right)^2 + \dots \right]$.
[^2]: A numerical procedure is said to be exponentially fast if for large $n$, $E^n\sim c^n$ for some $c$, $0 < c < 1$. An *hyperexponentially fast procedure* is one for which $E_n\sim c^{n^{\alpha}}$ for some $c$, $0 < c < 1$ and $\alpha > 1$.
[^3]: To compute the continued fraction of a number $x$, use the recurrence $a_0 = x$ and $a_n = (a\_{n-1} - \lfloor a\_{n_1} \rfloor)^{-1}$; the $n$th term will be $\lfloor a_n \rfloor$. Consider the precision of 20 digits illustrated above, we have: $n=0$, $a_n = 3.1415926535897932385$ and $d_n = 3$; $n=1$, $a_n = 0.1415926535897932385^{-1}=7.06251330593104577$ and $d_n = 7$; $n=2$, $a_n = 06251330593104577^{-1} = 15.9966$ and $d_n=15$; etc.
