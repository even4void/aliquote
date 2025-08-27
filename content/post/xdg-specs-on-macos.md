---
title: "XDG Base Directory and macOS"
date: 2025-08-14T17:59:34+02:00
draft: false
tags: ["apple", "unix"]
categories: ["2025"]
---

Last month I spent a few hours configuring my system (macOS Sequoia) to follow the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/). I like the idea of having common paths defined for most applications. It worked quite well for me on Ubuntu, and I wanted to [declutter](/micro/2025-03-10-12-44-08/) my `$HOME` dotfiles.

{{% alert note %}}
<small>[2025-08-26]</small><br>
Two weeks later, I came across this blog post by Rebecca Turner on [macOS and user configuration files](https://becca.ooo/blog/macos-dotfiles/). I share her thoughts about "When should you use ~/Library/Application Support", and I always expected other devs do too. [Hygg](https://github.com/kruseio/hygg) is a nice alternative to [doxx](https://github.com/bgreenwell/doxx), and in addition it supports PDF and EPUB, but its configuration and state files are written in `$HOME/Library`.
{{% /alert %}}

I already follow part of the XDG specs by putting everything I can in `$HOME/.config`. I also make heavy use of `$HOME/.local` to store additional programs (`/bin`), libraries (`/lib`) and extra stuff (`share`). To automate things a little I defined specific environment variables to point to the right directories. Here is what I have in my `$HOME/.config/profile.d/00-path.sh` which is sourced for every login shell (Apple Terminal use login shell by default):

```shell
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export TERMINFO=/usr/share/terminfo/
export LEIN_HOME=$XDG_CONFIG_HOME/leiningen
export HOMEBREW_NO_EMOJI=1
export HOMEBREW_NO_AUTO_UPDATE=1
export W3M_DIR=$XDG_STATE_HOME/w3m
export SQLITE_HISTORY=$XDG_STATE_HOME/sqlite_history
export LESSHISTFILE=$XDG_STATE_HOME/less_history
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history
export NCFTPDIR=$XDG_CONFIG_HOME/ncftp
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export MYPY_CACHE_DIR=$XDG_CACHE/.mypy_cache
export MPLCONFIGDIR=$XDG_CONFIG_HOME/matplotlib
export CHICKEN_DOC_REPOSITORY=$HOME/.local/lib/scheme/chicken-doc
export CHICKEN_EGG_CACHE=$XDG_CACHE/chicken
export CHICKEN_INSTALL_REPOSITORY=$HOME/.local/lib/scheme/chicken
export CL_SOURCE_REGISTRY=$HOME/cwd/common-lisp
# export PKG_CONFIG_PATH=/opt/homebrew/lib/pkgconfig
```

Yes, that's a lot of global settings. Also, please note that the aim is not to follow _stricto sensu_ the XDG specs, just to organise things a little. The first four lines are what is of interest in this case. Things get a little more interesting when we read the documentation related to Python and its ecosystem as we learn that we can modify the default path for the IPython or Jupyter config directory, as well as Matplotlib, or get ride of Mypy stuff. I use `$XDG_STATE_HOME` to store all my histories (zsh, sqlite, etc.). By defining such environment variables I was able to remove almost everything in my home directory. I know we can move [GHCUp](https://ghcup.readthedocs.io/en/latest/), [rustup](https://rustup.rs), and other frameworks to other places, but I prefer to keep them in place. Here is the whole picture:

```shell
» ls -a ~
./                   .config/             .juliaup/            .ssh/                cwd/                 Music/
../                  .cups/               .local/              .stack/              Desktop/             Pictures/
.cabal/              .deno/               .mail/               .Trash/              Documents/           Public/
.cache/              .DS_Store            .Renviron            .zprofile            Downloads/           Sites/
.cargo/              .ghcup/              .roswell/            .zshenv@             Library/             tmp/
.CFUserTextEncoding  .julia/              .rustup/             backup/              Movies/

» ls ~/.config
asciinema/        gh/               htop/             leiningen/        neomutt/          racketrc          wtwitch/
bandcamp-dl.json  ghc/              ipython/          matplotlib/       newsboat/         ripgreprc         yt-dlp/
beets/            ghostty/          irssi/            mdlrc             npm/              starship.toml     zed/
clojure/          git/              isyncrc           mpv/              nvim/             tmux/             zsh/
cmus/             gnupg/            jupyter/          msmtp/            profile.d/        uv/
ctags/            gnuplot/          latexmk/          ncftp/            R/                w3m/

» ls ~/.cache
bibtex-ls/           gh/                  m2/                  neomutt/             stack/               wtwitch/
chicken/             ghcide/              matplotlib/          nvim/                starship/            yt-dlp/
clojure-lsp/         hie-bios/            maven/               org.R-project.R/     textual/
common-lisp/         lua-language-server/ mu/                  slime/               uv/
```

Everything zsh-related can be stored in `XDG_CONFIG_HOME`, provided you define the `ZDOTDIR` location. Here is what I put in `$HOME/.zprofile`:

```shell
ZDOTDIR=$HOME/.config/zsh

for file in "$HOME"/.config/profile.d/*.sh; do
  . "$file"
done
```

Note that the `zsh` config file (`zshrc`) will still need to be prefixed by a dot. I also symlink `$HOME/.zshenv` to `$HOME/.zprofile` to avoid issue with some CLI tools that won't initialize zsh as a login shell (e.g., Neovim terminal). I guess it's not difficult to avoid  this issue, but I'm lazy as you know.

{{% music %}}Hooverphonic • _Mad About You_{{% /music %}}
