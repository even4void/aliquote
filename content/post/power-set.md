---
title: "Generating power sets in Lisp"
date: 2021-12-29T20:16:50+01:00
draft: false
tags: ["math", "lisp"]
categories: ["2021"]
---

A power set is the set of all subsets composed of one or more elements of the original set. Consider the set $\\{1,2,3\\}$, then its power set is: $\\{\\}$, $\\{1\\}$, $\\{2\\}$, $\\{3\\}$, $\\{1,2\\}$, $\\{1,3\\}$, $\\{2,3\\}$, $\\{1,2,3\\}$. It is different from a partition which considers mutually exclusive elements, excluding empty sets and considering only the union of all possible subsets. In this particular case, the corresponding partition would be: $\\{\\{1\\}, \\{2\\}, \\{3\\}\\}$, $\\{\\{1, 2\\}, \\{3\\}\\}$, $\\{\\{1, 3\\}, \\{2\\}\\}$, $\\{\\{1\\}, \\{2, 3\\}\\}$ and $\\{\\{1, 2, 3\\}\\}$.

How to generate such a power set in a recursive manner? First, the power set of an empty list is of course the empty list. Second, the power set of $A = \\{a,\\dots\\}$, where $\\dots$ represents the `cdr` of $A$ using Lisp notation (i.e., all elements after the first one, $a$) amounts to concatenating the power set of $A - \\{a\\}$ -- which means all subset of $A$ which do not include $a$ -- and, again, the power set of $A - \\{a\\}$, this time with a prepended to each subset. In the above example, the later point yields, on the one hand, $\\{\\}$, $\\{2\\}$, $\\{3\\}$, $\\{2,3\\}$, and on the other hand, $\\{1\\}$, $\\{1,2\\}$, $\\{1,3\\}$, $\\{1,2,3\\}$. I don't remember the name of this algorithm.

In Lisp, we can write the following:[^1]

```lisp
(defun power-set (lst)
  (if (eq nil lst) '(())
      (let ((power-set-cdr (power-set (cdr lst))))
        (append power-set-cdr
                (mapcar #'(lambda (subset) (cons (car lst) subset))
                     power-set-cdr)))))
```

<br>

