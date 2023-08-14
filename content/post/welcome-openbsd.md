---
title: "Welcome OpenBSD"
date: 2021-02-20T18:30:26+01:00
draft: false
tags: ["unix"]
categories: ["2021"]
---

I got a refurbished Lenovo Thinkpad T450S yesterday, and I installed OpenBSD 6.8 on it. Overall, this was a very pleasant experience: the installation went so smoothly that I got a working system in less than 20 minutes. Yes, you read me right: less than 20 min to start fetching my config files over the web in an xterm managed by i3wm.

The machine itself dates from 2015; it's a bit old, single core i7 but with custom RAM settings apparently (20 Go, more than what I currently have on my Dell laptop). It looks like the battery is near the end of its life, but this may well be a measurement issue from the sensors. I'll need to investigate, or buy a new battery. It comes with a 512 Go HD, and of course I install OpenBSD on the whole disk since I don't need Windows 10. No USB-C, nor HDMI, unfortunately. Hopefully, I still have an ethernet plug, an SD card reader, and a mini-display port.

{{< fluid_imgs "pure-u-1-2|/img/IMG_1616.JPG"
               "pure-u-1-2|/img/IMG_1617.JPG" >}}

This is still a rough install as I did not manage to configure everything, meaning that I'm still using ksh as the default shell, and I haven't installed anything beside the minimal set of utilities I use to use daily on my Ubuntu machine. I am reading the [FAQ](https://www.openbsd.org/faq/) and the [OpenBSD handbook](https://www.openbsdhandbook.com/), and the wonderful set of built-in docs (i.e., there's not only man pages for the commands, but also for the config files!). By the way, if you want to give it a try, [OpenBSD on a Laptop](https://www.c0ffee.net/blog/openbsd-on-a-laptop/) is a must read.

> Linux people do what they do because they hate Microsoft. We do what we do because we love Unix. --– Theo de Raadt

Now, back to the install itself. The installer and package manager are a piece of beauty, really. You are prompted to set up disk partitioning, hostname, ethernet configuration (via DHCP over IPV4, or via IPV6), etc. with sensible defaults each time (e.g., do not allow ssh as root but start sshd on boot). It is possible to start an X session automagically using xenodm, and then you can use cmw or the fmwm (default) window manager. While I quite like cwm, I much prefer i3, for it allows to mimic my custom settings on Ubuntu and macOS using Kitty. Installing additional packages over the internet or from the internal sets is also easy and pretty quick. I found everything I needed using simple queries like, ̀̀`doas pkg_add nvim`. Note that `exa` and `ripgrep` are also available.

A simple call to `top` suggests that the whole system, OpenBSD and i3, relies on less than 30 processes whereas the Gnome Desktop manager that is running on Ubuntu requires many more processes that I am not even using (e.g., evolution). The simple session that I'm currently logged on (two xterm, no Firefox) is actually using around 600 Mb. That's pretty nice.

Unlike ubuntu, default [permissions](/post/christmas-admin-on-ubuntu/) are more sensible, and there's even a sandboxing policy for applications that require extra privileges, like accessing the web or talking to external servers. See also [What security does a default OpenBSD installation offer?](https://dataswamp.org/~solene/2021-02-14-openbsd-default-security.html) (or the [French version](https://dataswamp.org/~solene/2021-01-04-pourquoi-openbsd.html)). And there's also: (although I didn't check by myself)

{{% alert note %}}
<small>[2023-08-14]</small><br>
Unfortunately, the tweet with ID 1358556278985998336 is no longer available.
{{% /alert %}}

So far, so good. I will probably stop here for a while, since I'm in the middle of my move and have other things to complete before leaving, but I hope I'll be posting more on this later in March.
