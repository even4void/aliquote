---
title: "Kitty terminal emulator"
date: 2020-08-16T16:33:24+02:00
draft: false
tags: ["app"]
categories: ["2020"]
---

I switched recently to the [kitty](https://sw.kovidgoyal.net/kitty/) terminal emulator. I have been using iTerm for so many years that I hardly believe I made the switch, but here we go. The thing that motivated trying an alternate terminal emulator is that I work a lot more remotely nowadays, and I'm no longer plugged 24/24 so I use the battery. This Macbook is 4 years old, but the battery is in good state as far as I can tell. However, I noticed that iTerm was draining the battery in a very unpleasant manner: I only had 3 hours left instead of 6 to 8 hours, depending on the average load on my computer.

I don't see any buggy feature, the application looks very polished and it is responsive. Compared to iTerm, everything is configurable through a single config file (`.config/kitty/kitty.conf`), which is great, and the only missing feature is hot reloading of the config. I haven't had any difficulty in running it as my terminal emulator all day long.

On the Pros side:

- Things get more complicated when using the mouse in Emacs, e.g. I cannot simply point and click, but that's not really a problem since I decided to learn efficient keybindings to move into a buffer. However, I can now paste any mouse selection using standard macOS shortcut or Vim `p`, which is quite great after all. This was not possible in iTerm although it worked well in a shell.

- The application is fast, very fast, especially for scrolling or moving between opened tabs. Memory consumption is okay apparently, even with 3 tabs opened and a running instance of Emacs.

- Managing split windows is a joy compared to iTerm as the layout can be changed within a few key press. The hot key for most operations is Ctrl-Shift, which is convenient as they are right under my left hand.

- The documentation is good and it is relatively easy to update the default settings thanks to the sample config file. I reviewed every items in something like one hour and I was able to finalize my default config by that time. Fonts support is excellent (including ligatures and special options like Retina settings for Fira Code or ligature variations for Iosevka, even if I'm now happy with JetBrains Mono --- much better for my eyes).

- Also, kitty works both on Mac and Linux which means I could eventually keep using the same configuration (pending some minor changes specific to the OS), like is the case for Vim or Emacs, if I were to change my primary laptop.

- There are many other features that I have not yet studied in detail, including remote access and interaction with external tools. I noticed that kitty allows to display image and this is a [built-in feature](https://sw.kovidgoyal.net/kitty/kittens/icat.html), unlike iTerm where you have to install the shell integration tools. More to the point, it is possible to render Python and Julia plots inline

  > Internally, this backend is somewhat based on matplotlib's IPython support: it's a hybrid of image and GUI backend types. It works by using matplotlib's Agg backend to render the plot, and then calls kitty's icat to place the rendered image on your terminal. This means that plotting works as expected, but the image drawn to your terminal isn't interactive and animations aren't supported. --- [matplotlib-backend-kitty](https://github.com/jktr/matplotlib-backend-kitty)
