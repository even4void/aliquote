---
title: "July in review"
date: 2022-08-02T11:02:22+02:00
draft: false
tags: ["readings"]
categories: ["2022"]
---

In which I summarize what I've read recently on the [intertube].

- I haven't touched my Neovim config during 30 days, except for minor adjustments of my custom mappings. Well, it may well be because I was on holidays as well. Anyway, things start to come up right, I think. The more stuff I delete, the more it let me think about internal stuff, much like in this nicely set up blog post by Joe Nelson that I already mentioned somewhere on this site: [History and effective use of Vim]. Likewise, I reverted back to Ubuntu defualt settings (default display manager, defualt font, etc.), and it has been working great for me.

- TIL about [whonix], which is a full operating system, including common chat and office applications, that runs inside your current one via Tor, with added security layers. It might be a good way to get a secured OS on a USB stick.

- If you're looking for lightweight and minimalist, stop by the [Inconsolation] blog. You will likely find useful suggestion for old-fashioned but resilient software for pretty everything. But see this blog post if you look for a [different take] on so-called digital minimalism.

- The Ghostscript suite got a new [PDF interpreter]. It's been a while since I no longer rely on DVI+PS conversion for $\LaTeX$ typesetting -- maybe I should, at least for the quality of the fonts in print form -- but I still use Ghostscript utilities from time to time. A recurrent command I use if `gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=merged.pdf *.pdf` to assemble a series of individual PDF files.

- [Differentiable Programming from Scratch] covers the basics of numerical and symbolic differentiation, as well as automatic differentiation, with lot of pretty illustrations.

- An old but good post about page weight, by Chris Zacharias: [Page Weight Matters]. For a related discussion, check out Tom MacWright's opinion on web design, especially his [site redesign].

- [Clojure needs a Rails, but not for the reason you think]. If I were to use a functional language to write my genomic data apps, I would certainly chose either Clojure or a combination of Elm+Elixir. I'm surpised there's nothing already for starting right away with Clojure. I remember the [Noir] framework, but well it looks like 10 years old and unmaintained.

- I always reading "naturalistic" data science or web scraping on real data. Here's the most recent one: [Famous HNers and Their Sites].

- [Reference Count, Don't Garbage Collect]: An interesting overview with pros and cons of reference counting vs. garbage collection.

- The best average time complexity of Timsort is $\mathcal{O}(n)$. Hard to beat. See more in [Timsort -- the fastest sorting algorithm you’ve never heard of].

- [How a window manager with tiling layouts makes a 1024x600 resolution livable]. And, yes, he lives in a cabin. Since I'm now on Wayland, I may try [Sway] at some point, but see [Trying out Sway and Wayland].

- [SQLite Internals: Pages & B-trees](https://fly.io/blog/sqlite-internals-btree/): A technical review of SQLite internals. Pretty good job!

- [Flipping until you are lost]: A summary of a recent paper on convex polygon triangulation flip walk ([arXiv:2207.09972]).

> Still, the purists proclaim, it's not enough. Python is not a replacement for Haskell. But does it matter? 90% of the impressive magic from early functional languages has been rolled into mainstream languages. That last 10%, well, it's not clear that anyone is really wanting it or that the benefits are actually there. Purity has some advantages, but it's so convenient and useful to directly modify a dictionary in Python. Fold and map are beautiful, but they work just as well in the guise of a foreach loop. --- [Functional Programming Went Mainstream Years Ago]

{{% music %}}Deep Sea Diver • _Shattering the Hourglass_{{% /music %}}

[intertube]: https://www.worldwidewords.org/turnsofphrase/tp-int5.htm
[history and effective use of vim]: https://begriffs.com/posts/2019-07-19-history-use-vim.html
[whonix]: https://www.whonix.org/
[inconsolation]: https://inconsolation.wordpress.com/
[different take]: https://applied-langua.ge/posts/terminal-boredom.html
[pdf interpreter]: https://www.ghostscript.com/blog/pdfi.html
[differentiable programming from scratch]: https://thenumb.at/Autodiff/
[page weight matters]: https://blog.chriszacharias.com/page-weight-matters
[site redesign]: https://macwright.com/2016/05/03/the-featherweight-website.html
[clojure needs a rails, but not for the reason you think]: https://blog.janetacarr.com/clojure-needs-a-rails/
[noir]: https://github.com/noir-clojure/noir
[famous hners and their sites]: https://jessimekirk.com/blog/hn_users_links/
[reference count, don't garbage collect]: https://kevinlawler.com/refcount
[timsort -- the fastest sorting algorithm you’ve never heard of]: https://skerritt.blog/timsort/
[how a window manager with tiling layouts makes a 1024x600 resolution livable]: https://joeyh.name/blog/entry/xmonad_layouts_for_netbooks/
[sway]: https://swaywm.org/
[trying out sway and wayland]: https://sagrista.info/blog/2022/wayland-sway/
[flipping until you are lost]: https://11011110.github.io/blog/2022/07/21/flipping-until-lost.html
[arxiv:2207.09972]: https://arxiv.org/abs/2207.09972
[functional programming went mainstream years ago]: https://prog21.dadgum.com/31.html