{{% alert note %}}
<small>[2023-02-06]</small><br>
Daniel P. Friedman suggested this implementation of power set in Scheme, see his slides on [The Joys of Scheme](http://www.cs.indiana.edu/hyplan/dfried/intro-slides.ps) (PS):

```scheme
(define power-set
  (lambda (set)
    (cond
      ((null? set) '(()))
      (else (extend (car set) (power-set (cdr set)))))))
(define extend
  (lambda (item power-set
    (append
      (map (lambda (set) (cons item set)) power-set)
      power-set))
```

{{% /alert %}}

Using our base example, this gives:

```lisp
CL-USER(11): (power-set '(1 2 3))

(nil (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
```

<br>

{{% alert note %}}
<small>[2023-03-14]</small><br>
For a related approach, see [Set of All Partitions of a Finite Set](https://kaygun.tumblr.com/post/710713944069816320/set-of-all-partitions-of-a-finite-set) by Atabey Kaygun.
{{% /alert %}}

What's more interesting is that it works with characters as well, so that we can compose an infinite number of words given a constrained alphabet. In the following example, I will consider the [most frequently used letters](https://fr.wikipedia.org/wiki/Fr%C3%A9quence_d%27apparition_des_lettres_en_fran%C3%A7ais) in French:

```lisp
(defparameter *set* '(#\e #\a #\i #\s #\n #\r #\t #\o))
```

And here is the result:

```lisp
 CL-USER(22): (mapcar #'(lambda (x) (format nil "~{~a~}" x)) (power-set *set*))

("" "o" "t" "to" "r" "ro" "rt" "rto" "n" "no" "nt" "nto" "nr" "nro" "nrt"
 "nrto" "s" "so" "st" "sto" "sr" "sro" "srt" "srto" "sn" "sno" "snt" "snto"
 "snr" "snro" "snrt" "snrto" "i" "io" "it" "ito" "ir" "iro" "irt" "irto" "in"
 "ino" "int" "into" "inr" "inro" "inrt" "inrto" "is" "iso" "ist" "isto" "isr"
 "isro" "isrt" "isrto" "isn" "isno" "isnt" "isnto" "isnr" "isnro" "isnrt"
 "isnrto" "a" "ao" "at" "ato" "ar" "aro" "art" "arto" "an" "ano" "ant" "anto"
 "anr" "anro" "anrt" "anrto" "as" "aso" "ast" "asto" "asr" "asro" "asrt"
 "asrto" "asn" "asno" "asnt" "asnto" "asnr" "asnro" "asnrt" "asnrto" "ai" "aio"
 "ait" "aito" "air" "airo" "airt" "airto" "ain" "aino" "aint" "ainto" "ainr"
 "ainro" "ainrt" "ainrto" "ais" "aiso" "aist" "aisto" "aisr" "aisro" "aisrt"
 "aisrto" "aisn" "aisno" "aisnt" "aisnto" "aisnr" "aisnro" "aisnrt" "aisnrto"
 "e" "eo" "et" "eto" "er" "ero" "ert" "erto" "en" "eno" "ent" "ento" "enr"
 "enro" "enrt" "enrto" "es" "eso" "est" "esto" "esr" "esro" "esrt" "esrto"
 "esn" "esno" "esnt" "esnto" "esnr" "esnro" "esnrt" "esnrto" "ei" "eio" "eit"
 "eito" "eir" "eiro" "eirt" "eirto" "ein" "eino" "eint" "einto" "einr" "einro"
 "einrt" "einrto" "eis" "eiso" "eist" "eisto" "eisr" "eisro" "eisrt" "eisrto"
 "eisn" "eisno" "eisnt" "eisnto" "eisnr" "eisnro" "eisnrt" "eisnrto" "ea" "eao"
 "eat" "eato" "ear" "earo" "eart" "earto" "ean" "eano" "eant" "eanto" "eanr"
 "eanro" "eanrt" "eanrto" "eas" "easo" "east" "easto" "easr" "easro" "easrt"
 "easrto" "easn" "easno" "easnt" "easnto" "easnr" "easnro" "easnrt" "easnrto"
 "eai" "eaio" "eait" "eaito" "eair" "eairo" "eairt" "eairto" "eain" "eaino"
 "eaint" "eainto" "eainr" "eainro" "eainrt" "eainrto" "eais" "eaiso" "eaist"
 "eaisto" "eaisr" "eaisro" "eaisrt" "eaisrto" "eaisn" "eaisno" "eaisnt"
 "eaisnto" "eaisnr" "eaisnro" "eaisnrt" "eaisnrto")
```

Next step would be to ask how many of those "artificial" words are real words? In other words, how many of the above pseudo-words are found in your Unix or Mac dictionary (`/usr/share/dict/french`)?

{{% alert note %}}
<small>[2022-02-03]</small><br>
See also [Wordle letters](https://leancrew.com/all-this/2022/01/wordle-letters/) for more "classical", Perl-based, approaches to filtering dict files on Linux or Mac.
{{% /alert %}}

{{% alert note %}}
<small>[2024-02-01]</small><br>
Yet another shell-based workflow to solve wordle puzzle: [Wordle With Grep](https://susam.net/maze/wordle-with-grep.html).
{{% /alert %}}

{{% music %}}Neon Indian • _Should Have Taken Acid With You_{{% /music %}}

[^1]: [Newlisp](http://www.newlisp.org) makes it even easier:

    ```lisp
    (define (power-set x)
      (if (empty? x)
          (list '())
          (let ((elt (first x))
                (p (power-set (rest x))))
               (append (map (fn (s) (cons elt s)) p) p))))
    ```
