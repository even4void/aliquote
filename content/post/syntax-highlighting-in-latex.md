+++
title = "Syntax highlighting in Latex"
date = 2010-12-26T11:22:17+01:00
draft = false

tags = ["tex"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I just discovered the [minted](http://www.ctan.org/tex-archive/macros/latex/contrib/minted/) $\LaTeX$ package to highlight source code. Perfect! I never liked the [listings](http://www.ctan.org/tex-archive/macros/latex/contrib/listings/) package.

<!--more-->

Minted has been developed by [Konrad Rudolph](http://stackoverflow.com/questions/1966425/source-code-highlighting-in-latex/1985330#1985330). It relies on [Pygments](http://pygments.org/) which is easily installed using, e.g.,

```
$ sudo easy_install Pygments
$ cat > 1.py
import numpy
print numpy.__version__
^D
$ pygmentize -f html -O full -o 1.html 1.py
```

![Screenshot1](/img/2010-12-26-17-52-00.png)

Here is a short example of rendering R and Python code:

![Screenshot2](/img/2010-12-26-18-18-00.png)

The source file is here: <i class="fa fa-file-code-o fa-1x"></i>  [test_minted.tex](http://www.aliquote.org/pub/test_minted.tex). To compile, just run:

```
$ xelatex -shell-escape test_minted.tex
```

What I like is:

- Its syntax looks like that for the listings package, so it's easier to switch to it.
- It has good unicode support.
- It offer full-support for R, and more esoteric language that I like (e.g., [Asymptote](http://asymptote.sourceforge.net/)), but try `pygmentize -L lexers` at the shell prompt.

I seem to remember having tried the [highlight](http://tug.ctan.org/tex-archive/support/highlight/) program, but I cannot find any trace of it on my old computer.
