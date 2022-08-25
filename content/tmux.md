---
title: "Tmux shortcuts"
date: 2022-08-25T00:00:00
url: "/articles/tmux/"
---

After my Vim keymappings cheatsheet, here are my current settings for Tmux. Again, I published [several](/post/customizing-iterm2/) [blog](/post/tmux-little-hacks/) [posts](/post/tmux-2021/) related to my Tmux settings in the past.

Initially I defined a second prefix key, and then I decided that `C-b` is perfectly good for me, and I rather add a new "hot key" in the name of "Meta" (`Alt`). Ubuntu relies on the Super key for its mappings, while the Ctrl key is used by Vim, Irssi, and many other of my CLI software. The `Alt` key is pretty handy for me, it reminds of my Emacs time and it does not interfere with other environment that I know or use regularly (beside folks using both the Ctrl and Alt key in some Vim plugins).

Compared to Neovim, my requirements are even more minimalistic since I don't use any extra plugins or frameworks. In what follows, I only show what I added to my `.tmux.conf` file.

<small>
<table border="0">
<tbody>
<tr>
<td><em>Mapping</em></td>
<td><em>Command</td>
<td><em>Role</em></td>
</tr>
<tr><td><kbd>M-H</kbd></td><td><kbd>resize-pane -L 4</kbd></td><td>resize pane toward left</td></tr>
<tr><td><kbd>M-J</kbd></td><td><kbd>resize-pane -D 4</kbd></td><td>resize pane toward bottom</td></tr>
<tr><td><kbd>M-K</kbd></td><td><kbd>resize-pane -U 4</kbd></td><td>resize pane toward up</td></tr>
<tr><td><kbd>M-L</kbd></td><td><kbd>resize-pane -R 4</kbd></td><td>resize pane toward right</td></tr>
<tr><td><kbd>M-!</kbd></td><td><kbd>split-window -f -l 10 -c "#{pane_current_path}"</kbd></td><td>bottom popup terminal</td></tr>
<tr><td><kbd>M-:</kbd></td><td><kbd>command-prompt</kbd></td><td>display command prompt</td></tr>
<tr><td><kbd>M-&lt;</kbd></td><td><kbd>swap-pane -U</kbd></td><td>move pane to the left</td></tr>
<tr><td><kbd>M-&gt;</kbd></td><td><kbd>swap-pane -D</kbd></td><td>move pane to the right</td></tr>
<tr><td><kbd>M-=</kbd></td><td><kbd>choose-buffer</kbd></td><td>select among paste buffers</td></tr>
<tr><td><kbd>M-D</kbd></td><td><kbd>choose-client</kbd></td><td>select Tmux client to use</td></tr>
<tr><td><kbd>M-Down</kbd></td><td><kbd>swap-window -t +1</kbd></td><td>move window to the right</td></tr>
<tr><td><kbd>M-Up</kbd></td><td><kbd>swap-window -t -1</kbd></td><td>move window to the left</td></tr>
<tr><td><kbd>M-Left</kbd></td><td><kbd>previous-window</kbd></td><td>select next window to the left</td></tr>
<tr><td><kbd>M-Right</kbd></td><td><kbd>next-window</kbd></td><td>select next window to the right</td></tr>
<tr><td><kbd>M-O</kbd></td><td><kbd>switch-client -l</kbd></td><td>change current Tmux client and session</td></tr>
<tr><td><kbd>M-S</kbd></td><td><kbd>command-prompt -p "New Session:" "new-session -A -s '%%'"</kbd></td><td>create new session</td></tr>
<tr><td><kbd>M-X</kbd></td><td><kbd>"kill-session -a"</kbd></td><td>kill all other sessions</td></tr>
<tr><td><kbd>M-x</kbd></td><td><kbd>kill-session</kbd></td><td>kill current sessions</td></tr>
<tr><td><kbd>M-h</kbd></td><td><kbd>choose-window 'join-pane -h -s "%%"'</kbd></td><td>attach pane to another window</td></tr>
<tr><td><kbd>M-j</kbd></td><td><kbd>select-layout even-horizontal</kbd></td><td>arrange panes using horizontal layout</td></tr>
<tr><td><kbd>M-k</kbd></td><td><kbd>select-layout even-vertical</kbd></td><td>arrange panes using vertical layout</td></tr>
<tr><td><kbd>M-l</kbd></td><td><kbd>last-window</kbd></td><td>go to last window</td></tr>
<tr><td><kbd>M-m</kbd></td><td><kbd>command-prompt -p "Search man pages for:" "new-window 'exec man %%'"</kbd></td><td>query man page in a temporary window</td></tr>
<tr><td><kbd>M-o</kbd></td><td><kbd>selectp -t :.+</kbd></td><td>go to other split</td></tr>
<tr><td><kbd>M-p</kbd></td><td><kbd>run "tmux split-window -p 10 'tmux send-keys -t #{pane_id} \"$(locate ~/ | fzf -m | paste -sd\\  -)\"'"</kbd></td><td>find file in bottom temporary split using Fzf</td></tr>
<tr><td><kbd>M-s</kbd></td><td><kbd>split-window -v -c "#{pane_current_path}"</kbd></td><td>create horizontal split</td></tr>
<tr><td><kbd>M-v</kbd></td><td><kbd>split-window -v -c "#{pane_current_path}"</kbd></td><td>create vertical split</td></tr>
<tr><td><kbd>M-t</kbd></td><td><kbd>break-pane</kbd></td><td>convert pane to proper window</td></tr>
<tr><td><kbd>M-w</kbd></td><td><kbd>choose-window</kbd></td><td>show list of sessions and windows</td></tr>
<tr><td><kbd>M-y</kbd></td><td><kbd>copy-mode</kbd></td><td>activate copy mode</td></tr>
<tr><td><kbd>M-z</kbd></td><td><kbd>resize-pane -Z</kbd></td><td>maximize current pane</td></tr>
<tr><td><kbd>C-b C-g</kbd></td><td><kbd>setw synchronize-panes</kbd></td><td>synchronize panes</td></tr>
<tr><td><kbd>C-b C-m</kbd></td><td><kbd>if -F '#{s/off//:mouse}' 'set -g mouse off; display-message "mouse: off"' 'set -g mouse on; display-message "mouse: on"'</kbd></td><td>toggle mouse mode on/off</td></tr>
<tr><td><kbd>C-b C-r</kbd></td><td><kbd>source-file ~/.tmux.conf \; display-message "Config reloaded"</kbd></td><td>reload Tmux config</td></tr>
<tr><td><kbd>C-b C-s</kbd></td><td><kbd>if -F '#{s/off//:status}' 'set status off' 'set status on'</kbd></td><td>toggle status bar on/off</td></tr>
</tbody>
</table>
</small>

For copy-pasting, I have the following settings:

```
bind Y copy-mode
setw -g mode-keys vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
set -g set-clipboard off
bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "xclip -i -selection clipboard"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -i -selection clipboard"
```
