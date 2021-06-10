---
title: "Recently"
date: 2021-06-10T21:22:33+02:00
draft: false
tags: ["readings", "self"]
categories: ["2021"]
---

I recently subscribed to a free [Bnc4Free](https://bnc4free.com/) account in order to keep track of my IRC session. I already save daily log, but since I'm not running Irssi 24h/24, I miss part of the day, especially in the US. I know I should be setting up the whole stuff on a dedicated server at home --- and I will do, one day, but I was too lazy the past few weeks. Anyway, it's been working well and I now get a buffer playback saved in my logs as well. I've been using IRC for 15 years or so now, mostly as a casual user (ghost reader or private chat session), but it [fits well](/micro/2021-06-09-08-51-48/) in my setup.

[The Book of Statistical Proofs](https://statproofbook.github.io/) is "a centralized, open and collaboratively edited archive of statistical theorems for the computational sciences." It looks like the future Wikipedia for serious stats users. Let's see how it evolves. On a related point, I also like [Modern Statistics for Modern Biology](https://web.stanford.edu/class/bios221/book/), by Susan Holmes and Wolfgang Huber. I probably mentioned it a few times on this blog or the micro-blog, but it really is a nice resource for R practitioners (mostly base R and ggplot2, as it should be).

Sometimes I wish great authors provide RSS feed for us, human beings, who like keeping an archive of their readings. Lately I came across [Infinite Ink](https://www.ii.com/) which has very interesting articles to review, and a beautiful web UI. Unfortunately, no link to add to my RSS reader, and I'm doomed to not forget about this very elegant site. I now have more than 500 feed in my personal [OPML file](files/chl.opml). Feel free to grab what you find interesting there. And yes, Dirk, there're still people reading others' blog, especially yours.

{{< twitter 1402791696979660801 >}}

Keep up the good work up, Dirk, I'll be listening. Also, no idea what happens on Seth Brown's side, but [his site](https://seth-brown.net/) keeps changing again and again. Sadly, no more blog posts available at the time of this writing.

My Emacs -> Vim switch is going well. I'm left with [vim-polyglot](https://github.com/sheerun/vim-polyglot) (+1) and the [LSP stuff](https://langserver.org/), which works more (Python and Rust) or less (Haskell and R). This reminds me of John D. Cook's [famous talk](https://channel9.msdn.com/Events/Lang-NEXT/Lang-NEXT-2012/Why-and-How-People-Use-R) about DSL languages. Yes, we need DSLs, and the tools around. What's the issue with the tooling around the language? I believe [ESS](https://ess.r-project.org/) and [Intero](https://chrisdone.github.io/intero/) are the best ways to interact with R or Haskell, whatever is meant by "interact". And yes, I know [what a REPL is](https://yyhh.org/blog/2021/03/how-much-can-a-clojure-developer-do-alone/). Unfortunately, there's nothing close to that in the LSP ecosystem yet. I'm left with R's [languageserver](https://github.com/REditorSupport/languageserver), which sucks at rendering online help via the K key because of [rmarkdown issues](https://github.com/REditorSupport/languageserver/commit/5f1d88e756baeefa93101ae3c713e543e4e6c386) (I reverted back to v0.3.9 because of that), and [neoterm](/post/vim-neoterm/) to get a "live REPL" or sort of. Same for Haskell's tools, btw. All inone, LSP tooling looks like you all get "goto", "hover", and "doc" for free, nothing more (especially when code action are not implemented), IMHO.

And yes, plants are growing well in case you were asking.

{{< fluid_imgs
  "pure-u-1-2|/img/IMG_1530.JPG"
  "pure-u-1-2|/img/IMG_1536.JPG"
>}}
