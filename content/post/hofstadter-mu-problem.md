---
title: "The MU→MI string conversion problem"
date: 2019-07-12T10:19:46+02:00
draft: true
tags: ["math", "puzzle", "racket"]
categories: []
---

Today's problem comes from Douglas Hofstadter's wonderful book, _Gödel, Escher, Bach_

<!--more-->

You are given a small alphabet, which consists in the letters M, U and I, and a set of four rules, where x and y denote any string:

- xI to xIU: append U at the end of a string that ends with I;
- Mx to Mxx: append the string after M a second time;
- xIIIy to xUy: replace III with U;
- xUUy to xy: remove UU.

Let's start with the string MI. The goal is to convert this string to MU using those rules, that you can reuse at will.

There is [no solution to this problem](https://en.wikipedia.org/wiki/MU_puzzle#Solution), but here is a little playground using Racket to apply the above rules and see how the initial string might evolve by trial and error:

```scheme
(define bla)
```
