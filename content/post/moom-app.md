---
title: "Moom App"
date: 2019-12-26T18:53:06+01:00
draft: false
tags: ["review", "app", "apple"]
categories: ["2019"]
---

I am a long time user of [Moom](https://manytricks.com/moom/), a tiny application that helps you manage the windows on your desktop. I know there are many such applications dedicated to window management on macOS, but this one is quite handy for several reasons. First, it comes with keyboard shortcuts, which you enable using a hot key (mine is <kbd>^-⇧-M</kbd>) followed by the action you want to perform. Here's an example of the default actions that are configured:

{{< fluid_imgs  "pure-u-1-2|/img/2019-12-26-18-56-46.png" >}}

This is handy if you like to stay away from the mouse or the touchpad as much as you can. However, the second reason why I like Moom is that is non obtrusive: You can hide the icon in the menu bar and let the application starts at login, so you never realize that is running in the background. It adds a tiny menu (aka Moom's palette) to the top-left "green" button of each window, which allows to resize the running application half-screen (left/right or top/bottom) or full-screen. Compared to the split view in fullscreen mode, I always found it much more powerful. It is not a tiling window manager, but it's close.

![](/img/2019-12-26-19-02-12.png)

A final feature of Moom is that you can drap app to border or corner of your desktop in order to automagically resize your windows. I don't use this feature as much as the keyboard shortcuts and Moom's palette, but it is an interesting option anyway. Usually, I have the following settings: Mail fullscreen on a dedicated space, when I use it of course; iTerm half screen or maximized/fullscreen if I use several panes; Emacs, two third screen or maximized when I need to work on several buffers; Safari, maximized. Then I usually rely on <kbd>⌥-⇥</kbd> to switch between opened apps. All those window arrangements can be performed using Moom shortcuts, as a matter of fact. 

There are many other features described on the website, like saved window layout and grid resizing, but to be honest I don't really use them. I have always been looking for a very simple way to maximize my windows or make them fit on half the screen. If this is what you're after too, then Moom is definitely a good option to try. It is a paid app, but it's worth its $10.



### Sidenote

As I said, Moom is not a tiling window manager (WM). There have been various attempts at providing a full tiling WM for the Mac over the past few years, but I don't know of any native app which cound competete with Linux [i3](https://i3wm.org) or [other alternatives](https://www.tecmint.com/best-tiling-window-managers-for-linux/). The last one to date for the Mac was [chunkwm](https://github.com/koekeishiya/chunkwm), but it has been archived. I haven't tried [Amethyst](https://github.com/ianyh/Amethyst), and I don't even know if [xmonad](https://xmonad.org) works as expected on macOS nowadays. Lately, I've been playing with [Hammerspoon](http://www.hammerspoon.org) and Szymon Kaliski's tiling WM, [hhtwm](https://github.com/szymonkaliski/hhtwm), but I found it too complicated for what I need, despite being able to configure it quite easily thanks to Simon's own config. Anyway, it is there if I need it: I just have to launch Hammerspoon; at least, all newly opened applications will start in full size centered on screen.