---
title: "More Tmux little hacks"
date: 2022-07-29T21:54:57+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

A few months ago I learned that we can add popup menus to Tmux, using `display-menu`. I rarely use it, but I find it convenient. The more I learn about those little hacks in Tmux the more I like it. It's worth all modern terminals by far.

![tmux-menu](/img/2022-07-29-20-11-46.png)

Here's mine:

```
bind-key -n M-q display-menu -x W -y S \
    "New Session"                        S "command-prompt -p \"New Session:\" \"new-session -A -s '%%'\"" \
    "Kill Session"                       x "kill-session" \
    "Kill Other Session(s)"              X "kill-session -a" \
    "" \
    "New Window"                         ␍ new-window \
    "Kill Window"                        k "killw"  \
    "Choose Window"                      w choose-window \
    "Previous Window"                    🡠 previous-window \
    "Next Window"                        🡢 next-window \
    "Swap Window Right"                  ↑ "swap-window -t -1" \
    "Swap Window Left"                   ↓ "swap-window -t +1" \
    "Horizontal Split"                   v "split-window -h" \
    "Vertical Split"                     s "split-window -v"  \
    "" \
    "Layout Horizontal"                  h "select-layout even-horizontal"  \
    "Layout Vertical"                    k "select-layout even-horizontal"  \
    "" \
    "Swap Pane Up"                       < "swap-pane -U" \
    "Swap Pane Down"                     > "swap-pane -D" \
    "Break Pane"                         t break-pane \
    "Join Pane"                          j "choose-window 'join-pane -h -s \"%%\"'" \
    "#{?window_zoomed_flag,Unzoom,Zoom}" z "resize-pane -Z"
```

Copying/pasting in Tmux has always been a pain for me. In the end, I most of the time rely on what I call the "shift" selection and copy approach, meaning that you select text using your mouse while pressing the <kbd>Shift</kbd> key, and you copy the highlighted text using <kbd>Shift+Ctrl+C</kbd>. It works. Other than that, you can leverage Tmux's facilities for copy-pasting text or whole buffers using the following shortcuts:

```
bind Y copy-mode
setw -g mode-keys vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
set -g set-clipboard off
bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -i -selection clipboard"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -i -selection clipboard"
```

In this case, you have two options: using the mouse to select text -- that's the `MouseDragEnd1Pane` snippet above, then you just <kbd>Shift+Ctrl+V</kbd> to paste the highlighted text wherever you want; this even works to paste text from a shell into a Vim buffer. Other than that, you can use the keyboard after pressing the <kbd>Y</kbd> key, then use Vim motion key to select your text -- these are the very first keybindings in the above snippet.

If you don't like window number in the status bar when you only have one window, you can add the following to your Tmux config:

```
set -g status off
set-hook -g after-new-window 'if "[ #{session_windows} -gt 1 ]" "set status on"'
set-hook -g pane-exited 'if "[ #{session_windows} -lt 2 ]" "set status off"'
```

It will first disable the status bar, and then rely on a hook to activate it when there's more than one window available in the current session. I've been using this for years and it's really great.

After much use, I found that binding the <kbd>Alt</kbd> key as a pseudo-prefix key is a must (it's close to the <kbd>Meta</kbd> key used by Ubuntu). Here are some mappings I use almost every day:

```
bind-key -n M-! split-window -f -l 10 -c "#{pane_current_path}"
bind-key -n M-: command-prompt
bind-key -n M-< swap-pane -U
bind-key -n M-= choose-buffer
bind-key -n M-> swap-pane -D
bind-key -n M-D choose-client
bind-key -n M-Down swap-window -t +1
bind-key -n M-Enter new-window
bind-key -n M-Left previous-window
bind-key -n M-O switch-client -l
bind-key -n M-S command-prompt -p "New Session:" "new-session -A -s '%%'"
bind-key -n M-Right next-window
bind-key -n M-Up swap-window -t -1
bind-key -n M-k select-layout even-vertical
bind-key -n M-j choose-window 'join-pane -h -s "%%"'
bind-key -n M-h select-layout even-horizontal
bind-key -n M-l last-window
bind-key -n M-m command-prompt -p "Search man pages for:" "new-window 'exec man %%'"
bind-key -n M-o selectp -t :.+
bind-key -n M-p run "tmux split-window -p 10 'tmux send-keys -t #{pane_id} \"$(locate ~/ | fzf -m | paste -sd\\  -)\"'"
bind-key -n M-s split-window -v
bind-key -n M-t break-pane
bind-key -n M-v split-window -h
bind-key -n M-w choose-window
# bind-key -n M-x confirm-before -p "kill-pane #P? (y/n)" kill-pane
bind-key -n M-y copy-mode
bind-key -n M-z resize-pane -Z
```

{{% alert note %}}
<small>[2022-08-27]</small><br>
See my [Tmux cheatsheet](/artciles/tmux/) for more up to date mappings.
{{% /alert %}}

Happy hacking on Tmux!

{{% music %}}Jean-Yves Thibaudet • _Liszt Consolations, S. 172 - No. 3 in D-Flat Major. Lento placido_{{% /music %}}
