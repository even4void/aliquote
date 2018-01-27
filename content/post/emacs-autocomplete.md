+++
title = "Emacs auto-completion for Python"
date = 2013-02-11T11:54:58+01:00
draft = false

tags = ["emacs", "python"]
categories = []

[header]
image = ""
caption = ""
preview = true

[[gallery_item]]
album = "1"
image = "20130211201329.png"
caption = ""

[[gallery_item]]
album = "1"
image = "20130211201042.png"
caption = ""

[[gallery_item]]
album = "1"
image = "20130211200954.png"
caption = ""


+++

Here are some notes on how to enable auto-completion for Emacs.

I already have [auto-complete](http://emacswiki.org/emacs/AutoComplete) installed and enabled for some major modes. Together with other goodies from [ess](http://ess.r-project.org) or [yasnippet](http://code.google.com/p/yasnippet/) it really makes life easier when working with R code.

Following a recent post by [John D Cook](http://www.johndcook.com/blog/2013/01/29/python-emacs-setup/), I decided to try to enhance my default Emacs setup for Python (which barely consists in `python-mode`, `ac-python` and some custom hooks for indentation and tabs/spaces management). I should note that I am currently using standard Python shell as inferior process because I wasn't able to configure Emacs to run [ipython](http://ipython.org) instead of standard Python. This may well be due to conflicting version of `python-mode` and `ipython.el`. With [ipython.el](https://raw.github.com/ipython/ipython/master/docs/emacs/ipython.el) from IPython distro, and the following in my `.emacs` :

```lisp
(require 'ipython)
(setq ipython-command "/usr/local/bin/ipython")
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
```

I seem to be able to send Python code to IPython, though.

I already know of [ropemacs](http://rope.sourceforge.net/ropemacs.html) but it looks too much for what I really need. Here comes [Jedi.el](https://github.com/tkf/emacs-jedi):

> a Python auto-completion package for Emacs. It aims at helping your Python coding in a non-destructive way. It also helps you to find information about Python objects, such as docstring, function arguments and code location.

[Installation instructions](http://tkf.github.com/emacs-jedi/) are dead simple. However, instead of using [el-get](https://github.com/dimitri/el-get), I installed everything by hand.

For the Python part, we just need to install `epc` and `jedi`:

```
% sudo pip install epc
% sudo pip install jedi
```

(I'm still using Apple Python, which actually is Python 2.7.1 (r271:86832, Jun 16 2011, 16:59:05).)

And, for Emacs, provided we are using [package.el](http://emacswiki.org/emacs/ELPA), we just have to `M-x package-list-packages` and then install `epc` and `jedi`. My package archives include <http://melpa.milkbox.net/packages/> which generally provides more up to date packages. I added the following to my `.emacs`:

```lisp
(require 'epc)
(setq jedi:setup-keys t)
(setq jedi:server-command '("python" "~/.emacs.d/elpa/jedi-20130210.1518/jediepcserver.py"))
(setq jedi:tooltip-method '(pos-tip))
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
```

Below are some screenshots of `jedi.el` in action.

{{< gallery album="1" >}}

On a related point, I took advantage of those updates to update my [nrepl](https://github.com/kingtim/nrepl.el) package for Clojure and install [ac-nrepl](https://github.com/purcell/ac-nrepl) which also comes with handy autocompletion and doc (`C-c C-d`) support.

![Clojure and nREPL](/img/20130211211212.png)
