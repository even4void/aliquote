---
title: "How I manage my startup shell scripts"
date: 2023-11-28T20:48:45+01:00
draft: false
tags: ["unix"]
categories: ["2023"]
---

I have been using a custom setup to organize my init shell scripts for more more than one year long now, and I believe it's pretty robust both for local and remote use. The idea came after I read a nice blog post about how best to manage a set of dotfiles (at the time of this writing I can't find the blog but I will update this post if I came across it again).

The only things you really need to know, beside writing proper shell scripts, is what a login vs. interactive shell is and which init files are loaded in each cases. Briefly, an interactive shell runs in your preferred terminal emulator and this is where you usually type your commands, while a non-interactive process involves some kind of I/O operations which the user can't interact with. A login shell is used whenever you log in on your system (after the X or Wayland server is started, this is probably the one at the top of all child processes), while a non-login shell is everything else that is started in userland after you logged in, including external process launched by separate programs without user's action.

My `.profile` simply reads:

```shell
# $HOME/.profile
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

for file in "$HOME"/.config/profile.d/*.sh; do
  . "$file"
done
```

I use zsh as my shell interpreter, so here's my `.zprofile`:

```shell
[ -r "$HOME"/.profile ] && source "$HOME"/.profile >/dev/null 2>&1

[[ $- =~ i ]] && [ -r "$HOME"/.zshrc ] && source "$HOME"/.zshrc
```

The `.bash_profile` is identical, so that I can rely on the exact same config to load everything I need independent of the shell I'm using, or more precisely the machine I interact since I do a lot of remote work through ssh where I generally only use Bash and BW colorscheme. In sum, the above scheme allows to manage login shells by sourcing a common set of relevant init files. The `.config/profile.d` directory follows Bash scripts organization for environment variables (`/etc/profile`) and application-specific startup files (`/etc/profile.d`). I currently have three main files there:

```shell
» tree .config/profile.d
.config/profile.d
├── 00-path.sh
├── 10-editor.sh
└── 20-shell.sh
```

The main file is of course `00-path.sh` where I set up all relevant paths for libraries and executables on my HD. Since I use Ubuntu on other machines too, this applies equally well to remote server. Here is an excerpt from this file:

```shell
# vim: noai:ts=2:

# Fix API server issue with Podman
# https://github.com/containers/podman/issues/13468#issuecomment-1062764637
export DOCKER_HOST="unix:$XDG_RUNTIME_DIR/podman/podman.sock"

# Scheme
[ -d "$HOME/.local/lib/scheme" ] && export CHEZSCHEMELIBDIRS="/home/chl/.local/lib/scheme:"

# Racket
[ -d "/usr/local/racket" ] && PATH="/usr/local/racket/bin:$PATH"

# Node
if [ -d "$HOME/.local/lib/npm" ]; then
	NPM_STORE="$HOME/.local/lib/npm"
	PATH="$NPM_STORE/bin:$PATH"
	MANPATH="${MANPATH-$(manpath)}:$NPM_STORE/share/man"
fi

# global and user's local systems
[ -d "/opt/bin" ] && PATH="$PATH":/opt/bin
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
```

Nothing's really exceptional except that I use guarded statements for portability across machines. Same idea for `20-shell.sh`, where I setup default config and directories for various applications:

```shell
# vim: noai:ts=2:

# Rg
if command -v rg > /dev/null 2>&1; then
  export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"
fi

# Bibtex (for Org and FZF)
# NOTE: Bibtex file hardcoded
if command -v bibtex-ls > /dev/null 2>&1; then
  export BIBINPUTS="$HOME/Documents/notes/:$BIBINPUTS"
  export FZF_BIBTEX_CACHEDIR="$HOME/.cache/bibtex-ls"
  export FZF_BIBTEX_SOURCES="$HOME/Documents/notes/references.bib"
fi

# News
export NNTPSERVER="news.eternal-september.org"

# Python
export VIRTUAL_ENV_DISABLE_PROMPT=1
# export PYTHONDONTWRITEBYTECODE=1
```

The startup sequence when I log on my computer for the first time is then:

```shell
.zprofile -> .profile -> .config/profile.d/* -> .zshrc -> .config/zsh/*
```

From `.zshrc` I source various other shell scripts specific to Zsh (e.g., completion) or common with Bash (alias and functions). When I'm on ssh or on virtual console, I disable some extra stuff like Starship prompt or colors.

```shell
if [ $XDG_SESSION_TYPE = "tty" ]; then
  unset LS_COLORS
  export TERM=xterm-mono
  export NO_COLOR=1
  alias ll="ls -alF"
  PROMPT="%~ %(!.#.%%) "
else
  eval "$(starship init zsh)"
fi

TRAPEXIT() {
  if [[ ! -o login ]]; then
    . ~/.zlogout
  fi
}
```

The `.zlogout` file takes care of cleaning the mess introduced by some programs, who insists on creating various directories here and there.

That's it!

{{% music %}}Nick Cave and the Bad Seeds • _Wonderful Life_{{% /music %}}
