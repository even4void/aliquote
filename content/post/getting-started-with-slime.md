+++
title = "Getting started with Slime"
date = 2011-01-30T21:46:33+01:00
draft = false
tags = ["lisp", "emacs"]
categories = ["2011"]
+++

[Slime](http://common-lisp.net/project/slime/) provides a complete environment for Lisp development with Emacs. It includes a minor mode that enhances lisp-mode, a common lisp debugger (SLDB), an REPL, and an inspector. It supports several CL implementation, including [CMUCL](http://www.cons.org/cmucl/), [SBCL](http://sbcl.sourceforge.net/), [Clozure CL](http://www.clozure.com/clozurecl.html), or [CLISP](http://www.gnu.org/software/clisp/).

It comes prepackaged for Aquamacs users, see the Download page on [aquamacs.org](http://aquamacs.org).

## Basic usage

Start Slime with <kbd>M-x slime</kbd>. The first time, a lot of elip files will be compiled on the fly, but the next time it will start much faster. From the on-line help, "This uses the inferior-lisp package to start a Lisp process, loads and starts the Lisp-side server (known as "Swank"), and establishes a socket connection between Emacs and Lisp." The REPL starts CMUCL in my case, because it is the one specified as `inferior-lisp-program`. It can be changed by adding, e.g.

```lisp
(setq inferior-lisp-program "/Developer/CCL/scripts/ccl")
```

in your `.emacs` file. Should you want to use different flavour of CL implementations, you can just replace the above by something like

```lisp
(setq slime-lisp-implementations
  '((cmucl (lisp "-quiet"))
   (sbcl ("/opt/sbcl/bin/sbcl") :coding-system utf-8-unix)
   (ccl ("/Developer/CCL/scripts/ccl"))))
```

The first program will be selected by default, but it can be changed by using <kbd>M-- M-x slime</kbd>. In this case, Emacs will prompt you to give the name of the program you want to bind to Slime.

We can also use `(append slime-lisp-implementations ...)` into the `(setq slime-lisp-implementations ...)` to add other programs. This is basically what we will do in the next section.

The <i class="fa fa-file-pdf-o fa-1x"></i> [SLIME User Manual](http://common-lisp.net/project/slime/doc/slime.pdf) is available as PDF. Here are my very first impression when using Slime.

First, we lauch Slime and just ask to eval `(+ 1 3)`.

![slime](/img/20110130223138.png)

Then, we deliberately introduces an error when submitting our code to the REPL, in this case we ask `1-2`: it popups an SLDB window saying `the variable [1-2] is unbound` which means it has no value bounded to it. Now we can click or select `1: [ABORT] Return to Top-Level.` and we're back to the REPL. Another cool thing from using Slime is that you get auto-completion when you are typing into the REPL. For example, let's write a function $x \rightarrow x^2$, 

```lisp
(defun square (x) (* x x))
```

(We could also use `(def square (lambda (x) (* x x)))`.)

As soon as you start typing `defun`, you'll get this nice prompt for name and argument:

![](/img/20110131163408.png)

Let's again introduce an error when typing the function definition, say we wrote `(*x x)` instead of `(* x x)`. Here is what we get from the SLDB when we run `(square 5)` at the prompt: 

![](/img/20110131163753.png)

Going back to the REPL, <kbd>Esc-p</kbd> two times gives back the previous function definition that we can now correct. 

## Slime and Clojure

Slime can be configured to work with [Clojure](http://clojure.org/), but you need [swank-clojure](https://github.com/technomancy/swank-clojure). A basic setup might look like the one shown below (but I didn't test it myself):

```lisp
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(require 'swank-clojure)

(setq slime-lisp-implementations
  (append slime-lisp-implementations
     `((clojure ,(swank-clojure-cmd) :init swank-clojure-init))))
```

I found a nice tutorial on setting up Slime and Clojure by watching Seth Buntin's presentation on "Emacs with Clojure, Slime and Swank":

{{< vimeo 2419596 >}}


