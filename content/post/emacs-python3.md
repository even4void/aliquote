---
title: "Emacs and Python 3"
date: 2019-01-15T07:23:37+01:00
draft: false
tags: ["emacs","python"]
categories: []
---
Fixing little annoying Emacs things in the morning is probably the best way to start the day. This is also known as procrastination.

<!--more-->

This morning I was annoyed by the fact that my new shiny Emacs modeline was actually displaying Python 2.7 while I am using Python 3 since at least 3 years now. Everything worked as expected though: I am still able to launch a Python REPL and I get my current IPython environment; likewise if I send a buffer to the Python inferior process the right version of Python is used. I should note that I am not using [Anaconda](https://www.anaconda.com) (or [pipenv](https://pipenv.readthedocs.io/en/latest/), or whatever) as I prefer to rely on bare bone Python installed via Homebrew (even if it keeps insisting with installing and updating `python@2` for some libraries I once installed). And I am using the recommended settings for [flycheck](https://github.com/flycheck) and `python-mode`, namely:

```lisp
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3")
```

However, this clearly doesn't affect the Python version number that [doom-modeline](https://github.com/seagle0128/doom-modeline) displays next to the Major mode. Yet, the correct version of Python (Python 3.7.2, Built from source on 2018-12-31 at 11:59:03) is used when interacting with inferior process. Upon inspection of the source code, I figured out that `doom-modeline-version` (which you can set to `nil` if you want to disable the display of program or environment version number) actually [relies on hooks](https://github.com/seagle0128/doom-modeline/blob/8241017396fc98b96a294567bb22200a7d96d336/doom-modeline.el#L2101) that defined what version of Python, Ruby or even Perl is currently available on the system, as well as a `defvar` which set `python` as the default interpreter, which is quite unfortunate for people like me who lives in the 21st century but still have to keep both versions of Python on their OS:

```lisp
(defvar doom-modeline-python-executable "python"
  "What executable of Python will be used (if nil nothing will be showed).")
```

So far so good, let's go with overriding that global variable once and for all since I have absolutely no other idea what to do this early morning.[^1] Of course I realize this really is a weird fix and I should probably update my default Python configuration.

Anyway, I ended up with the following settings in my `init.el` file, just in time for the second morning coffee:

```lisp
(setq doom-modeline-python-executable "python3")
(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3"
      flycheck-python-pylint-executable "python3"
      flycheck-python-flake8-executable "python3")
(setq doom-modeline-major-mode-icon nil
      doom-modeline-persp-name t
      doom-modeline-github t
      doom-modeline-version t
      doom-modeline-minor-modes t)
(minions-mode 1)
(setq persp-nil-name "#")
(setq minions-mode-line-lighter "◎")
```

You will notice that I also updated the default program name for [pylint](https://www.pylint.org) and [flake8](http://flake8.pycqa.org/en/latest/) since they were disabled in all Python buffers because of whoever thought I was using Python 2.7. And that's it for the screenshot of the day:

![](/img/2019-01-15-09-23-33.png)

[^1]: I checked the [closed PRs](https://github.com/seagle0128/doom-modeline/pulls?q=is%3Apr+is%3Aclosed) as well.
