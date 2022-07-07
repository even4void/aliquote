---
title: "Palindromic numbers in Mathematica"
date: 2022-07-07T21:13:59+02:00
draft: false
tags: ["mathematica", "racket", "euler"]
categories: ["2022"]
---

I described some of my solutions to Project Euler in [several posts] I wrote in 2019. I'm now revisiting some of the code while playing with Mathematica. Indeed, Mathematica is an interesting language that is starting to interest me more than just for making small calculations or graphics on the fly. And it looks like many languages remind me of Stata -- delayed evaluation for Mathematica, command abbreviations for VimL.

[Problem 4] reads:

> A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99. Find the largest palindrome made from the product of two 3-digit numbers.

With the Racket code provided in this [previous post], I used the following `for*/list` construct to compute the solution using brute force:

```racket
(apply max
        (for*/list ([a (in-range 999 100 -1)]
                    [b (in-range a 100 -1)]
                    #:when (palindrome? (* a b)))
          (* a b)))
```

Computers are fast enough nowadays, although there are [subtle optimizations] available for such problems. Anyway, this means two functions and a main loop. Here is the same code in Mathematica, in short form without any consideration for optimization:

```mathematica
IsPalindrome[x_] := IntegerDigits[x] == Reverse[IntegerDigits[x]]
Max[Select[Flatten[Table[i * j, {i, 100, 999}, {j, 100, 999}]], IsPalindrome]]
```

I like the functional route we can take with Mathematica, although it's slighty slower than Racket code in this case.

{{% music %}}Adam Wakeman • _Pristina_{{% /music %}}

[several posts]: /tags/euler/
[problem 4]: https://projecteuler.net/problem=4
[previous post]: /post/numeric-palindrome/
[subtle optimizations]: https://blog.dreamshire.com/solutions/project_euler/project-euler-problem-004-solution/
