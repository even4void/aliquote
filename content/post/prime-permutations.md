---
title: "Prime permutations"
date: 2019-12-08T10:47:19+01:00
draft: false
tags: ["math", "euler", "python"]
categories: ["2019"]
---

I recently subscribed to the [n-Category Café](https://golem.ph.utexas.edu/category/) RSS feed, and I really enjoyed the last posts on random permutations. For instance, I learned that the distribution of the number of cycles of length *k*  in a a random permutation of an *n*-element set, thought of as a random variable, follow a Poisson distribution with mean 1/*k* as $n\to \infty$. Go read the rest of the [post](https://golem.ph.utexas.edu/category/2019/12/random_permutations_part_7.html) if you want to learn more interesting facts on random permutations.

That being said, there's a lot more to see regarding permutations in Knuth's artwork, of course, especially in the TAOCP, vol. 4 (ex [pre-fascicle 2B](http://www.kcats.org/csci/464/doc/knuth/fascicles/fasc2b.pdf)), for which there exist some efficient [Python solutions](https://stackoverflow.com/a/30428753) (or even the [Steinhaus-Johnson-Trotter](https://rosettacode.org/wiki/Permutations_by_swapping) algorithm). However, I recently stumbled upon the following problem on the Euler project. The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another. There exists a 4-digit increasing sequence, and the question is: What 12-digit number do you form by concatenating the three terms in this sequence?

Here is my solution, which is heavily inspired by some of the solutions I found online in Haskell, Python or Lisp dialects:

```python
from sympy import isprime


def isperm(a, b):
    return sorted(str(a)) == sorted(str(b))


a, f = 1487, 1
d = 3330
while True:
    a += 3-f
    f = -f
    b, c = a+d, a+2*d
    if all(elt is True for elt in map(isprime, [a, b, c])) and \
       isperm(a, b) and isperm(b, c):
        break

print(str(a)+str(b)+str(c))
```

I had a great time at writing the above  `if`  statement, because of the way Python can be used to write concise iterators while allowing [functional geekery](/post/python-getting-functional) using `map`. I didn't implement a Sieve for finding prime numbers since I believe the `sympy` package provides a very efficient ones. There are very clever implementations on Stack Overflow, though. Note that the last expression could be rewritten as `''.join(map(str, [a, b, c]))`. The  logic behind the above code is quite simple: we generate prime candidates, `a`, `b`, and `c`, starting with `a=1487`, and using the same increment, 3330. Put it simply, this is brute force method, but it happens to work in a reasonable amount of time.