---
title: "September in review"
date: 2020-09-09T15:13:33+02:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

Here's the monthly review of interesting things I found while browsing Hacker News, Twitter, or RSS feeds.

- [Non-POSIX file systems](https://weinholt.se/articles/non-posix-filesystems/) is such a great piece of writing about POSIX and other filesystems, by a prolific Scheme coder.

  > Multics enabled a superior paradigm for storage management and backups. Xerox Alto allowed a disk structure to be restored even if all metadata blocks had been damaged. Hydra used a capability system to provide a powerful protection mechanism for data. All of these enabled interesting types of functionality that we are missing in POSIX.

- I subscribed to [svetlyak40wt](https://twitter.com/svetlyak40wt)'s [Lisp Project of the Day](https://40ants.com/lisp-project-of-the-day/2020/08/0167-cl-flat-tree.html) during the Summer, and I learned a lot of nice tips about Lisp and existing libraries. For instance, [cl-flat-tree](http://40ants.com/lisp-project-of-the-day/2020/08/0167-cl-flat-tree.html) is a small Lisp library for working with binary trees.

- [Do a pile of work better](https://nedbatchelder.com//blog/202008/do_a_pile_of_work_better.html). Another post by Ned Batchelder, where we learn how Python's [concurrent.futures](https://docs.python.org/3/library/concurrent.futures.html) module works.

- The Neovim TUI experience is really slick, and it remains so fast. Even if I don't load a lot of plugins, it remains by far the fastest text editor available on my Macbook. In addition, spell checking is better than Flyspell, and I believe Ale has nothing to envy to Flycheck. Yet, I spent a significant amount of time configuring my Doom Emacs to offer an enhanced user experience when running in a terminal, and it now start in just under 1.5s, which is great (yeah, I know `server-start` & Co). My core Emacs keybindings (via `which-key`) are similar to what I use in Neovim, so I am not lost when I switch from one to the other.[^1]

  > Emacs is the only serious program I know which manages to be truly user interface independent, in addition to being platform-independent. Emacs works with graphical toolkits on all major platforms, but also offers a almost-feature-complete text interface. --- [Emacs is very special regarding UIs](https://lists.gnu.org/archive/html/emacs-devel/2020-09/msg00286.html)

- [Share a Tmux session](http://planspace.org/20200902-share_a_tmux_session/). Interesting use of the `-S` flag to specify a socket. I mostly use Tmux on a remote server, but this is just to benefit from a persistent session and of course multipane facilities.

- These days, I don't write a lot of Stata code. Not a single line of code in 3 months, TBH. However, thanks to a link found in one of [Andrew Wheeler](https://andrewpwheeler.com/2020/09/04/notes-on-making-scatterplots-in-matplotlib-and-seaborn/)'s recent posts', I was reminded that the [grstyle](http://repec.sowi.unibe.ch/stata/grstyle/) is a very nice approach to customizing the look and feel of Stata graphics. By the way, regarding Python graphing facilities, there's a new one from JetBrains: [lets-plot](https://github.com/JetBrains/lets-plot). Apparently, it is intended to be use in JetBrains IDEs or in a Jupyter notebook, but it's quite interesting to know that we have yet another Ggplot-inspired graphical backend in the Python ecosystem.

- A few days ago I learned that there's now a Clojure dataframe library that runs on Spark: [geni](https://github.com/zero-one-group/geni). It seems to be a pretty serious project, nicely illustrated and with lot of documentation.

[^1]: The main reason I use Neovim on my macbook, beyond its native speed for quick editing of text files, is because (1) I wanted to be more familiar with Vim keybindings for using Emacs with Evil mode more efficiently, and (2) I only use Vim on the Ubuntu workstations I manage to administer at work.
