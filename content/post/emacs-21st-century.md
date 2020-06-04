---
title: "Emacs for the 21st Century"
date: 2020-06-04T12:11:03+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

Emacs has a long tradition of being a versatlie text editor for code, prose, GTD, and it may even replace your OS if you're into this kind of stuff (don't be kiddy, though, read a more [opinionated version](https://writequit.org/eos/eos.html)). I discovered Emacs when I was doing my PhD, and never looked back -- except when Textmate came up a while back. Too late to change: I'm probably too old now, and I would probably not really know how to use another editor in any case. [Emacs is Emacs](https://news.ycombinator.com/item?id=18398324), after all.

> While Emacs proponents largely agree that it is the world’s greatest text editor, it is almost as much a Lisp machine disguised as an editor. Indeed, one of its chief appeals is that it is programmable via its own programming language. Emacs Lisp is a Lisp in the classic tradition. In this article, we present the history of this language over its more than 30 years of evolution. Its core has remained remarkably stable since its inception in 1985, in large part to preserve compatibility with the many third-party packages providing a multitude of extensions. Still, Emacs Lisp has evolved and continues to do so. --- [Evolution of Emacs Lisp](https://www.iro.umontreal.ca/~monnier/hopl-4-emacs-lisp.pdf)

I'm not alone, hopefully, and you'll find many accounts of why Emacs is great, e.g., [Two Years With Emacs as a CEO (and now CTO)](https://www.fugue.co/blog/2018-08-09-two-years-with-emacs-as-a-cto.html), the latest random "[why I switched to](https://protesilaos.com/codelog/2019-08-11-why-emacs-switch/)" I found on DuckDuckGo --- there are so many, or [Remote First, Pair Programming and Emacs](https://eamonnsullivan.co.uk/posts-output/2020-04-25-remote-first-emacs/), for the latest I came across today.

I'm not that fancy regarding Emacs config, nor do I have to do exceptionally hard things in Emacs. I just want a punctilious text editor, with good support for text spelling (occasionally) and linting(always --- that's where being a bit obsessive bless), that allows me to open as many buffers as I want (regardless of the working directory, okay Vim?), including shell and the like. Emacs does the job, and it does it right, that's all!

I have countless of personal `.emacs.d` config stored in my bookmark list, I keep posting [various links](https://aliquote.org/search/?s=%23emacs), and I recently spent a fair amount of time (re)configuring how my Emacs looks. I fear that only those who abound in the sense of ultimate procrastination will be able to understand the joy that a tiny change in the way colors are used to edit Python or Lisp code can bring. Or how you can solve this fucking [issue](https://github.com/hlissner/doom-emacs/issues/2967) with [doom-modeline](https://github.com/seagle0128/doom-modeline) right-handed overflow after more than one year. Yes, this is just Emacs after all, you can make it looks the way you want, if you have a good search engine and time to waste of course.

That being said, it's been three weeks that I processed all incoming emails through [mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html), and that I used [vterm](https://github.com/akermu/emacs-libvterm) (not that [vterm](https://github.com/vterm/vterm,)) as a handy replacement for my default terminal ([iTerm2](https://www.iterm2.com)), not to forget `xwidget` support which provides a way better (in some sense of "way") experience for web browsing than [eww](https://www.gnu.org/software/emacs/manual/html_mono/eww.html). I don't know what Emacs will be in the next decade, but surely I'm on the right track and will keep doing fine.
