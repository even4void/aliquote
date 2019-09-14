+++
title = "Writing a Book"
date = 2015-07-22T15:25:06+01:00
draft = false
tags = ["statistics", "rstats"]
categories = ["2015"]
+++

I spent the last month working hard to finish my book on biomedical statistics using R.

<!--more-->

It has been a pleasuring experience since I wrote this book using Emacs, R, and git. In fact, I spent several days and nights with a screen looking like the one shown below (this is Homebrew Emacs in fullscreen mode):

![Writing a book using Emacs](/img/emacs-book.png)

Of course there are many things to fix and I'm not totally happy with the book as it stands. I think it would have been much easier to write this book five years ago. Now, there are so many good books on R that it is a very challenging task to write a new one. I have only one excuse: This book was written for students enrolled in a course on staistical computing using R, Stata and SAS. Book price should not exceed 10 € in electronic format, so I think this is a good deal for them.

As discussed in this recent blog post, [Emacs for data science](http://www.insightdatascience.com/blog/emacs_for_data_science.html), there are many editors available for various programming languages, or simply for text editing. In the past I often found myself lurking at other built-in editors or IDE with the hope that they could facilitate my daily work. This was never the case because soon or later I realized that I was always missing some of Emacs functionalities, including: powerful key bindings for text manipulation and moving around text in a buffer, working on multiple buffers with different mode at the same time, dedicated shell buffers, ESS for R processing, and so much more. Personally, I was quite happy with a shell and R running together in Emacs. To date, I never see a decent text editor that offer that flexibility (I cannot speak of vi(m) since I only know two shortcuts, `!:q` and `dd`).

Another nice post on writing a book using Emacs can be found on [masteringemacs.org](https://www.masteringemacs.org): [How to write a book in Emacs](https://www.masteringemacs.org/article/how-to-write-a-book-in-emacs), by Mickey Petersen. I doubt I will have the chance to proofread the book using `ediff`, but at least I won't have to bother with MS Word track changes since the book was written in plain LaTeX. The Wiley French template was probably written early in the 90s, with no support for unicode, such that I gave up using my knitr master file and rewrote everything, which means converting my unicode text to Latin-1 (please, never again!) and putting my R code into simple verbatim environments.


Note that in the mean time, [magit](https://github.com/magit/magit) has been updated to version 2.1 and it really rocks. Since I update my Emacs packages from various sources, including marmalade, I don't necessarily rely on stable versions. Here are my current settings, as confirmed by `M-x magit-version gives me`:

```
Magit 20150706.1106, Git 2.4.5, Emacs 24.4.50.1
```

The last commits returned by `glog` (`git log --oneline --decorate --color --graph`) speak for themselves:

```
* 4948c1b (HEAD -> master, tag: submit) Minor fixes before submitting firts draft/
* 499c07a Added one exercise to Chapter 6.
* 240121c Completed Appendix 1.
* d616404 Minor updates and proofreading for Appendix 2.
* 4aa839b Completed Appendix 0.
* 478c0e7 Added Appendix 0 on RStudio.
* 0cbfaf1 Proofreading of Chapter 7.
* e46ce44 Proofreading for Chapter 6.
* 9667955 Proofreading for Chapter 5.
* 9c7cba5 Proofreading for Chapter 4.
* 9787c34 Minor update.
* 34b4099 Proofreading for Chapter 3.
* ef373d8 Proofreading for Chapter 2.
* 719f744 Update and proofreading for Chapter 1.
* cf5fb86 Completed introduction and fixed multiple labels.
* 9ab9029 Fixed missing entry and removed duplicate.
* a95ffe0 Updated Chapter 1 and introduction.
* 7a0e17b Revert "Added exercises and solutions for Chapter 1."
```

Indeed, I only used Git to record my progress in writing this textbook, and usually I worked on one chapter at a time. I usually do the same for my lecture notes, which are hosted on Bitbucket.


{{% alert note %}}
The book has been published in 2016! See the [companion website](https://github.com/biostatsante/R).
{{% /alert %}}
