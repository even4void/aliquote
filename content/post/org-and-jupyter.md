---
title: "Org and Jupyter"
date: 2022-05-18T12:48:23+02:00
draft: false
tags: ["emacs", "stata"]
categories: ["2022"]
---

I do like Org in Vim, but I need Emacs to process my code chunks via Org babel. I already described my setup in earlier posts of mine, but I reached the point where I think that ESS is no longer the definite answer for Org + R or Org + Stata documents.

I also realized that ESS support for Stata is going to an end (like was the case of xlispstat a few years ago). It's probably time to rebase all subsequent batch processing of Org files to the corresponding Jupyter kernel.

> stata support is now obsolete since we were unable to elicit FSF paperwork from some of the original authors: see the lisp/obsolete sub-directory on the ESS github repo --- [Changes and New Features in 19.04 (unreleased)]

Needless to say, using Jupyter for interactive work in the terminal is also a better option since the terminal version of Stata does not have any support for readline. Since I pushed a PR for Stata base support to [iron.nvim], I should better rewrite a proper alternative using the [stata kernel].

As mentioned in the introduction, I still relies on Emacs for most of the work. Ubuntu 20.04 LTS comes with Emacs 26.3, which is pretty old by any standard, and does not support modules, which are a prerequisite for installing [emacs-jupyter]. Since my Emacs config was outdated and quite a mess actually (I installed some packages via apt, others manually, and yet a few other packages via Emacs `package-install`), I decided it was time to install a fresh new version of Emacs. There are prebuilt binaries (Emacs 27 and 28) available for Ubuntu via a dedicated PPA:

```
$ sudo add-apt-repository ppa:kelleyk/emacs
$ sudo apt install emacs28
```

Then, I installed a bunch of packages with `package-install`. I know I should be using `straight` but since I will only be using Emacs as a postprocessor for my Org files, I don't want to bother with an alembicated `init.el` file. Part of my config file is shown below:

```emacs-lisp
(when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(with-eval-after-load 'package (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(almost-mono-themes evil geiser slime paredit rainbow-delimiters org-contrib jupyter ess))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
```

So far, so good. I should now be able to use either ESS or Jupyter to process my Org code blocks. Let's get back to Stata.

Ironically, I reverted back to using ESS and ob-stata when I reworked my stata-sk handouts. Originally, I was interested in Jupyter because of [bad support] for Stata, even after some hacking (which [no longer] applies, by the way), and because at that same time I was using Stata 15 which has native support for SVG graphics, which are the default backend in [stata_kernel]. After blaming my GitHub repo once again, I reverted the changes I introduced in some of the [previous commits].

First diff:

```
- #+begin_src stata :session :results output :exports both
+ #+BEGIN_SRC jupyter-stata :exports both
  sysuse auto, clear
  summarize price mpg
  regress price mpg
- #+end_src
+ #+END_SRC
```

<small>Doom Emacs used to use lowercase Org blocks.</small>

Second diff:

```
- #+BEGIN_SRC jupyter-stata :exports both
+ #+BEGIN_SRC stata
  sysuse auto, clear
  summarize price mpg
  regress price mpg
```

<small>I moved common header arguments to a global `#+PROPERTY`.</small>

Third diff will be essentially identical to the first one.

And so I'm back to using `jupyter-stata` in my SRC block, instead of `stata`. Besides replacing a few header options here and there, one of the consequence of using Stata 13 is that I also have to get ride of SVG or even PNG output. This means that I need to `quietly` generate the charts and then save them to EPS. This was already what I was doing when using ob-stata, but now I need to silence out the graph otherwise Jupyter complains. All EPS files are then converted to PNG using a shell script:

```shell
for i in fig-*.eps; do convert -density 300 -quality 85 "$i" "dist/${i%%.*}.png"; done
```

So far it seems to work great. I just need to update my default [Org config], in addition to my Stata handouts once again.

{{% music %}}Hoodoo Gurus • _What's My Scene_{{% /music %}}

[changes and new features in 19.04 (unreleased)]: https://ess.r-project.org/Manual/ess.html
[no longer]: https://gitlab.com/robhicks/ob-stata.el/-/issues/10
[bad support]: https://gitlab.com/robhicks/ob-stata.el/-/issues/10
[stata_kernel]: https://kylebarron.dev/stata_kernel/
[stata kernel]: https://aliquote.org/post/stata-jupyter/
[emacs-jupyter]: https://github.com/nnicandro/emacs-jupyter
[previous commits]: https://github.com/even4void/stata-sk/commit/d24b13817df321cd963970c8f948f66651caba63
[iron.nvim]: https://github.com/hkupty/iron.nvim/pull/214
[org config]: http://localhost:1313/articles/notebooks/org-setup.pdf
