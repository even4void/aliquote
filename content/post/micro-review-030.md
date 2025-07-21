---
title: "July in review"
date: 2025-07-20T19:49:55+02:00
draft: false
tags: ["readings"]
categories: ["2025"]
---

- <https://news.ycombinator.com/item?id=11071754>: It's been a long since I deleted all my dotfiles on GitHub. Who cares? I have my own setup backed up on external HD and private repos if I need to deploy them on new machines. It has been working fine so far. Also, I must say I'm now barely maintaining a few CLI tools: Zsh, Neovim, Tmux, and Neomutt. Anyway, I've been using this approach for a while ten years ago and it's pretty simple and efficient.

- [Lisp in Vim with Slimv or Vlime](https://news.ycombinator.com/item?id=29612209) on HN. This provides a reasoned account of why a true REPL is better than any send-to-terminal plugin, like vim-slime. I always enjoy reading Susam Pal's articles. It seems I didn't bookmarked the right HN threads, but there are plenty other posts around this very nice post of him. See also [this thread](https://news.ycombinator.com/item?id=40436926).

- [Ghostty 1.0](https://news.ycombinator.com/item?id=42517447) on HN. Yet another interesting thread where I learned a lot about pseudo terminal and technical details like missing damage tracking or the use of rendering threads as QoS background. In a similar vein, I highly recommend Gregory Anders's discussion on the [State of the Terminal](https://gpanders.com/blog/state-of-the-terminal/) to learn more about key encoding and capabilities as reported by `infocmp`. At present, I'm happy with Apple Terminal, especially since I mostly use B&W color scheme everywhere, [^1] and Tmux takes care of the rest for me. I may change my mind later.

- I recently learned about [tex2page](https://github.com/ds26gte/tex2page) which looks like an interesting alternative to [Hevea](https://hevea.inria.fr).

- [Why your website should be under 14kB in size](https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/). I don't really care how long it takes to load each pahe of this website as long as it is not too much. I really care about the fact that pages don't look too much bloated and that they are readable on almost any browsers. I cry whenever I came across websites where we can barely read anything because of bad design or unreadable text with crazy background.

- [I'm Switching to Python and Actually Liking It](https://www.cesarsotovalero.net/blog/i-am-switching-to-python-and-actually-liking-it.html): If you're into [uv](https://github.com/astral-sh/uv), this post might be of interest. I learned about [ty](https://github.com/astral-sh/ty) by reading this post. More than uv, the author mentions many tools and techniques that should be considered good practises nowadays.

> I strongly believe the maximum quality of work is reached using the human+LLM equation. I believe that humans and LLMs together are more productive than just humans, but this requires a big “if”, that is, if such humans have extensive communication capabilities and LLMs experiences: the ability to communicate efficiently is a key factor in using LLMs. --- [Coding with LLMs in the summer of 2025](https://antirez.com/news/154)

{{% music %}}LeAnn Rimes • _How Do I Live_{{% /music %}}

[^1]: I became so lazy over the years that I didn't bother to make a truly B&W theme for Neomutt. I just configured the mono color scheme and made an alias for Zsh: `alias mutt="TERM=vt100 neomutt"`.

