---
title: "Hello macOS again"
date: 2024-12-22T20:11:47+01:00
draft: false
tags: ["apple"]
categories: ["2024"]
---

I thought I would write a blog post a month ago after [my laptop blew up](/micro/2024-11-25-21-09-42/), then when I spent a week reconfiguring my [old MacBook 12"](/micro/2024-11-26-21-42-11/). I gave up, it was certainly better to let things go at that time. Now I got a new MacBook, the top of the line, and it's refreshing. First, I never had a laptop as powerful as this one. Still, it's a little annoying since I lost a lot of personal stuff.

## Ground 0

I came back at home after my day's work, and when I plugged the power supply back onto my laptop (Dell Latitude 7310) the screen remain blank, I mean nothing happened. It occured in the past, so I tried to hard reboot the OS to no avail. I then dismantled the computer and realized that the power supply unit was out of order. I removed the SSD but could never mount it for reading. After a few days, I had to face the fact that there was nothing left to save and that I could go back to my July general backup. Sadly, I just finished consolidating my music library with Beets and I was going to backup everything right away. That's life, I guess. I also lost 1 year or so of pictures taken with my ageing iPhone, a collection of desktop background I made recently, dozens of shell scripts I wrote during the quiet Summer days to automate things here and there, as well as my Newboat archives ans 4 months worth of emails -- which I don't really care about but still... Since everything I do at work is synced on Github or local servers, nothing was lost on this side.

## Round 1

I came back to my beloved MacBook 12". I haven't used it in years, except to backup my text messages. It was hardly usable at first, and I had to reinstall all the stuff I removed since 2018. I reinstalled Homebrew, and then I realized that there was no longer any bottle for the software I was asking for, which means I needed to recompile everything from scratch. That's fine, I already did this for a living in the past. It took me a week, though. The hell of dependencies on top of a slow processor, if you see what I mean. Finally, I made it and I got a working workstation which helped me to continue my activities at work. Two things came to my mind after the fact: I was glad to get my MacBook back with its retina display, and listening to my playlists on this device was much better compared to the Dell laptop. I don't know how I put up with that one for so long. Anyway, that was funny as I happened to recompile Neomutt and Cmus, with all their dependencies, from scratch. I gave up reagrding Newsboat as it required so much dependencies. Of interest, everything Rust-related worked with no problem at all, even on Mojave which is now 6 years old and deprecated all over the place, including Homebrew.

## Round 2

My benevolent colleagues helped me get a new computer when I was ready to buy a macbook myself. Instead of a MacBook Air, I ended up with a MacBook Pro M4 14". It's a beast without further ado. I fired up Homebrew and installed a bunch of utilities, in addition to rustup, ghcup, uv, and roswell for which I used the provided install shell scripts. I now let Homebrew manage whole applications (aka "Cask") for me, which means I do not install things by myself: either they are on the AppStore (pre paid or newly released), or as Homebrew formula or casks. My workflow hasn't change. I still use Neovim as my daily driver, Neomutt for managing my emails, and Newsboat for RSS. I just replaced ncmcpp with Apple Music as I find it more convenient. As [I once said](/post/bye-bye-apple/),

> These days, I’m happy with a few tools that allow me to do 90% of my work in an efficient manner.

Well, it's time to go back to the future for now.

{{% music %}}The Other Two • _Movin' On_{{% /music %}}
