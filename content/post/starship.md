---
title: "Starship"
date: 2022-08-16T14:20:29+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

I've been a heavy Zsh users for years. I tried Fish some years ago, and although it was a great experience I came back to Zsh at some point, especially given that I could get [autosuggestions] as well in a POSIX-compliant shell. On deskto.ps I noticed a very [nice setup] and I wondered WTF is this.

I spent some time configuring my Zsh prompt the way I like it to be: responsive and informative, no fuzzy stuff. The one we can see in the above screenshot looks too verbose to me, but that's just me. My prompt-related [Zsh mess] can be viewed online, and it looks like this:

![img](/img/2022-08-16-14-42-03.png)

Specifically, I highlight Python virtual environment, command duration (when > 5s) and exit code, as well as Git branch with overall repo status. I don't need to indicate whether files were added, modified or deleted, or any departure from a remote branch; I just want to know whethert he repo is clean or dirty. I use the same idea in my Neovim modeline.

Enters [starship], which is supposed to be a

> minimal, blazing-fast, and infinitely customizable prompt for any shell!

Being one of these blazing fast CLI utilities developed in Rust (think exa, fdfind, etc.), I thought I would give it a try. My idea was that since it only requires a single config file (in addition to the executable itself, which can be obtained using `curl -sS https://starship.rs/install.sh | sh`) I could reuse my setup on other machine quite easily.

I was able to reproduce my handmade Zsh prompt using the following settings: (The only difference is that I kept information regarding the virtual environment and Python version in the left prompt.)

```
format = """$username$directory$sudo$python$git_branch$git_status[%](bold blue) """
right_format = """$cmd_duration$status"""
add_newline = true

[directory]
style = "bold blue"

[cmd_duration]
min_time = 5_000
format = "[$duration]($style) "

[git_branch]
format = "[$branch(:$remote_branch)]($style)"

[git_status]
format = "([$all_status$ahead_behind]($style)) "
conflicted = "!"
modified = "*"
ahead = ""
behind = ""
diverged = ""
untracked = ""
staged = ""
deleted = ""
renamed = ""
style = "bold purple"

[sudo]
symbol = "# "
style = "bold red"
disabled = false

[python]
symbol = ""
format = '[${symbol}${pyenv_prefix}(${version} )(\($virtualenv\) )]($style)'
version_format = "v${major}(.${minor})"
detect_extensions = []

[status]
symbol = ""
disabled = false
```

Cleaner, simpler to manage, no need to deal with Zsh `precmd` or use circomvoluted idioms to test whether we are in an SSH session or not. More to the point, once starship prompt is configured, it can be reused by any supported shell, including Fish.

{{% music %}}The Jesus and Mary Chain • _Darklands_{{% /music %}}

[autosuggestions]: https://github.com/zsh-users/zsh-autosuggestions
[nice setup]: https://deskto.ps/u/fitrh/d/3ud2sw
[zsh mess]: https://aliquote.org/pub/zsh-prompt.zsh
[starship]: https://starship.rs/
