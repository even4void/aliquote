---
title: "New tutorials"
date: 2018-06-20T21:40:51+02:00
draft: false
description: ""
tags: ["statistics", "emacs"]
categories: []
---

I am working on two new series of tutorials, one using R and the other using Stata. The focus will be on biostatistical computing or computational statistics at a glance but this is just the beginning and I have no definitive idea how this will turn out. The projects can be watched on GitHub ([rstats-sk](https://github.com/chlalanne/rstats-sk) and [stata-sk](https://github.com/chlalanne/stata-sk)) or they are rendered online [on this site](/writings).

<!--more-->

When I think about it I can't help but smile at the idea that my business has resumed on GitHub even though Microsoft has taken the lead. Anyway, I hope to be able to write enough material by the end of the Summer.

Regarding the format, this time I choose to use Org instead of Markdown (not much standards, too few exporting options without having to resort on inserting plain HTML code) or $\LaTeX$ (managing to find good HTML rendering has always been a pain and the language is definitely too much for these kind of projects). It works quite nicely with `ox-bibtex` and standard `html-export`. I know I could use the Pandoc backend (ox-pandoc) but I prefer a simple solution where I can manage my own CSS and focus on the content. After all, isn't it also the purpose of markup languages like $\LaTeX$ or Markdown? (Unless you have very poor standards you are likely to spend a lot of time customizing your $\LaTeX$ template or YAML header, assuming you are using Pandoc as you should.) But prettu much like John D. Cook said, with time we come back to appreciate just plain text:

{{< tweet 1009113622314962944 >}}

Then comes the Makefile, because I don't want to have to export all Org files one at a time and keep them in sync with my static blogging engine. Currently, I am using a very basic Makefile [grabbed from StackOverflow](https://stackoverflow.com/a/22091045). There are further refinements to add, especially regarding the cleaning of intermediate files, but overall it is quite working. There are little subtleties with using [org-babel](https://orgmode.org/worg/org-contrib/babel/) for Stata code: besides the minor annoyance of replicating the input commands in the output block, it is not possible to generate PNG files and a default font family is chosen because the Terminal exec file says this is how it should be. Rob Hicks has some tricks to [customize ob-stata.el](http://rlhick.people.wm.edu/posts/stata-and-literate-programming-in-emacs-org-mode.html) but I don't want to spend too much time in updating my packages repository. (BTW, I did try his workaround at some point and it works really great.) 

One nice thing about Emacs is that you can use it wihtout any shebang: Right now, I am just asking to run Emacs in batch mode and load a custom init file with default setting for R or Stata. So basically, you just need to have org-mode, which comes with Emacs in almost all system-wide install, [ESS](https://ess.r-project.org) and ox-bibtex. Here is the magic invocation:

```bash
emacs --batch -l setup.el $< -f org-html-export-to-html --kill
```

And here is what I have in `setup.el` in the case of Stata:

```lisp
;; FIXME Find a way to make the following independant of ELPA versioning
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/org-plus-contrib-20180514")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/htmlize-20180412.1244")
(add-to-list 'load-path "~/.emacs.d/elpa/27.0/develop/ess-20180610.800/lisp")

;; Required stuff
(require 'ess-stata-mode)
(require 'org)
(load "ox-bibtex.el")

;; Setup default settings
(setq inferior-STA-program-name "/usr/local/bin/stata"
      org-confirm-babel-evaluate nil
      org-src-fontify-natively nil
      org-html-htmlize-output-type nil
      ess-ask-for-ess-directory nil)
(org-babel-do-load-languages 'org-babel-load-languages '((stata . t)))

;; Add-ons
(org-add-link-type "span" #'ignore
                   #'(lambda (class desc format)
                       (pcase format
                         (`html (format "<span class=\"%s\">%s</span>"
                                        class
                                        (or desc "")))
                         (_ (or desc "")))))
(org-add-link-type "stata" #'ignore #'my/export-stata-link)
(defun my/export-stata-link (path desc format)
  "Export org stata links to html."
  (cl-case format
    (html (format "<a href=\"https://www.stata.com/help.cgi?%s\" class=\"stata\">%s</a>" path (or desc "")))
    (latex (format "\"%s\")" path))))
```

The "Add-ons" part is just a custom `org-link` that allows to auto-link Stata commands to their online documentation on <http://www.stata.com>.



{{% music %}}Timber Timbre • *Cedar Shakes*{{% /music %}}
