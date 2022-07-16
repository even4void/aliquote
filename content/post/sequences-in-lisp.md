---
title: "Sequences in Lisp"
date: 2022-07-16T19:35:36+02:00
draft: false
tags: ["lisp"]
categories: ["2022"]
---

In Common Lisp, sequences are made of lists, vectors, strings and [maybe other things]. In short, these are ordered [collections] of elements (or items for short). You can define a generic sequence using `maque-sequence`, or rely on specialized functions (`make-list`, `make-array`, `list`, `vector`, etc.) as shown below:

```lisp
* (defparameter *x* (make-sequence '(vector double-float) 5 :initial-element 1d0))
* *x*
#(1.0d0 1.0d0 1.0d0 1.0d0 1.0d0)
* (vector 1d0 1d0 1d0 1d0 1d0)
#(1.0d0 1.0d0 1.0d0 1.0d0 1.0d0)
```

Note that although they look the same, `make-sequence` in this case returned an array, and not a simple vector like `vector`. Also note that I'm using SBCL REPL so that `**` means the last computed result.

```lisp
* (equalp *x* **)
nil
* (type-of *x*)
(simple-array double-float (5))
```

To generate a regular sequence à la Python's `range` function, we could define the following function:

```lisp
* (defun iseq (end &optional (start 0) (step 1))
    (loop :for n :from start :below end :by step :collect n))
* (iseq 5)
(0 1 2 3 4)
* (iseq 6 1)
(1 2 3 4 5)
```

This will only work for numbers, of course. While playing with [newLISP], I learned that there's a builtin `sequence` function there, which works like LispStat's `iseq`:[^1]

```lisp
> (setq x (sequence 1 5))
(1 2 3 4 5)
> (length x)
5
> (x 3)
4
```

There's even a `series` function to create a geometric sequence of numbers. As shown in the above example, subsetting is a breeze (this is called implicit indexing per the [documentation]), but there's more: slicing a list or an array is even easier than in most Lisp-like languages I know, except perhaps Clojure using `subvec` provided you're using vectors:

```lisp
> (2 x)
(3 4 5)
```

Of course, we could do the same with arrays as shown below:

```lisp
> (setq z (array 2 2 '(1 2 3 4)))
((1 2) (3 4))
> (0 1 z)
((1 2))
> (1 1 z)
((3 4))
```

I think I'll need to investigate more into this dialect to see if toy examples from LispStat could be ported to newLISP. Despite all the [criticisms] we can found on HN, I believe newLISP provides a handy way of writing quick scripts in Lisp, but see [I am not afraid to admit that I've used Lisp for real work]. Other candidates on my list are PicoLisp and Janet. Stay tuned.

{{% music %}}As Animals • _By My Side_{{% /music %}}

[^1]: or various implementation of the `iota` function in CL, e.g. [Generating sequences in Common Lisp] or the [Alexandria] library.

[many other things]: http://www.lispworks.com/documentation/HyperSpec/Body/t_seq.htm
[collections]: https://gigamonkeys.com/book/collections.html
[newlisp]: http://www.newlisp.org/
[documentation]: http://www.newlisp.org/ExpressionEvaluation.html
[generating sequences in common lisp]: https://dnaeon.github.io/generating-sequences-in-common-lisp/
[alexandria]: https://quickref.common-lisp.net/alexandria.html
[criticisms]: https://hn.algolia.com/?q=newlisp
[i am not afraid to admit that i've used lisp for real work]: https://lmf-ramblings.blogspot.com/2011/08/i-am-not-afraid-to-admit-that-ive-used.html
