---
title: "Loving Common Lisp"
date: 2019-05-29T19:03:17+01:00
draft: false
tags: ["review", "readings", "lisp"]
categories: ["2019"]
---

Here is a quick review of _Loving Common Lisp_, by Mark Watson. I initially read an early draft version on Leanpub, but I found some time to (re)read the latest version available.

If you are new to Common Lisp, I would recommend to first try the excellent blog post written by Steve Losh, [A Road to Common Lisp](http://stevelosh.com/blog/2018/08/a-road-to-common-lisp/). Don't miss it, it's very well written, like many other posts by the same author. I would also recommend the [Common Lisp Cookbook](https://lispcookbook.github.io/cl-cookbook/). There are plenty of additional resources to learn Lisp, either from a pragmatic viewpoint -- [Atabey Kaygun](https://web.itu.edu.tr/kaygun/) writes a lot of math/stat-related algorithm using CL on his Tumblr -- or from a more formal perspective: O'Reilly has a lot of dedicated textbooks targeting the "modern Lisp", aka Clojure, and I particularly love the one written by [Carin Meier](http://gigasquidsoftware.com). If you want to stick with CL, strictly, then [Practical Common Lisp](http://www.gigamonkeys.com/book/) is probably the best way to go.

> Lisp is not just a language; it is also a programming environment and runtime environment.

That being said, let's go back to this book, _Loving Common Lisp_. I must admit that it did not meet my expectations entirely, especially because I was expecting something more polished and/or developed, but this may well be due to the iterative publishing process that we commonly encounter on Leanpub. I am sure that the author knows what he is talking about, and I have read his [blog posts](http://blog.markwatson.com) and books for years. It also doesn't mean that the book is not well written. There are still some proof-reading lacking here and there but overall it looks good. It is just that this is neither an introductory textbook, nor a practical cookbook: It's just in-between, which leaves us with the feeling that this book is not completely finished. On the plus side, you get a complete [set of Lisp programs](https://github.com/mark-watson/loving-common-lisp) to run from GitHub (part of those examples depend on [clml](htps://github.com/mmaul/clml)).

The author starts by comparing Lisp with Java or even C/C++, especially regarding automatic memory management (allocation and garbage collection), fair enough. This is a well-known fact that GC is of concern, as well as JIT compilation or number representation for modern PLs. Lisp is an old beast, but still actively used in prod system (e.g., Grammarly). I have always been able to compile old Lisp code, and I like the fact that updating my quicklisp packages resume to updating almost nothing on my OS. Because when a package provides the expected functionalities and is not going to evolve anymore, it is done for good. Remember [this guy](https://github.com/magnars/multiple-cursors.el)?

> I use this package every day, and have been doing so for years. It just works. At least, it works for all my use cases. And if it breaks somehow, I fix it.
> However, it has become painfully clear to me that I don't have time to fix problems I don't have. It's been years since I could keep pace with the issues and pull requests. Whenever I try, I keep getting feedback that my fix isn't good enough by some standard I don't particularly care about.

Freezing a working package is a feature, not a lack of interest.

The following is based on the notes I took in an Org-file while reading the first part of the book. The author does not explain the differences between [defvar, defparameter, setf and setq](https://stackoverflow.com/q/8927741) although they are used a lot interchangeably at the beginning of the book. Treatment of lists is, however, pretty standard and well exposed (`car` and `cdr`, `cons` and `append`, `last` and `nth`, etc.). An interesting example regarding shared structure in list processing is provided, by the way:

```lisp
(setq x '(0 0 0 0))
(setq y (list x x x x))
(setf (nth 2 (nth 1 y)) 'x)
x
y
(setq z '((0 0 0 0) (0 0 0 0) (0 0 0 0)))
(setf z (nth 2 (nth 1 z)) 'x)
z
```

Beyond lists, vectors and arrays (`make-array,` or `vector` and `make-sequence`) are more efficient data structure when the number of elements is large. Beware that CL for scientific computing cannot be fast, portable, and convenient [all at the same time](https://tpapp.github.io/post/common-lisp-to-julia/). Notice that an array can "contain" any values, and thus mixing integers with float is allowed by the language. Operations on string (`concatenate`, `search`, `subseq` and `string-*`) and the [fine distinction](http://doc.norang.ca/lisp.html) between `eq`, `eql`, and `equal` are also covered. For strings, we should prefer `string`. Instead of `nth`, we use `char` to extract a given character in a string. Hash tables are to be preferred when lists (coupled with `assoc`) are long. Main functions are `gethash`, `make-hash-table`, and `maphash`. Updating values in a hash table is done using `remhash` or `clrhash`. Note that these functions can modify their arguments, much like `setf` or `setq`, but the latter are macros and not functions. Finally, recall that read-only objects are inherently thread safe.

> Functional programming means that we avoid maintaining state inside of functions and treat data as immutable.

Lisp functions get covered as well, with lots of examples relying on `defun`, keywords (`&aux`, `&optional`, `&key`), `let` special operator for local bindings, `lambda` and `funcall`. A closure is a function that references an outer lexically scoped variable, which typically happens when functions are defined inside `let` forms (see p. 47). The `dotimes` and `dolist` macros are close to Stata `forvalues` and `foreach` instructions, while the `do` macro is more general (and has nothing to do with its R `dplyr` counterpart, of course).

The rest of the book describes some applications of web and network programming using CLOS classes and various packages (`drakma`, `hunchentoot`). I also enjoyed reading the chapter on querying database since I am doing a lot of this stuff these days. This is where the book starts to be really interesting because it then becomes a real practical cookbook, while the preceding chapters were more of a discussion of what Lisp has to offer and why the author likes it.

{{% alert note %}}
<small>[2021-04-26]</small><br>
If you are looking for a gentle introduction to Common Lisp, [Common Lisp by Example](https://github.com/ashok-khanna/common-lisp-by-example) is a good starting point. There's also this recent blog post, by Marin Atanasov Nikolov, [Starting with Common Lisp in 2020](https://dnaeon.github.io/starting-with-common-lisp-in-2020/), although Steve Losh already wrote quite a piece of beauty a few years ago: [A Road to Common Lisp](https://stevelosh.com/blog/2018/08/a-road-to-common-lisp/).
{{% /alert %}}
