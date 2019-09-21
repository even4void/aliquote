---
title: "Doom Emacs"
date: 2018-04-11T21:47:21+02:00
draft: false
tags: ["emacs"]
categories: ["2018"]
---

After [Spacemacs](http://spacemacs.org), I am currently experimenting with another variant of an evil-powered Emacs: [Doom Emacs](https://github.com/hlissner/doom-emacs). As far as I can tell, it is blazing fast and the default factory settings are well thought.

<!--more-->

The installation went well and I was able to run Emacs in 10' or so. A few hours later, I was done with additional configuration using a private module. There would remain many things to add but I think I am done for tonight. At least, I can edit Markdown and Org files, with literate programming enabled in case I need to evaluate Stata, Python or Lisp code (without [ESS](https://ess.r-project.org)).

I found that all those minor edits were easier compared to Spacemacs. This is probably because we do not have to worry about accumulating custom settings in a large `init.el` file. Indeed, it is possible to separate key bindings, package options and "`setq` stuff" in different places --- `init.el`, `config.el`, `packages.el`, and `autoload/` --- which all sit in a private directory. Even if this environment relies heavily on evil, I find myself using Emacs key bindings more often than (e)Vi(l) ones, but I guess this is just a compromise between that little RSI syndrome that some people complain about and the cognitive flexibility required to switch from 15 years of Emacs habits to modal editing.

I should note that I have nothing against Spacemacs: this is a big project and a really big plus for people that are looking for a default Emacs distribution (e.g., [Prelude](https://github.com/bbatsov/prelude) or so-called starter kits). Some folks resigned themselves to [give up](http://thume.ca/2017/03/04/my-text-editor-journey-vim-spacemacs-atom-and-sublime-text/), others started to [build their own Spacemacs](https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/) or the [biggest project (of their) life](https://dsdshcym.github.io/blog/2018/01/22/compare-doom-emacs-spacemacs-vanilla-emacs/), and many were after that [particular theme and UI](http://pragmaticemacs.com/emacs/get-that-spacemacs-look-without-spacemacs/) (Google that one, you will find so many hits!). I have been using it as my default configuration since 2016, and I may come back to it if I feel unhappy with this new environment. After all, Doom Emacs is carried by one person alone. This was originally a private configuration that went through GitHub, along with other nice Emacs enhancements like [doom-themes](https://github.com/hlissner/emacs-doom-themes). It may become broken at some point, or not maintained anymore. That would be another doomed part of it.

Anyway, here is a screenshot of me writing one of the next post for this blog:

![Doom Emacs](/img/2018-04-11-21-55-27.png)

On second thought, that's a little bit funny: this is Emacs with Vi modal editing and Atom look'n feel. 

{{% music %}}Spiritualized • *Ladies and Gentlemen*{{% /music %}}
