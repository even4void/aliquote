---
title: "August in review"
date: 2020-08-04T07:19:53+02:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

A little bit early, but I wanted to record recent bookmarks from my RSS reader as well as various links stored in my Safari reading list.

- Loup Vaillant has a nice post on his website: [Cryptography is not Magic](http://loup-vaillant.fr/articles/crypto-is-not-magic). Beside references provided therein, I also found this recent handbook on applied cryptography: [A Graduate Course in Applied Cryptography](http://toc.cryptobook.us).

- [The Haskell Elephant in the Room](https://www.stephendiehl.com/posts/crypto.html): Another nice article by Stephen Diehl on the current state of the Haskell ecosystem in relation especially to cryptocurrency.

  > Cryptocurrency is not a traditional business in any sense. The basic economic structure of a business is a group of people who exchange their goods or services for money. For example, your traditional software consulting business sells your time and expertise to clients to write software for them. Your ecommerce website provides a marketplace to sell physical goods. Your local coffee shops sells you wifi under the guise of coffee. However cryptocurrency companies do not produce anything, instead they offer synthetic financial products which are marketed to the generic public as investments. These “investments” are not tied directly to economic activity, these are what economists call non-productive assets. The value of these assets is only determined by what other people are willing to pay for them. This has created a giant ecosystem in which products aren’t traded on any investment fundamentals but on the hope to sell them off to a “greater fool”.

- [Number regexes are hard](https://leancrew.com/all-this/2020/07/number-regexes-are-hard/), or how to take into account n-dash and the like when parsing numbers.

- [The Right Dictionary and How to Get It](https://irreal.org/blog/?p=9035): So now, I also have the Webster's dictionary available on my Mac. Be sure to read the companion blog post, [You’re probably using the wrong dictionary](http://jsomers.net/blog/dictionary), and don't worry: it will take some time to build the final dictionary as advertised in the blog post.

- We got a few updates the last few weeks: [Highlights from Git 2.28](https://github.blog/2020-07-27-highlights-from-git-2-28/) with Bloom filters, [Racket v7.8](https://blog.racket-lang.org/2020/08/racket-v7-8.html), and [Julia 1.5 Highlights](https://julialang.org/blog/2020/08/julia-1.5-highlights/). It's probably time to switch to Racket on Chez since the next release will default to it, and I definitely need to start hacking on Julia again.

- I'm lagging behind regarding Kubernetes and Co. This recent article highlight the benefit of using [k3s](https://k3s.io) to run a [single-node Kubernetes cluster without virtualization or a container registry](https://notes.eatonphil.com/a-single-node-kubernetes-cluster-without-virtualization-or-a-container-registry.html).

- I subscribed to a few RSS feeds that deal almost exclusively with Haskell or related functional PLs (ML, OCaml). Now I learned that there's a [Haskell Planetarium](https://haskell.pl-a.net), which I find quite handy for other-than-blog feeds.

- Haki Benita provides some useful tips in his recent post [Some SQL Tricks of an Application DBA](https://hakibenita.com/sql-tricks-application-dba), especially regarding the use of indexes.

- For Python development, I use almost exclusively use Emacs and its LSP packages, and I have Blake and Flake8 set as the default programs for linting and formatting. Sometimes I think it might be a better idea to delegate those tasks to specific task in a Makefile, but it is also possible to rely on Git hooks, see [Automate Python workflow using pre-commits: black and flake8](https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/ "
").

- Even if this is not my day job, I love reading about compiler, debugger and operating systems. This post [Writing a file system from scratch in Rust](https://blog.carlosgaldino.com/writing-a-file-system-from-scratch-in-rust.html) provides a clear overview of file systems, i.e. how directories and files are represented, and how indirect pointers can be used.

- I try to learn more Vim (for Doom Emacs and Neovim). Here are some of my recent reads: [Why I love Vim: It’s the lesser-known features that make it so amazing](https://www.freecodecamp.org/news/learn-linux-vim-basic-features-19134461ab85/), [Efficient Editing With vim](http://robertames.com/files/vim-editing.html).

> We aim to improve our ability to engineer artificial intelligence, reverse-engineer natural intelligence, and deploy applications that increase our collective intelligence and well-being.<br>We do this by integrating probabilistic inference, generative models, and Monte Carlo methods into the building blocks of software, hardware, and other computational systems. --- [MIT Probabilistic Computing Project](http://probcomp.csail.mit.edu)
