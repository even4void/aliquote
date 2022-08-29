---
title: "Summing random Uniform deviates"
date: 2022-08-26T17:37:55+02:00
draft: true
tags: ["math"]
categories: ["2022"]
---

[Chris Wellons] one asked the following question before providing some code to estimate the result, which I call brute force estimate but I do it a lot too:

> How many times should a random number from [0, 1] be drawn to have it sum over 1?

Here is my brute force approach using Racket: (also, no formatting at all, I said "brute force"!)

```racket
#lang racket

(define xs (for/vector #:length 100 ([i (in-range 100)]) (random)))
(for/vector

```

How about the math? There are several solutions available on math.SO, [more] or [less] complicated.

{{% music %}}XXX • _XXX_{{% /music %}}

[chris wellons]: https://nullprogram.com/blog/2013/02/25/
[more]: https://math.stackexchange.com/q/111314/26851
[less]: https://math.stackexchange.com/q/214399/26851
