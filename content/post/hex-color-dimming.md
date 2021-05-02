---
title: "Hex Color Dimming"
date: 2021-05-02T21:02:41+02:00
draft: true
tags: ["racket", "unix"]
categories: ["2021"]
---

My color scheme for the terminal is rather unusual, but it is in part inspired by the Belafonte color theme. I initially configured Kitty to use my custom theme, and then extend it to other terminal emulators and text editors, although for the later I don't really use colors (except for highlighting strings, number and all sorts of literals). Actually, I'm only using 10 colors instead of 16, meaning I use the same low and high contrast color for all colors except black and white -- which are not really black and white.

{{< fluid_imgs
"pure-u-1-2|/img/2021-05-01-10-55-23.png"
"pure-u-1-2|/img/2021-05-01-10-56-22.png" >}}

As we did [earlier](/post/hex-to-base64/), to write a number in Hex notation to its decimal representation we can use `number->string` directly:

```racket
> (number->string #x7e5 10)
"2021"
```

We could write our own function, since it lends itself well to recursive writing: it is enough to iterate over each digit, from right to left, and add them up once weighted by 16 times their previous weight, where for the base case the weight equals 1. As for the guard of this recursive solution, we just have to check when there are no more digit to proceed with. Let's try:

```racket
(define (hex->dec s k)
  (if (= 0 (string-length s)) 0)
  (let ([digit (- (string-length s) k 1)])
    ))
```
