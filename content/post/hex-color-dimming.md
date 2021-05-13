---
title: "Hex Color Dimming"
date: 2021-05-02T21:02:41+02:00
draft: true
tags: ["racket", "unix"]
categories: ["2021"]
---

My color scheme for the terminal is rather unusual, but it is in part inspired by the Belafonte Day color theme. I initially configured Kitty to use my custom theme, and then extend it to other terminal emulators and text editors, although for the later I don't really use colors (except for highlighting strings, number and all sorts of literals). Actually, I'm only using 10 colors instead of 16, meaning I use the same low and high contrast color for all colors except black and white -- which are not really black and white.

![neofetch](/img/2021-05-01-10-55-23.png)

It would be nice to decrease the luminance of the alternative colors a bit. Since we are working using Hex codes, it involves a bit more work than with HSL. In essence, this has been covered in this [blog post](https://www.sitepoint.com/javascript-generate-lighter-darker-color/), or in various StackOverflow threads. As we did [earlier](/post/hex-to-base64/), to convert a number in Hex notation to its decimal representation we can use `number->string` directly:

```racket
> (number->string #x7e5 10)
"2021"
```

We could probably use Racket's for/fold pattern which facilitates the use of accumulators. We could write our own function, since it lends itself well to recursive writing: it is enough to iterate over each digit, from right to left, and add them up once weighted by 16 times their previous weight, where for the base case the weight equals 1. As for the guard of this recursive solution, we just have to check that there are no more digit to proceed with. This approach is known as Horner's rule, which is widely used in the case of polynomials. Indeed, for any base $b$, the decimal representation of a number can be found from the following expansion:

$$\dots + x_2b^2 + x_1b^1 + x_0b^0 + x_{-1}b^{-1} + x_{-2}b^{-2} + \dots,$$

where negative exponents and indices are for the fractional parts of the number. If you only work with integers, you can safely remove everything after $x_0b^0$. As an example consider the base 2 number 1101<sub>2</sub>:

$$
\begin{align}
1101_2 & = (1 \cdot 2^3 + 1 \cdot 2^2 + 0 \cdot 2^1 + 1 \cdot 2^0)_{10} \cr
      & = (((0 \cdot 2 + 1) \cdot 2 + 1) \cdot 2  + 0) \cdot 2 + 1 \cr
      & = 13_{10}
\end{align}
$$

Same idea for the Hex number above (without assuming that #7E5 expands to #77EE55):

$$
\begin{align}
#7E5 & = (7 \cdot 16^2 + 14 \cdot 16^1 + 5 \cdot 16^0)_{10} \cr
     & = 2021_{10}
\end{align}
$$
Using Racket (or Haskell), this is a perfect task for a foldr
