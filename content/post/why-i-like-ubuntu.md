---
title: "Why I like Ubuntu"
date: 2023-09-04T15:34:30+02:00
draft: false
tags: ["unix"]
categories: ["2023"]
---

A few years ago I switched to Linux after having been a fervent Mac user for over 13 years. I somewhat lost interest in the Apple ecosystem on my Macbook, and I was mostly using TUI applications anyway. I nerver upgrade past Mojave, and I've been following the up and down of each new release afterwards. My phone is an iPhone 6 which can't be upgraded anymore. I don't plan to buy a new one: too expensive, too large. I only bought the iPhone 13 mini for my son for his birthday, at a reduced price. Anyway, I wish the iPhone 3 was still a thing. I don't really like the idea that OS upgrade are so much tighted to the device. And the sandboxing policy, which I always found at an angle with what OpenBSD offers, for example. Well, I already wrote [my thoughts](/post/bye-bye-apple/) about all of that, apparently.

Switching to Ubuntu was like going back in time since I was a Linux user during my PhD, and I used a lot of distros: Madrake (1 yr), Red Hat (1 yr), Slackware (6 mo) and finally Debian (2 or 3 yr). I didn't really miss anything when I started using [Ubuntu](/post/one-week-with-ubuntu/) as I was comfortable with the command line, and all the applications I used on the Mac mainly ran on the command line. I also installed OpenBSD on another laptop, but no other Linux boxes. Note that I did not try any other mainline or fancy Linux distros, so in this post I am only speaking of Ubuntu.

Recently, I came across a nice blog post by Alan Pope: [Why I use Ubuntu](https://popey.com/blog/2023/08/why-i-use-ubuntu/). Among the key points, I like that it works and that it offers a relatively secure and consistent UI. Compared to Debian, it is way easier to bring back to life an old Macbook pro with retina display and specific wireless driver. I may try Fedora at some point, at least to remind me of my RPMs days. I should not that there are things that I don't really like, but snap is probably one of the ugly thing that comes to my mind. I already purged everything related to snap on my machine, but I keep seeing applications that are only available via snap or flatpak, along Docker sometimes.

> I’ve been using Ubuntu now for eighteen years. I know (roughly) how it works. I am familiar with the release cadence and set my expectations accordingly. I can manage to upgrade from one release to another without the sky falling in. When something does go wrong, I’m able to fix it or find out how to. I rarely ’nuke and pave’ a system, even if it seems beyond repair.

I am probably a lucky guy but my Ubuntu personal machine never crashed. I had occasional problems on one of the two servers I manage at work, but this was easy to fix. I have a very spartan use of graphical applications, and I mostly work in a terminal. I discussed this extensively in [previous posts](/tags/unix/). What I really like is the package manager: compared to Homebrew on my Macbook, everything is in order, perfectly in sync with upstream versions, without any dependency issues (most of the time). When you remove a program, the OS takes care of properly (most of the time) removing its dependencies as well.

I've tried various setups in the past (i3 or Regolith on x11), pseudo-tiling WM (Tactile extension for Gnome) and then settled upon the default settings, pending minor customizations (e.g., removing the Dock, enhancing the menu bar), but see [How to get by without using a tiling WM](/post/how-to-do-without-wm/). Tmux is really all what I need to manage my terminal sessions, and you know, it's just [plain text](https://archive.org/details/aquartercenturyofunixpeterh.salus_201910).

> Software should be well designed because good design avoids many problems during its lifetime. Also, because good design can offer much additional gain. Indeed, much effort should be spent on good design to make software more valuable. The Unix Philosophy pro- vides a way to design software well. It offers guidelines to achieve good quality and high gain for the effort spent. --- [Why the Unix Philosophy still matters](/pub/unix-philosophy.pdf)

{{% music %}}Adam Wakeman • _The Island_{{% /music %}}
