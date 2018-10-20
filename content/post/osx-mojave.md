---
title: "OS X Mojave"
date: 2018-10-20T19:02:20+02:00
draft: false
description: ""
tags: ["apple"]
categories: []
---

Welcome to the next iteration of macOS! No more panther, leopard or tiger or other felines, it is all about dazzling landscapes nowadays. The dynamic wallpaper is blowing my mind, though.

<!--more-->

![](/img/2018-09-25-21-24-41.png)

I was a bit nervous when upgrading as I was aware of rumours when betas were released some months ago. However, as with previous final releases (Sierra and High Sierra), there was no surprise or sort of lost stuff after the upgrade was complete (apart from the removal of Safari extensions among others). The long awaited dark mode is, well, dark, really dark for some apps--mainly those where you expect to be essentially reading or writing text like Calendar or Mail. Of course, it is still possible to switch between dark and light mode according to our mood or when we really need a light background, but in practice I believe it is better to choose one and to stick to it. Note that Apple Mail offers a nice comprise between dark UI mode and a light background for the preview panel.

Mojave ships with a new Xcode (Apple LLVM version 10.0.0 (clang-1000.11.45.2)) and Swift 4 (Apple Swift version 4.2 (swiftlang-1000.11.37.1 clang-1000.11.45.1)), which now has extended support for [numeric types](https://github.com/apple/swift-evolution/blob/master/proposals/0170-nsnumber_bridge.md) and many other goodies. Apple removed support for OpenCL in favor of Metal, which is single precision only but allows for `include` directive and [much more](https://twitter.com/EvMill/status/1052590218337869825). I did not encounter any problem when upgrading my other software via Homebrew. Even if Emacs has been reported to [suffer from slight bugs](http://irreal.org/blog/?p=7528) when upgrading to Mojave, I was happy to have a fully working HEAD version of Emacs 27 built from Homebrew. I just switch to the [nightly build](https://iterm2.com/downloads.html) of iTerm2 to benefit from the "minimal theme" which mimics Mojave dark theme.

![](/img/2018-09-26-13-01-47.png)

The App Store has been redesigned as well: It is less cluttered, comes with larger fonts, and when updating applications it provides a summary of new features that is more clear than in the preceding version, IMHO. Overall, I found that the UI differs a little from the rest of macOS apps, but it does the job. 

![](/img/2018-10-04-11-46-59.png)

Among the other apps I use a lot, iTunes hasn't changed that much. However, under the hood it keeps improving over the years, like the Notes app, even if there are still some features that I miss (e.g., create a playlist with Apple Music items). The Finder now offers a "gallery view" as well as a detailed overview of metadata in the preview panel. I can confirm that Twitter has been completely removed from the Actions menu and Notification center (like LinkedIn, but it is not a big deal). The continuity feature, whereby messages, mail or pictures processed from your iPhone are automagically transferred to the MacBook, looks interesting but I haven't take much advantage of it for the moment. Also, I haven't had a chance to try Pages or Numbers yet. I noticed a few weeks ago that Numbers is now able to process CSV files with both colon and semi-colon as a field separator, but this probably comes from an earlier update.
