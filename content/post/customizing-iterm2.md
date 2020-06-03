---
title: "Customizing your shell"
date: 2020-06-03T17:35:38+02:00
draft: false
tags: ["misc"]
categories: ["2020"]
---

I'm back to zsh after several months [using Fish](/post/fish-shell). I took this as an opportunity to update my default configuration, remove any plugin manager and pre-configured prompt or theme (e.g., [oh-my-zsh](https://ohmyz.sh)). I started with Thorsten Ball's [configuration](https://github.com/mrnugget/dotfiles), and updated it to my liking. More importantly, I decided to split the configuration into different pieces (one for the prompt, one for the aliases, etc.), in addition to the core `.zshrc`, and to follow XDG guidelines (everything goes into `~/.config`). My prompt now only includes the path, a Git indicator and a `λ`, whose color is updated depending on the result of the last command (red if the last command returned an error, i.e. `$? ≠ 0`) or the existence of pending jobs (yellow if there are suspended or sleeping jobs).[^1]

```shell
local dir_info_color="%B"
local dir_info="%{$dir_info_color%}%(5~|%-1~/.../%2~|%4~)%{$reset_color%}"
local promptnormal="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})λ %{$reset_color%}"
local promptjobs="%(?.%{$fg_bold[yellow]%}.%{$fg_bold[red]%})λ %{$reset_color%}"

PROMPT='${dir_info}$(git_prompt_info) %(1j.$promptjobs.$promptnormal)'
```

![zsh](/img/loop1.gif)

With quarantine and all., I had to strenghten my "work from home" setup. I have a remote access to the computers at my lab, and I wanted to customize my terminal a bit. In my case, this is iTerm2 but this should apply to any terminal. What I really wanted was to add some useful information to my prompt, without adding too much of a mess on the existing one. It is worth noting the following only makes use of the right prompt. With many (pseudo-)terminals arranged in panes or in separate windows, it often becomes hard to remember which ones are connected via ssh. Here is what I have in my zsh config file for managing the right prompt:

```shell
function preexec() {
timer=${timer:-$SECONDS}
}

_is_ssh() {
[[ -n ${SSH_CONNECTION-}${SSH_CLIENT-}${SSH_TTY-} ]]
}

function precmd() {
if _is_ssh || (( EUID == 0 )); then
    remote="@${(%):-%m}"
else
    remote=""
fi
if [ $timer ]; then
    toc=$(($SECONDS - $timer))
    if [ ${toc} -ge 5 ]; then
      export RPROMPT="%F{cyan}${toc}s %F{blue}${remote}% {$reset_color%}"
    else
      export RPROMPT="%F{blue}${remote} %{$reset_color%}"
    fi
    unset timer
fi
}
```

The above code ensures that the execution time of long commands (i.e., which took more than 5 seconds) is displayed in the right prompt, together with the short name of the server into which I ssh'ed when this is the case. Now, I hope I will never forget (again) that I'm on a remote server and not on my local computer when I `cp` or `rm` stuff in the home directory.

As a last note, while I am happy with iTerm on my Macbook I use Tmux on remote servers, mostly for portability, to facilitate window navigation, and to ensure that I can restore my shell at any time when I reconnect to the server later. First, in zsh, I added a short function that checks whether there are any existing Tmux sessions. (This is entirely borrowed from [James Seward](https://jamesoff.net/2017/08/26/tmux-configuration.html).)

```shell
if [[ -z $TMUX ]]; then
    sessions=$( tmux ls 2> /dev/null | awk '! /attached/ { sub(":", "", $1); print $1; }' | xargs echo )
    if [[ ! -z $sessions ]]; then
        echo "⚠ Available tmux session(s): \033[34m$sessions\033[0m"
    fi
    unset sessions
fi
```

Second, my Tmux config file itself is quite limited and I do not use any external plugin, again for portability issues. However, I updated the status line a bit:

```shell
set -g status-style fg=white,bg=black
set -g status-interval 5
set -g window-status-format "#[fg=colour8]○ #W "
set -g window-status-current-format "#[fg=colour4]● #W "
set -g window-status-current-style bg=black,fg=white
set -g window-status-activity-style bg=black,fg=yellow
set -g window-status-separator ""
set -g status-justify left
set -g status-right "#[fg=yellow]♯#S #[fg=white]| #[fg=blue]#(whoami)#[fg=white] on #h"
set -g status-left ""
```

This way, I have a list of the active and inactive windows (on the left), the name of the session, the user and the server name (on the right).

![tmux](/img/loop2.gif)

[^1]: There are many custom prompt setup available on the web, and [Fabrice Niessen](https://github.com/fniessen/shell-leuven) wrote a nice one for zsh or bash.
