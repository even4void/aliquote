---
title: "TUIs best of"
date: 2024-09-01T21:08:19+02:00
draft: false
tags: ["unix"]
categories: ["2024"]
---

Here's a list of TUIs I use on my OS. They are ranked according to daily usage, from top to bottom. Since I spent my time in a Terminal managed by Tmux, with almost inevitably cmus and neomutt running in separate windows,[^1] they are ranked first. I do not mention sed, awk, fzf, rg, and all the good stuff from GNU coreutils, nor zsh itself.

- [tmux] for it is the best multiplexer available and it is highly customizable.
- [neovim] because it has a decent terminal and good defaults.
- [cmus] for everything that's related to music stored on my HD.
- [mpv] for all things related to video and music (when I'm not using cmus).
- [neomutt] because, well, there's a lot of emails going on when you're employed and I also like answering questions about statistics or this site in general.
- [newsboat] to read everything I like from the internet, i.e. people who love to share good stuff.
- [irssi] to read and occasionally chat with others (channels: #lisp, #commonlisp, #scheme, #clojure, #chicken).
- [tig] to browser the history of my Git repos.
- [rga] to augment ripgrep with PDF support.
- [csvtk] and [csvlens] when working with Excel or CSV files.
- [neofetch] to quickly share my config.
- [onefetch] when I want to get a basic summary of a Git repository.
- [wtwitch] to check streamers and their VODs; also [ytfzf] to check video or music available on YT without all the fuzz of the YT web API -- these tools rely on mpv of course.
- [asciinema] to share terminal input/output when I do not want to perform live recording.
- a bunch of Git addons saved in `$HOME/bin` folder that allow me, e.g., to update all remote repos, get various stats, rewrite author and/or history and so on.
- various shell scripts to convert movie to jpeg or gif, and pdf to png or tikz to pdf, interact with tarball, etc.
- some utilities for interacting with tmux or cmus, as well as neomutt, and a script named `radio` that triggers mpv with online radios.
- I also have several handy alias in my zsh config.

{{< figure src="/img/2024-09-07-10-12-10.png" title="Back to Foot as my main terminal" >}}

Here's a raw list of binaries I installed over the time. I won't show my `$HOME/bin` folder, whcih I purged recently from old X11-only or defunct shell scripts. I still have a dozens of those lying around.

```shell
» ls .local/bin
akku@         csvtk*      gen-hie*                marksman*         pylyzer*      ruff*             streamlink@       viu*
alen*         deno*       haskell-debug-adapter*  matterbridge*     py-spy*       rust-analyzer*    stylish-haskell*  wtwitch*
ark*          difft*      hdc*                    mdbook*           qlot@         scc*              stylua*           xlispstat*
bandcamp-dl@  duckdb*     hoogle*                 mdcat*            qr*           seqkit*           swish-lint@       xstata@
bb*           dut*        ihaskell*               nvimpager*        qsv*          seqtk*            tdf*              xstata-mp@
bibclean*     elm*        joker*                  onefetch*         reader*       shellharden*      texlab*           ya@
cabal-fmt*    fast-tags*  lein*                   ormolu*           rfc*          sixcat*           theme.sh*         yazi@
clojure-lsp*  floskell*   lsix*                   pandoc-crossref*  rga*          stack-clean-old*  ueberzug*         ytfzf*
csslint*      fourmolu*   ltex-ls@                pdfcpu*           rga-fzf*      stan*             ueberzugpp*       zaread*
csvlens*      fzf*        lua-language-server*    poetry@           rga-preproc*  statweave.jar     vale*
```

Apart from LSPs, I like to keep in this XDG folder stuff installed from GitHub and alike, or binaries that are too old in Ubuntu official repositories (e.g., fzf). I still need to write an `install.sh` shell script to download and/or update binaries from latest GitHub release. I removed everything installed with pip after I upgraded to [Ubuntu 24.04 LTS](post/ubuntu-24.04/) and I'm now symlinking binaries from package installed in separate virtual environments in my `$HOME/.Local/lib` folder. I also keep binaries like [matterbridge](/micro/2021-06-18-13-05-36/) for memories. Many are still installed for testing purpose, e.g. marksman.
I know this is a lot and for many of those binaries, I must admit I don't use them often. Some binaries are also simple shell scripts for old X sessions (i3 or Regolith) and are not relevant anymore since I'm on Wayland.

{{% music %}}A Certain Ratio • _The Fox_{{% /music %}}

[^1]: I used to launch each one in separate sessions, but I now use mostly the same session for media and news consumption, along regular off-hand tasks, and I create dedicated session for projects I'm working on.

[tmux]: https://github.com/tmux/tmux
[neovim]: https://neovim.io/
[cmus]: https://neovim.io/https://cmus.github.io/
[mpv]: https://mpv.io/
[neomutt]: https://neomutt.org/
[newsboat]: https://newsboat.org/
[irssi]: https://irssi.org/
[tig]: https://jonas.github.io/tig/
[rga]: https://github.com/phiresky/ripgrep-all
[csvtk]: https://bioinf.shenwei.me/csvtk/
[csvlens]: https://github.com/YS-L/csvlens
[neofetch]: https://github.com/dylanaraps/neofetch
[onefetch]: https://github.com/o2sh/onefetch
[wtwitch]: https://github.com/krathalan/wtwitch
[ytfzf]: https://github.com/pystardust/ytfzf
[asciinema]: https://asciinema.org/
