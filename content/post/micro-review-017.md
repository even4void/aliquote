---
title: "May in review"
date: 2021-05-30T21:47:14+02:00
draft: false
tags: ["readings"]
categories: ["2021"]
---

Here is yet another monthly review of what I found of possible interest while browsing the interweb.

- [Haskplex = Hasklig + IBM Plex Mono](https://github.com/huytd/haskplex-font). I already use the IBM Plex font family on this site because I no longer wanted to depend on [Google font API](/post/site-redesign/). After almost three years using Iosevka as my primary font for my text editor and terminal, I switched to [JetBrains Mono](/micro/2020-01-24-16-49-36/) a while ago and I am quite happy with that "wider" font. However, I should note that IBM Plex fonts are really good, and it is good to know that we can have ligatures and icons for free with this little font pack.

- Re-reading [History and effective use of Vim](https://begriffs.com/posts/2019-07-19-history-use-vim.html), from one of the [latest micro-review](/post/tech-review-july-2019/). Like I always learn something cool every time. On a related note, I follow [strager](https://strager.net/essays.html) (aka Matthew Glazar) on [Twitch](https://www.twitch.tv/strager) and I recently learnt about `:diffthis`, which is a really cool command if you just want to diff two buffers after copying/pasting the content of two compile results, for example. Always learning, but I already learnt a "lot of Vim" from this guy alone.[^1]

- Here is an interesting article on [Automated Data Wrangling](https://catalyst.coop/2021/05/23/automated-data-wrangling/), with useful links, including *Data Cleaning* by Ihab Ilyas and Xu Chu (2019). I would add that a substantial amount of data cleaning, data verification and quality control techniques are covered in *Statistical Data Cleaning with Applications in R* by Mark van der Loo and Edwin de Jonge (2018).

- Best online TILs made by [Simon Willison](https://til.simonwillison.net/) and [David Winterbottom](https://til.codeinthehole.com/). Add their RSS feeds to your reader, it is worth to check some of their recipes from time to time.

- Interesting discussion on git merge strategy: [Two years of squash merge](https://blog.dnsimple.com/2019/01/two-years-of-squash-merge/). TL;DR `git merge --squash` allows to aggregate all the changes done in a separate branch into a single unified commit.

  > Commits are essentially immutable. Technically there are ways to rewrite the history, but there are several reasons you generally don't want to do it. For the sake of simplicity, let's say the farther the commit is in the repository history, the more complicated it is to rewrite it.

- If you're looking for some fancy tinted colors: <https://www.december.com/html/spec/colorshades.html>.

- [The Only Vim Insert-Mode Cheatsheet You Ever Needed](https://dev.to/iggredible/the-only-vim-insert-mode-cheatsheet-you-ever-needed-nk9)

- [Reactive, reproducible, collaborative: computational notebooks evolve](https://www.nature.com/articles/d41586-021-01174-w). Yet another article on reproducibility and notebooks. Still, I don't find like it will ever solve the [state dependency problem](https://pythonawesome.com/fearless-interactivity-for-jupyter-notebooks/) without extra care (plus version control is harder compared to single scripts).

- [How to Think Like a Computer Scientist: Interactive Edition](https://runestone.academy/runestone/books/published/thinkcspy/index.html). Nice project.

- In case you miss some good reads for the week-end, check out some of Eli Bendersky's great posts:

  - [Right and left folds, primitive recursion patterns in Python and Haskell](https://eli.thegreenplace.net/2017/right-and-left-folds-primitive-recursion-patterns-in-python-and-haskell/)
  - [Type inference](https://eli.thegreenplace.net/2018/type-inference/)
  - [Where the top of the stack is on x86](https://eli.thegreenplace.net/2011/02/04/where-the-top-of-the-stack-is-on-x86/)

[^1]: Sadly, Suz Hinton (alias noopkat) will no longer be streaming.
