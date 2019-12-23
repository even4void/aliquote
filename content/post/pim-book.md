---
title: "A Programmer's Introduction to Mathematics"
date: 2019-12-22T13:12:09+01:00
draft: true
tags: ["review", "math"]
categories: ["2019"]
---

Here is a short review of [*A Programmer's Introduction to Mathematics*](https://pimbook.org), by Jeremy Kun. Source code is available on [Github](https://github.com/pim-book/programmers-introduction-to-mathematics), and the author has a nice [blog](https://jeremykun.com), which I subscribed to long ago. I've been reading this book erratically since this summer, and finally got to the last few chapters. I've heard there's another book in preparation, this time about a mathematical introduction to programming. This should come as no surprise since the author refers to Knuth's artwork on mathematics and programming here and there ("Mathematics provides an abstraction that helps one be sloppy in a precisely controlled way"; *Concrete Mathematics*). 

"Like Programming, Mathematics has a Culture." So you need to embrace the whole field of mathematics, and its historical development.

> (T)he best mathematicians study concepts that connect decades of material, while simultaneously inventing new concepts which have no existing words to describe them. Without flexible expression, such work would be impossible. It reduces cognitive load, a theme that will follow us throughout the book. Unfortunately, it only does so for the readers who have already absorbed the basic concepts of discussion. By contrast, good software practice encourages code that is simple enough for anyone to understand. As such, the uninitiated programmer often has a much larger cognitive load when reading math than when reading a program.

The book reviews a number of concepts ranging from basic and abstract algebra, discrete structures (sets and graphs), and uni- and multivariable calculus. All those domains are closely related to programming, as matter of fact. Much like in the [preceding book](/post/bioinformatics-algorithms/) I discussed, the author keeps an approach aimed at a wide audience without sacrificing technical precision:

> For now, think of a real number as a floating point number without the emotional baggage that comes from trying to fit all decimals into a finite number of bits.

For instance, a well-known theorem states that there is a unique degree *n* polynomial passing through a choice of *n* + 1 points. As a statistician I immediately think of the classical overfitting issue in parametric modeling, or Taylor expansion. The author emphasizes the role of polynomials as building blocks, for they can be seen as families of increasingly expressive objects (p. 9). He then spend a couple of pages demonstrating the uniqueness of the above polynomial passing through *n* points, starting from a single point (*x*<sub>1</sub>, *y*<sub>1</sub>) and the relation $f(x) = \sum_{i=0}^ny_i\left(\prod_{j\ne i}\frac{x - x_j}{x_i - x_j}\right)$. All becomes crystal clear as we progress in the logic of the demonstration. This is the guiding theme of this book: to get the reader to think about key concepts based on simple cases as well as practical illustrations using Python snippets (in the case of polynomials, a complete example of interpolation via polynomial fitting as well as code deciphering).  