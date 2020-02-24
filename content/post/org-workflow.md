---
title: "Org exports"
date: 2020-02-22T19:48:32+01:00
draft: true
tags: ["emacs"]
categories: ["2020"]
---

Each time I check my RSS feeds, I come across some nice posts about how folks are using Emacs together with Org mode. I have a dozen of channels that are mostly around Emacs (e.g., Irreal or Sacha Chua), so this comes to no surprise after all. I'm not an heavy user of Org agenda, but this is just because I'm no strong planner. And I have almost no deadline nowadays. However, I've come to appreciate writing using Org mode, better than Markdown for text documents larger than, say, blog posts. Some of my previous posts were about [blogging](/post/org-blogging/), managing [Bibtex records](/post/org-and-bibtex/), but this one is more like [A text-based workflow for taking note](/post/notes-taking-workflow/). After two years of using Org mode, here is what's left.

Why Org documents ? First, I find the markup language more coherent and definitely more robust --- think of nested item lists, line breaks or image insertion in a list. I know the lack of standardization of Markdown and its many flavors makes it pretty hard to parse by a machine. Second, once rendered into Emacs, it's no longer apparent that we are dealing with a markup language. Look and see how beautiful Org document are with little customization:

![emacs](/img/2020-02-22-20-06-31.png)

Of course, Markdown mode for Emacs also comes with "concealing" featuring (better than in Vim sometimes), but there's no comparison when it comes to managing links and images, IMHO. Now that Github renders Org documents like it did for years with Markdown files, we also have a nice way to display online document. But there's more. Indeed, one of the nicest feature of Emacs + Org is the possibility of using Pandoc as a front-end for exporting Org documents. I first started using default HTML export, but I soon came to realize that using Pandoc provides far better rendering options. Below is the same document exported as an HTML page using a custom Github-like CSS:

![html](/img/2020-02-24-10-46-16.png)

Here is what I have in my Emacs init file:

```emacs-lisp
(setq   org-export-with-author nil
        org-export-with-creator nil
        org-html-postamble nil
        org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"_assets/github.css\" />"
        org-latex-pdf-process '("latexmk -pdf -f -outdir=%o %f")
        org-pandoc-options-for-html5 '((section-divs . t)
                                       (bibliography . "/Users/chl/org/references.bib")
                                       ;; https://is.gd/lt21EQ
                                       (template . "/Users/chl/.pandoc/templates/GitHub.html5")))
```

Nothing really fancy, but this is useful to keep Org header simple enough. I could probably use some kind of template since I always use the same options, but I have a little (ya)snippet that insert everything for me:

    # -*- mode: snippet -*-
    # name: Header block for HTML tutor
    # key: tutor
    # condition: t
    # --
    # -*- ispell-dictionary: "french" -*-
    #+TITLE:        ${1:The title}
    #+LANG:         fr
    #+STARTUP:      align fold noindent hideblocks fnlocal
    #+OPTIONS:      H:3 num:nil toc:2 ':t *:t ::t f:t |:t -:t
    $0
