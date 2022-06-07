---
title: "Ubuntu 22.04"
date: 2022-06-06T20:59:59+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

In a [recent post](/post/unquantified-self-023/), I said that I will probably upgrade my Ubuntu soon or later. The day after I published it I finally did it. It took me a few hours to upgrade my laptop full of useless applications and libraries installed all along the last year, but finally I got the welcome screen before lunch. There are many reviews available on the web, so I will just mention what I did and what I find the most interesting updates for my use cases.

- There are important updates to the kernel, glibc and various other system libraries, but I noticed that now clang and Python are versions 14.0 and 3.10.4. Python 3.10 is supposed to be faster than previous versions, but I didn't run any benchmarks so far. Nothing new regarding Neovim: still at version 0.6 from the official apt repositories, so I'm using the Neovim PPA for the unstable version.

- The window manager has been improved, IMHO. The calendar widget is able to display all events stored in Gnome calendar, there's a processor scheduler that can alternate between energy saving and high performance policy, and virtual desktops are now displayed horizontally rather than vertically. Gnome screen capture got a few enhancements as well.

{{< fluid_imgs
"pure-u-1-2|/img/2022-06-06-21-17-53.png"
"pure-u-1-2|/img/2022-06-06-21-18-06.png" >}}

- I deleted a bunch of unused or defunct applications, including Docker and bitlbee. I also manually cleanup up the old LLVM files that came with the previous installation of Ubuntu 20.04 and that were not cleaned up during the upgrade process. Finally, I re enabled Tracker, which I disabled a while ago, and some default settings, which I also disabled for i3 and Regolith desktop. I did not reinstall the Snap store. In fact, I deleted everything related to snap when I configured my laptop the first time, and then never looked back. At this point, I don't even know how to reinstall snap on my machine.

- There were some quircks here and there: IPython was not happy with the missing Qt backend for matplotlib, so I now use `matplotlib.use("GTK4Cairo")` instead, which is not a bad idea after all. Of course, switching to Python 3.10 instead of 3.8 also means that I had to reinstall every little applications that sit in my `$HOME/.local/bin` folder, mostly from `pip3 install --user`. To remap the CAPS lock key to <Esc>, I was previously invoking `setxkbmap -option caps:escape` in my shell init scripts. This no longer works under Wayland, but I discovered that you can just ask Gnome shell to do that for you: `gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"`.

- I spent another couple hours fixing my Hugo theme, which stopped working with version 0.92. I am now aware of the fact: after each update of Hugo something goes wrong. I had not encountered such problem the last two years since I was on the 20.04 LTS, which means no update at all for most applications. However, I tor my hair out for a long time with rolling release on Apple Homebrew. Anyway, I fixed it, again, and now I hope we are quiet for some long months.

- I also managed to install the [Nordic](https://github.com/EliverLara/Nordic) theme, which is beautiful (especially compared to the default dark theme in Ubuntu) and reminds me of the one I had when I was using Regolith desktop. I didn't reinstalled it yet, since I want write to try the default settings yet another time again.

{{% music %}}Big Spider's Back • _Black Chow_{{% /music %}}
