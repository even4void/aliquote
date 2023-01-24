---
title: "January in review"
date: 2023-01-21T18:41:31+01:00
draft: false
tags: ["readings"]
categories: ["2023"]
---

- [Modern Polars](https://kevinheavey.github.io/modern-polars/) offers a side by side comparison of the Polars and Pandas libraries for working with rectangular datasets in Python. From reading the Polars documentation, I like the idea of having select or filter methods, instead of relying on Pandas default indexing facilities. We can even address rows and columns using numbers, like in R, which would make transitioning from R data frame less hard than when using Pandas. See also [Replacing Pandas with Polars. A Practical Guide](https://www.confessionsofadataguy.com/replacing-pandas-with-polars-a-practical-guide/).

- [A Visual Guide to SSH Tunnels: Local and Remote Port Forwarding](https://iximiuz.com/en/posts/ssh-tunnels/): This is a handy tutorial for local and remote [port forwarding](https://www.ssh.com/academy/ssh/tunneling-example#remote-forwarding) with great illustrations. It covers everything you need to know to use ssh tunnels confidently. "The mnemonics are "ssh -L local:remote" and "ssh -R remote:local" and it's always the left-hand side that opens a new port."

- If you are looking for a quick but opinionated overview of Vim's for editing code at the speed of light, [Vim is touch-typing on steroids](https://www.trickster.dev/post/vim-is-touch-typing-on-steroids/) does a great job.

- [snakemake for doing bioinformatics - a beginner's guide ](http://ivory.idyll.org/blog/2023-snakemake-slithering-section-1.html): I'm still not convinced that [snakemake](https://snakemake.readthedocs.io/en/stable/) is the best way to manage data processing using shell commands, and I'm still relying on Bash scripts and occasionally good old Makefile. Things that really rock, though, are job caching and multi-core capabilities (based on binary knapsack optimisation).

- A while ago I learned about phased packages in Ubuntu (there seems to be an increasing number of such phasing process in the 22.04 LTS, by the way), but Chris Siebenmann covers it elegantly in one of his recent [blog post](https://utcc.utoronto.ca/~cks/space/blog/linux/Ubuntu2204ServerPhasedUpdates).

- [Faster virtual machines: Speeding up programming language execution](https://mort.coffee/home/fast-interpreters/): For compiler and static typing enthusiasts. See also [Assembly Optimization Tips](https://mark.masmcode.com/) for more optimization on the dark side.

- [Demystifying Apache Arrow](https://www.robinlinacre.com/demystifying_arrow/): A quick and decent summary of Apache Arrow main features for data munging.

- [Reflecting on Transducers](https://www.thatgeoguy.ca/blog/2023/01/04/reflections-on-transducers/), or how to get around Scheme missing a generic way to operate over different collections.

- [These Years in Common Lisp: 2022 in review](https://lisp-journey.gitlab.io/blog/these-years-in-common-lisp-2022-in-review/): A thorough overview of what happened last year in the CL ecosystem. This covers various topics like the previous year (concurrency, databases, games and graphics, etc.). I like this kind of year in review since it allows me to discover a lot of interesting projects like [Kons-9](https://github.com/kaveh808/kons-9), for instance. If you are into gaming (coding and/or playing), you probably heard of [Kandria](https://github.com/Shirakumo/kandria) which was released in recent months. If you want to learn more about CL, the author is currently working on a [Common Lisp Video Course](https://lisp-journey.gitlab.io/blog/i-am-creating-a-common-lisp-video-course-on-udemy/).

- [Rust for professionals](https://overexact.com/rust-for-professionals/) is a short introduction to Rust, intended for developers that already know another language, according to its author. It is a bit like learn xx in xx hours/days/weeks, but it may help getting a taste of the language before delving in the [Rust book](https://doc.rust-lang.org/book/index.html).

{{% music %}}kim dracula • _Paparazzi_{{% /music %}}
