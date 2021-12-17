---
title: "The unquantified self #20"
date: 2021-12-16T20:43:20+01:00
draft: true
tags: ["self"]
categories: ["2021"]
---

Yet another post about how life is going while I'm about to complete this year 2021. I'll be on holidays for the next two weeks. I haven't had time to write as much blog posts than I originally thought last month, but I'm not worried. I will have plenty of time later on, probably, and if not this means those blog posts can wait. In the meantime, I managed to finish [Homeland](https://en.wikipedia.org/wiki/Homeland_(TV_series)), and I listened to a lot of nice playlists of jazz but also from the post-punk era (close to 500 tracks each week for a month).

Sometimes I miss my old good [Nord](https://www.nordtheme.com/) dark theme. As an alternative to my current setup (kitty + zsh), I considered using xterm + tmux. This might provide an easy-to-getup setup for remote machine since I only need to copy two config files. I grabbed xterm settings on [GitHub](https://github.com/arcticicestudio/nord-xresources) and I started hacking my xterm config by adding a few options in `$HOME/.Xresources`:

```
xterm*faceName: JetBrains Mono
xterm*faceSize: 11
xterm*selectToClipboard: true
XTerm*metaSendsEscape: true
```

This set up xterm with a decent font, while allowing to copy from the clipboard (using <kbd>Shift-Insert</kbd>) and using the <kbd>alt</kbd> key (which I need for my tmux keybindings). My tmux setup is almost unchanged except that I wanted to replicate some kitty facilities, like the fact that we can hide the window status bar if there's only one window opened. Here comes a little hack based on tmux hooks, which I found after reading this [gist](https://gist.github.com/bartj3/6d3bd8efd2ceaf02d443):

```
set -g status off
set-hook -g after-new-window 'if "[ #{session_windows} -gt 1 ]" "set status on"'
set-hook -g pane-exited 'if "[ #{session_windows} -lt 2 ]" "set status off"'
```

Now I have a nifty CLI setup based xterm and tmux, which are available on almost all machines I deal with everyday.

Other than those Unix geekeries, I
