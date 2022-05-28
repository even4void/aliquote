---
title: "Ubuntu on a MacBook Pro"
date: 2021-08-22T20:46:17+02:00
draft: false
tags: ["apple", "unix"]
categories: ["2021"]
---

My son brought me his laptop which was no longer working. It's this 2014 [MacBook Pro](/post/os-x-mavericks/) which in retrospect was the best machine I had in the past 10 years or so. Now I would consider that my [Dell Latitude](/post/welcome-ubuntu/) is probably the best machine I ever had, at least as far as the keyboard is concerned: The screen is okay, but nothing will ever beat a retina display; the hardware spec are close, except I go 2 additional hyper-threaded cores. Anyway, I don't really know what was wrong but the computer kept restarting and it was impossible to update or reinstall the OS. I could have looked a little longer for the cause of the problem, at least on the internet, or taken it to a Mac repair center, but after all I don't really care about restoring a Mac since I already have my 12" MacBook running Mojave.

My first idea was to install OpenBSD as I was very happy with my [previous attempt](/post/welcome-openbsd/) on a Windows machine. I grabbed the latest image available on OpenBSD FTP site, made a bootable USB stick, then tried to install the new OS. Then I remember than we need something like [reFit](http://refit.sourceforge.net/) or something to install additional OSs on a Mac machine. It looks like it may be possible to build a specific bootable USB stick, as described in [this post](https://www.tumfatig.net/20110901/run-openbsd-from-usb-on-macbook-pro/?utm_source=pocket_mylist), but in my case I was not interested in keeping macOS on the MacBook, and I did not want to spend the rest of my afternoon with this mess. Hence I decided to look at what's available on Ubuntu website. I've heard lot of people have been able to install Ubuntu on their MacBook, where generally everything was working fine except the wireless connection. I know that OpenBSD definitely does not support Apple wireless cards (see [Joshua Stein](https://jcs.org/) technical reviews), but I am okay using good old wired connection at home.

To my great surprise, the Ubuntu team proposes an automatic installer which takes care of everything, including the management of the boot loader. It's kind of magic in reality. You just need to [burn their installer on an USB stick](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu), and plug it into your laptop. It worked right out of the box on my MacBook Pro, and I was able to test and then install Ubuntu in a few clicks. You'll need to enable proprietary drivers to get the wireless connection, which is not available on first boot. Then, everything looks fine. Even fractional display works great (I choose 150% but we can get higher resolution compared to the best resolution available on the Mac).

{{< fluid_imgs "pure-u-1-3|/img/IMG_1669.JPG"
               "pure-u-1-3|/img/IMG_1670.JPG"
               "pure-u-1-3|/img/IMG_1671.JPG" >}}

To be fair, I didn't do many tests and I didn't even check if all the devices were working properly. Having wifi is already a big plus. I noticed that the sleep mode seems to work when the machine is on battery, but not on mains, and that the jack connector stays on despite the activation of the sleep mode. So I suspect that power performance can be improved, but I've optimized the power management on my Dell as well, so I'm not worried. The battery condition is at 70% of its maximum capacity (this is a 7 year old computer now) and it would be nice to change the screen glass.

Now, I just have to install all my stack on this new machine, which I intend to use as a backup machine and a personal server at home.
