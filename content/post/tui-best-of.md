---
title: "TUIs best of"
date: 2024-09-01T21:08:19+02:00
draft: false
tags: ["unix"]
categories: ["2024"]
---

Here's a list of TUIs I use on my OS. They are ranked according to daily usage, from top to bottom. Since I spent my time in a Terminal managed by Tmux, with almost inevitably cmus and neomutt running in separate windows,[^1] they are ranked first. I do not mention sed, awk, fzf, and all the good stuff from GNU coreutils, nor zsh itself.

- tmux for it is the best multiplexer available and it is highly customizable
- neovim because it has a decent terminal and good defaults
- cmus for everything that's related to music stored on my HD
- neomutt because, well, there's a lot of emails going on when you're employed and I also like answering questions about statistics or this site in general
- newsboat to read everything I like from the internet, i.e. people who love to share good stuff
- irssi to read and occasionally chat with others (channels: #lisp, #commonlisp, #scheme, #clojure, #chicken)
- tig to browser the history of my Git repos
- csvtk and csvlens when working with Excel or CSV files
- neofetch to quickly share my config
- onefetch when I want to get a basic summary of a Git repository
- wtwitch to check streamers and their VODs
- ytfzf to check video or music available on YT without all the fuzz of the YT web API
- asciinema to share terminal input/output when I do not want to perform live recording
- a bunch of Git addons saved in `$HOME/bin` folder (see below)
- ( list to be completed )

Here's a raw list of binaries I installed over the time. I won't show my `$HOME/bin` folder, whcih I purged recently from old X11-only or defunct shell scripts. I still have a dozens of those lying around.

```shell
» ls .local/bin
akku@         deno*       haskell-debug-adapter*  matterbridge*     py-spy*       rust-analyzer*    stylish-haskell*  wtwitch*
alen*         difft*      hdc*                    mdbook*           qlot@         scc*              stylua*           xlispstat*
ark*          duckdb*     hoogle*                 mdcat*            qr*           seqkit*           swish-lint@       xstata@
bb*           dut*        ihaskell*               nvimpager*        qsv*          seqtk*            tdf*              xstata-mp@
bibclean*     elm*        joker*                  onefetch*         reader*       shellharden*      texlab*           xsv*
cabal-fmt*    fast-tags*  lein*                   ormolu*           rfc*          sixcat*           theme.sh*         ya@
clojure-lsp*  floskell*   lsix*                   pandoc-crossref*  rga*          stack-clean-old*  ueberzug*         yazi@
csslint*      fourmolu*   ltex-ls@                pdfcpu*           rga-fzf*      stan*             ueberzugpp*       ytfzf*
csvlens*      fzf*        lua-language-server*    poetry@           rga-preproc*  statweave.jar     vale*             zaread*
csvtk*        gen-hie*    marksman*               pylyzer*          ruff*         streamlink@       viu*              zprint*
```

I know this is a lot and for many of those binaries, I must admit I don't use them often. Some binaries are also simple shell scripts for old X sessions (i3 or Regolith) and are not relevant anymore since I'm on Wayland. I still need to write an `install.sh` shell script to download and/or update binaries from latest GitHub release. I removed everything installed with pip after I upgraded to [Ubuntu 24.04 LTS](post/ubuntu-24.04/) and I'm now symlinking binaries from package installed in separate virtual environments in my `$HOME/.Local/lib` folder. I also keep binaries like [matterbridge](/micro/2021-06-18-13-05-36/) for memories. Many are still installed for testing purpose, e.g. marksman.

{{% music %}}A Certain Ratio • _The Fox_{{% /music %}}

[^1]: I used to launch each one in separate sessions, but I now use mostly the same session for media and news consumption, along regular off-hand tasks, and I create dedicated session for projects I'm working on.
