---
title: "Amethyst tiling window manager"
date: 2020-09-03T13:25:48+02:00
draft: false
tags: ["apple", "app"]
categories: ["2020"]
---

I've been trying another tiling window manager for my laptop (Macbook 12 inch). I already talked about tiling WM for Mac [last year](/post/moom-app/), and [during the Summer](/micro/2020-07-03-10-52-31/). At work I have a larger monitor, so tiling windows makes sense. It becomes hard to get anything useful if applications are not using 2/3 of the screen or simply in maximized or fullscreen mode when using the native display of the Macbook. Up to now, I've been either using Emacs or a terminal spanning 2/3 of my screen, and lately maximized on screen using Moom facilities. This allows for quickly jumping between the apps using the app switcher (<alt>-<tab>), Mission Control or whatever. I usually use fullscreen mode only for mail (but I no longer use Mail app) or web browsing.

What I tried so far is [hhtwm](https://github.com/szymonkaliski/hhtwm) (too much of a hassle in terms of customization) and [yabai](https://github.com/koekeishiya/yabai/) (needs to disable SIP, as well as an additional app to manage keybindings). I don't remember exactly why I didn't like Yabai but I think it also amount to the time I spent installing and customizing it. Overall, I always ended up with maximized windows centered on my screen. Column view (i.e., side by side window) is almost unusable on a 12 inch monitor, and I could always get the same effect using [Moom](/post/moom-app/) alone.

While browsing [Joshua Stein](https://jcs.org/)'s website, I noticed he has some interesting screenshots of [his desktop](https://jcs.org/2017/07/14/matebook). He's running OpenBSD and a tiling WM (i3 or his [own WM](https://github.com/jcs/sdorfehs), I don't know), and he seems to be very partial to the idea of using monochrome themes, which does not displease me in fact, especially for writing code or prose, but I like to have colored input/output in my terminal. The zsh [fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting) and [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) plugins provide such assistance in editing commands that I wish I learned about them much earlier. With syntax highlighting, they help catch up errors quickly, or simply aid in getting a glance at a complex command. But I'm digressing.

While looking for tiling WMs available for macOS, which was quickly solved after all since there aren't so many, I found that only Amethyst was offering a full native app. I did try it a little while ago, but I found it of little help. I reinstalled it yesterday and it completely changed my mind. First, the app is tiny and works right out of the box: no configuration needed, it sits in the menu bar and we can update the settings within a few mouse clicks, it has all sort of built-in layout with predefined shortcuts that are easy to grasp (the main modifier key combination is <alt>-<shift>, while Kitty uses <ctrl>-<shift>: this is quite handy).

Below is a screenshot of my current desktop: Emacs and Vim, side by side, using an almost consistent duotone-like color theme for both.

![amethyst](/img/2020-09-03-13-57-08.png)

Next one is a preview of the tall layout, with a main window on the left and everything arranged in row on the right:

![amethyst-tall](/img/2020-09-03-14-12-44.png)

There are other interesting features: You can activate the "focus follows mouse", like in Kitty (or iTerm), create list of selected apps that should stay floating (or, conversely, that should always be tiled), you can configure window margins and screen padding to add extra space around each window like I did in the screenshot above.

After only two days of use I feel like this is the app I was looking for in combination with [Kitty](/post/kitty-terminal/) and my terminal-mode workflow.
