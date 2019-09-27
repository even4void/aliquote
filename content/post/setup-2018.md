---
title: "The setup (2018 edition)"
date: 2018-01-12T10:30:27+01:00
draft: false
tags: ["apple"]
categories: ["2018"]
---

It is time to give a brief overview of my setup although [things have not really changed](/post/my-setup).

Well, I realize that I am now running High Sierra on a Macbook 12” Retina (8 Go RAM, sigh) and that Apple kindly continued to suppress things here and there. Last one was [telnet](https://forums.developer.apple.com/message/235897#235897) (but also ftp). I must admit that I did not experience much incompatibility issues or major crash when I switch over High Sierra two weeks ago, though.

![OS X 10.13](/img/highsierra.png)

I am writing this blog entry with [Spacemacs](http://spacemacs.org) and a nice-looking font, [Inziu Iosevka](https://github.com/be5invis/Iosevka). I have long been using a combination of Source Code Pro and Fira Code Retina for my Terminal or when editing code in Emacs. I finally ended up switching to Iosevka everywhere (Emacs, Terminal, other text-based editors) this week. Needless to say, there are many other great fonts, but as I am particularly involved in writings and data visualization these days, I followed Bob Rudis's advice in his [hrbrthemes package](https://cran.r-project.org/web/packages/hrbrthemes/vignettes/why_hrbrthemes.html) regarding chart typography: font family should be a condensed or narrow sans-serif typeface, with good kerning, as well as tabular and lining figures. Other candidates are discussed in the following article: [Finding the best free fonts for numbers](https://www.invisionapp.com/blog/best-free-fonts-for-numbers/).

Now, why Spacemacs? I wrote several times about Emacs, or other text editors, in the past. Lately, I gave a try to [VS Code](https://code.visualstudio.com) (after [Textmate](http://aliquote.org/memos/2013/01/02/textmate-2), [Sublime](http://aliquote.org/memos/2012/08/27/sublime-text), and Atom). But, well, I stand by Emacs, contrary to Swizec Teller [who definitely made the switch](https://swizec.com/blog/vscode-better-editor-emacs/swizec/7921). Spacemacs offers an all-in-one Emacs configuration, including very handy packages like [helm](https://github.com/emacs-helm/helm), [which-key](https://github.com/justbur/emacs-which-key), [avy](https://github.com/abo-abo/avy), [ace-window](https://github.com/abo-abo/ace-window), [paradox](https://github.com/Bruce-Connor/paradox), and many more. They had support for [transient state](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#transient-states): these are temporary modes that sits on top of current buffer and active modes and that allows to repeat specific actions displayed in a minibuffer. Three editing modes are offered. I chose the "hybrid" mode although I merely use Emacs shortcuts. Finally, packages are organized around "layers", with lazy loading, and everything is defined in a few Elisp files (but essentially the "init.el" files). Try it, it is worth the bill!

![Spacemacs](/img/spacemacs.png)

I spend a lot of time reading and archiving my notes using a combination of [Markdown](https://jblevins.org/projects/markdown-mode/), [helm-bibtex](https://github.com/tmalsburg/helm-bibtex) and [Marked](http://marked2app.com). After two months of using these tools, I found that it was a quick and safe way of organizing all things together. In Marked app, I can apply a preprocessor for weaving code notebook while the processor is used to render the final text using custom CSS. Kieran Healy used to use a [similar approach](https://github.com/kjhealy/pandoc-templates).


### Sidenote

We can predict nothing with certainty (...).[^1]

This year, I will try to concentrate on different topics: econometrics, mathematics and bayesian statistics. I am no longer involved in psychometrics or biostatistics research, so it is probably time to learn new things. I would also like to be more proficient in Clojure, Racket and Swift, so I will try to post some snippets of code more regularly. As always, what really matters is being able to find good support for numerical computing and data visualization. Otherwise, for routine work I stand on more "classical" scientific toolboxes like Python, Stata and Mathematica. What about R? Well, that really deserves another post. But, in a few words, the [tidy](https://www.tidyverse.org) way of doing data analysis started to make me crazy at some point so I will stick to "old-fashioned R", keeping [ggplot](http://ggplot2.org) and [data.table](http://r-datatable.com/) along the way, in my workflow.

[^1]: Senn, Stephen. *Dicing with death. Chance, risk and health*. Cambridge University Press, 2003.
