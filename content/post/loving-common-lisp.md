---
title: "Loving Common Lisp"
date: 2019-05-29T14:03:17+01:00
draft: true
tags: ["review", "readings", "lisp"]
categories: []
---

Here is a quick review of _Loving Common Lisp_, by Mark Watson. I initially read an early draft version on Leanpub, but I found some time to (re)read the latest version available.

<!--more-->

If you are new to Common Lisp, I would recommend to first try the excellent blog post written by Steve Losh, [A Road to Common Lisp](http://stevelosh.com/blog/2018/08/a-road-to-common-lisp/). Don't miss it, it's very well written, like many other posts by the same author. I would also recommend [the Common Lisp Cookbook](https://lispcookbook.github.io/cl-cookbook/). There are plenty of additional resources to learn Lisp, either from a pragmatic viewpoint -- [Atabey Kaygun](https://web.itu.edu.tr/kaygun/) writes a lot of math/stat-related algorithm using CL on his Tumblr -- or from a more formal perspective: O'Reilly has a lot of dedicated textbooks targeting the "modern Lisp", aka Clojure, and I particularly love the one written by [Carin Meier](http://gigasquidsoftware.com). If you want to stick with CL, strictly, then [Practical Common Lisp](http://www.gigamonkeys.com/book/) is probably the best way to go.

> Lisp is not just a language; it is also a programming environment and runtime environment.

That being said, let's go back to this book, _Loving Common Lisp_. I must admit that it did not meet my expectations, especially because I was expecting something more polished and/or developed, but this may well be due to the iterative publishing process that we commonly encounter on Leanpub. I am sure that the author knows what he is talking about, and I have read his blog posts and books for years.

The author starts by comparing Lisp with Java or even C/C++, especially regarding automatic memory management (allocation and garbage collection), fair enough. This is a well-known fact that GC is of concern, as well as JIT compilation or number representation for modern PLs. Lisp is an old beast, but still actively used in prod system (e.g., Grammarly). I have always been able to compile old Lisp code, and I like the fact that updating my quicklisp packages resume to updating almost nothing on my OS. Because when a package provides the expected functionalities and is not going to evolve anymore, it is done for good. Remember xxx?
