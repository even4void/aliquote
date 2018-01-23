+++
title = "Tmux and OS X"
date = 2014-11-15T10:30:46+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I am sometimes using [tmux](http://tmux.sourceforge.net) as my default terminal multiplexer. Here are some notes on my current configuration.

My configuration is rather simple, and it is mostly inspired from others' config files I found with little Googling. The default status bar is not quite bad, but I don't really like the green background and I prefer non-intrusive 'markers' to display information about my running processes. I ended up with the following customization for the status bar: (See also [here](https://github.com/JohnMurray/dotfiles/blob/master/.tmux.conf) and [here](http://stackoverflow.com/questions/9628435/tmux-status-bar-configuration).)

```
set -g status-bg default
set -g status-fg white
set-option -g status-justify centre
set-option -g status-left '#[fg=blue][#S]'
set-option -g status-left-length 20
set-window-option -g window-status-format '#[fg=blue,dim]#I#[fg=blue]:#W#[fg=blue,dim]#F'
set-window-option -g window-status-current-format '#[fg=yellow,bold]#I#[fg=yellow]:#[fg=yellow]#W#[fg=dim]#F'
set -g status-right '##[fg=blue]%Y-%m-%d %H:%M#[default]'
```

Tmux comes with several keybindings that we need to learn. Of course, if we are using it all the day, chance are that we will master them quickly (at least, I found them much easier to learn than those for Emacs when I started using it). However, I found the following [cheatsheet](https://gist.github.com/andreyvit/2921703) very useful. Since I like using arrow keys to navigate between windows or panels, I redefine some of the bindings as follows:

```
bind-key -n S-right next
bind-key -n S-left prev
bind-key -n M-left select-pane -L
bind-key -n M-right select-pane -R
bind-key -n M-up select-pane -U
bind-key -n M-down select-pane -D
bind Space choose-buffer
unbind %
bind h split-window -v
unbind '"'
bind v split-window -h
```

And here is a little screenshot that shows how it looks on my desktop:

![tmux](/img/2014-11-12-17-23-15.png)

I should note that [iTerm2](http://iterm2.com), which is the Terminal I am using since several years, already provides split panes, autocomplete, powerful search features, session history and window management, as well as mouse action (focus, copy/paste, smart selection, etc.). So why bother with tmux after all? Well, the only thing that iTerm is currently missing is the ability to keep running in the backgroun when the application is closed (accidently or not). In any case, iTerm offers nice integration with tmux. [The Text Triumvirate](http://www.drbunsen.org/the-text-triumvirate/), by Seth Brown, is also definitely a good read.
