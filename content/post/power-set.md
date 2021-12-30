---
title: "Generating power sets in Lisp"
date: 2021-12-29T20:16:50+01:00
draft: false
tags: ["math", "lisp"]
categories: ["2021"]
---

A power set is the set of all subsets composed of one or more elements of the original set. Consider the set $\\{1,2,3\\}$, then its power set is: $\\{\\}$, $\\{1\\}$, $\\{2\\}$, $\\{3\\}$, $\\{1,2\\}$, $\\{1,3\\}$, $\\{2,3\\}$, $\\{1,2,3\\}$. It is different from a partition which considers mutually exclusive elements, excluding empty sets and considering only the union of all possible subsets. In this particular case, the corresponding partition would be: $\\{\\{1\\}, \\{2\\}, \\{3\\}\\}$, $\\{\\{1, 2\\}, \\{3\\}\\}$, $\\{\\{1, 3\\}, \\{2\\}\\}$, $\\{\\{1\\}, \\{2, 3\\}\\}$ and $\\{\\{1, 2, 3\\}\\}$.

How to generate such a power set in a recursive manner? First, the power set of an empty list is of course the empty list. Second, the power set of $A = \\{a,\\dots\\}$, where $\\dots$ represents the `cdr` of $A$ using Lisp notation (i.e., all elements after the first one, $a$) amounts to concatenating the power set of $A - \\{a\\}$ -- which means all subset of $A$ which do not include $a$ -- and, again, the power set of $A - \\{a\\}$, this time with a prepended to each subset. In the above example, the later point yields, on the one hand, $\\{\\}$, $\\{2\\}$, $\\{3\\}$, $\\{2,3\\}$, and on the other hand, $\\{1\\}$, $\\{1,2\\}$, $\\{1,3\\}$, $\\{1,2,3\\}$. I don't remember the name of this algorithm.

In Lisp, we can write the following:

```lisp
(defun power-set (lst)
  (if (eq nil lst) '(())
      (let ((power-set-cdr (power-set (cdr lst))))
        (append power-set-cdr
                (mapcar #'(lambda (subset) (cons (car lst) subset))
                     power-set-cdr)))))
```

Using our base example, this gives:

```lisp
CL-USER(11): (power-set '(1 2 3))

(nil (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
```

What's more interesting is that it worked with characters as well, so that we can compose an infinite number of words given a constrained alphabet.

```lisp
(defun randu (lst)
  (let ((r (random (length lst))))
    (nth r lst)))

(defun repeat (f n)
  (dotimes (i n) (funcall f)))

(defparameter *set* '(#\e #\a #\s #\i #\n #\t #\c #\p))
(defvar data (repeat (randu *set*) 6))
(power-set data)
```
