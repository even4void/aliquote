---
title: "August in review"
date: 2024-08-21T14:47:12+02:00
draft: true
tags: ["readings"]
categories: ["2024"]
---

Here are some recent links and past bookmarks that were awaiting some kind of a short review.

- [Good Python Software](https://amontalenti.com/2024/05/28/good-python-software): This post rang a bell as I was also in the middle of transitionning all my previous Python workflows to using Poetry or rye. See also [Rye and uv: August is Harvest Season for Python Packaging](https://lucumr.pocoo.org/2024/8/21/harvest-season/).
- I recently learned that there's still a place for Javascript free utilities in the world of YT and Twitch, see [wtwitch](https://github.com/krathalan/wtwitch) and [ytfzf](https://github.com/pystardust/ytfzf). Sadly, the latter will probably go in quiet mode. Everything works smoothly with mpv, no subscription or OAUTH token required.[^1]

{{% music %}}XXX • _XXX_{{% /music %}}

[^1]: You will need to install [streamlink](https://streamlink.github.io/) -- even if mpv handles live streams perfectly well. The best option for Ubuntu so far is to create a virtual environmement and `pip install streamlink`. The binary will be available in the `bin` directory and you can symlink to it from any directory in your `$PATH`.
