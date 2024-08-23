---
title: "August in review"
date: 2024-08-21T14:47:12+02:00
draft: false
tags: ["readings"]
categories: ["2024"]
---

Here are some recent bookmarks that are worth a mention somehow.

- [Good Python Software](https://amontalenti.com/2024/05/28/good-python-software): This post rang a bell as I was also in the middle of transitioning all my previous Python workflows to Poetry or rye. See also [Rye and uv: August is Harvest Season for Python Packaging](https://lucumr.pocoo.org/2024/8/21/harvest-season/).
- I recently learned that there's still a place for Javascript-free utilities in the world of YT and Twitch, see [wtwitch](https://github.com/krathalan/wtwitch) and [ytfzf](https://github.com/pystardust/ytfzf). Sadly, the latter will probably go in quiet mode. Everything works smoothly with mpv, no subscription or OAUTH token required.[^1] See also [Youtube Without Youtube; Watching Videos on the Command Line](https://blog.sergeantbiggs.net/posts/youtube-without-youtube-watching-videos-on-the-command-line/).
- Francis Bach has made his draft book, [Learning Theory from First Principles](https://www.di.ens.fr/~fbach/ltfp_book.pdf), available for free on his website. I don't have time to read it right now, but it now sits in my inbox.
- I'm still experimenting a bit with [Jasp](https://jasp-stats.org/). It's pretty impressive whet they achieved with R as a backend. Here's the [list of packages](https://jasp-stats.org/r-package-list/) they incorporated into Jasp.
- [Examples logo MetaPost](https://metapost.gutenberg-asso.fr/?page=accueil): I totally forgot about this site and it was funny to browse some of the samples. If you're interested in $\LaTeX$ and MP, be sure to check [Christian Borgelt](https://borgelt.net/) website where he hosts a bunch of nice looking slides and MP samples. And yes, he's the author of the Apriori and Eclat algorithms (among others).
- I came across the [Neovim N Λ N O Theme](https://github.com/ronisbr/nano-theme.nvim), which is inpired by Nicolas Rougier's Emacs theme. Originally, it was this [GH repo](https://github.com/Bekaboo/nvim) which led me to search for a Nano theme.
- I'm trying out a few Gnome extensions for a few days, in particular [tophat](https://github.com/fflewddur/tophat). It looks good so far.
- I just noticed that [Tom MacWright](https://macwright.com/) now uses a [micro](https://macwright.com/micro/)-blogging system. Looks nice.

{{% music %}}Wire • _I Am the Fly_{{% /music %}}

[^1]: You will need to install [streamlink](https://streamlink.github.io/) -- even if mpv handles live streams perfectly well. The best option for Ubuntu so far is to create a virtual environment and `pip install streamlink`. The binary will be available in the `bin` directory and you can symlink to it from any directory in your `$PATH`.
