---
title: "Fresh MacBook"
date: 2020-07-17T21:35:59+02:00
draft: false
tags: ["apple"]
categories: ["2020"]
---

I got a fresh Macbook.

No, just kidding. It's just that I wiped my hard drive clean and recovered 60 GB of free space. It's not that I really need space on my hard drive, but you know what it's all about: digital minimalism and all that stuff. So I spent a few moments every two days during the past two weeks to cleanup old stuff and remove unused or dead dependencies on my Macbook, which still runs macOS Mojave by the way. Although I'm only using Emacs and Safari, and sometimes iTerm for ssh stuff, for the time being, I feel like it will be hard to switch entirely to a Linux distro. I love Mac software and hardware, and especially that particular Macbook 12″ (early 2016).

> Time is valuable commodity.<br> I use a Mac primarily because it saves me time.<br> A Mac also provides access OS X's Unix internals to do high-quality research and software development. This is why I recommend to my graduate students that they switch to Apple. --- [Tips and software for Mac users](http://matt.might.net/articles/switching-to-apple-macintosh-from-linux-or-windows/)

I know close to nothing about the future of Apple products, especially since they are switching to ARM-based processors, and iOS-like look'n feel. What I know for sure is that macOS apps are pretty much unified and UIs are consistent (you'll probably know what I mean if you experiment a bit with copy-pasting on a Linux machine). That being said, I can accept working under a different OS, but that means even more restrictions. Even if I'm just using Emacs and Safari, I know I can still use other Mac apps if I change my mind. I get my job done using text-based only workflows, that's great after all. It's been more than 15 years that I use to use Emacs to write R code and Latex or Markdown reports. No need for RStudio or TexShop or whatever. And I should feel lucky compared to Vim folks because Emacs GUI can display PDF and image files, process my incoming emails, etc. But I'm digressing I guess.

Back to the "refreshing stage:" Beside cleaning iTunes cache and literally all cache files I could possibly find in my `~/Library` folder, I also deleted the following: Clojure (`~/.m2`) and Node (`.npm` why did I have such a mess since I also have a folder plenty of packages located at `/usr/local/lib/node-modules`) stuff, various masked config files in my `$HOME` directory that were no longer in use, cargo packages that can easily be compressed using `cargo cache --autoclean`, large attachments and unwanted messages in my maildir, PDF files larger than 10 Mo in my books and papers folder, repositories cloned from Github for later review (sometimes the `.git` folder itself was larger than the code database), handouts and code samples I will surely forget in a few months, and so on. I also benefited from CleanMyMac regular cleanup, of course (it tends to forget some cache files, like Homebrew but `brew cleanup -s` and `rm -rf "$(brew --cache)"` are my best friends when it comes to deleting Homebrew stuff).

This Macbook is only 4 years old, I've been off during 2 years, but I already accumulated a lot of stuff, mostly useless I would say. Take for example my inbox: I still have more than 30,000 emails in my Gmail inbox that I never considered screening seriously before because Gmail. Ok, I don't really care since `mu` offers similar and fast indexing capabilities. Still, I was only able to remove about 12,000 emails using simple search queries. Nowadays, I am more stringent when processing incoming emails, and I only archive those that I may need later, eventually. The remaining ones (brief short reply, listserve, etc.) most of the time end up unread in the Trash folder. However, I just had to delete all emails with attachments > 1 Mo (some hundreds of them) to compress my Maildir from 7 Go to 1.5 Go. What were those attachments? I have no idea, but they weighed heavy in the balance anyway.

Let's start freshly then.

{{% music %}} Paul Motian Trio • _Dance_{{% /music %}}
