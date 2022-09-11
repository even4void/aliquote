---
title: "Haskell and Vim"
date: 2022-09-11T11:21:42+02:00
draft: false
tags: ["vim", "haskell"]
categories: ["2022"]
---

Between two procrastination sessions on my couch due to my recent unexplained health problems that force me to stay on bed rest most of the time, I spent a few hours (uh, over several days and in several times because of the general lack of energy) cleaning up the files that were lying around on my computer, writing some maintenance scripts, devising cleaner dark and light colorscheme for my terminal and Neovim, and reviewing my Neovim configuration. It now starts like a breeze, as you can see by yourself:

```shell
~ » hyperfine "nvim --headless +qa" --warmup 5
Benchmark 1: nvim --headless +qa
  Time (mean ± σ):      36.1 ms ±   0.3 ms    [User: 29.1 ms, System: 7.4 ms]
  Range (min … max):    35.5 ms …  37.0 ms    78 runs


~ » hyperfine "nvim --headless +qa" --warmup 5
Benchmark 1: nvim --headless +qa
  Time (mean ± σ):      28.1 ms ±   0.6 ms    [User: 22.6 ms, System: 5.6 ms]
  Range (min … max):    27.0 ms …  29.7 ms    103 runs
```

The above benchmarks were run with default (700-2,300 MHz) and high (up to 4,900 MHz) performance settings on my laptop. Most of the optimizations were done at the level of package management: I removed a bunch of unused stuff -- the list of plugins I used went down from 15 to 10 plugins in the last two months, and moved most of the plugins to the `opt` directory. Lazy loading almost halved the above startup time indeed. I even wrote a little doc file for my custom commands.

Other than that, I spent a little time working on a general helper Bash script for the `keywordprg` utility, in order to get some help whether I'm not using a Language server or not. As an example I have this little script that can be used from the command line or as a `K` handler in (Neo)vim:

```shell
#!/usr/bin/env bash

BROWSER=elinks

case "$1" in
stata)
	"$BROWSER" https://www.stata.com/help.cgi\?"${2}"
	;;
python)
	pydoc3 "${2}"
	;;
r)
	Rscript -e 'args <- commandArgs(TRUE); help(args[2], package=c("base", "stats"), help_type="text")' --args "${2}"
	;;
lisp)
	rc=$(hyperspec_lookup.ros "$2")
	"$BROWSER" "$rc"
	;;
help)
	echo "Usage: $0 {stata|python|r|lisp|help}"
	;;
*)
	echo "Usage: $0 {stata|python|r|lisp|help}"
	;;
esac

exit 0
```

Not very polished, but it works as intended. The Lisp case was discussed in a [previous post].

Back to the matter of this post. I originally intended to write about (Neo)vim and Haskell. After some reviews, I found that most of what I expected to say is already available online. I'm a hobbyist programmer, and I don't spend a lot of time with Haskell or Clojure. When I did play with those languages some years ago this was always with Emacs, and I got Intero and Cider to assist me. For Clojure there seems to something like [Conjure], but I usually rely on Clojure LSP myself. Regarding Haskell, there's some [Intero] for Vim too. Starter kits relying on [ghcide, hlint, hoogle] are also available, but I don't like starter kit anymore.

Without further ado, here are some retrospective posts on the state of Haskell and Vim in recent years:

- [Vim and Haskell in 2016]: Stephen Diehl has a long history with Haskell, even if it is mostly outdated material now that Haskell LSP is a thing, you may want to take a look at this post and other related posts on his site.
- [Haskell Development with Neovim]: This is mostly the old-fashioned way (several tools tied together with the help of Vim plugins).
- [Vim and Haskell in 2019]: This is a more modern take on Haskell+Neovim, with the old way of installing HIE and its wrapper.
- [(neo)vim and Haskell, 2021 edition]: I ended up in the same position, using the now consolidated Haskell LSP and Neovim builtin stuff (instead of Coc, as the author does). In my view, Neovim builtins for LSPs are still inferior to Coc, but I came to like the defaults: less friction, more people behind them, and it's always evolving, mostly for the better.

{{% music %}}Galaxie 500 • _Today_{{% /music %}}

[previous post]: /post/vim-and-lisp/
[conjure]: https://github.com/Olical/conjure
[intero]: https://github.com/parsonsmatt/intero-neovim
[ghcide, hlint, hoogle]: https://github.com/begriffs/haskell-vim-now
[vim and haskell in 2016]: https://www.stephendiehl.com/posts/vim_2016.html
[haskell development with neovim]: https://blog.jez.io/haskell-development-with-neovim/
[vim and haskell in 2019]: http://marco-lopes.com/articles/Vim-and-Haskell-in-2019/
[(neo)vim and haskell, 2021 edition]: https://0xd34df00d.me/posts/2021/10/vim-and-haskell-in-2021.html
