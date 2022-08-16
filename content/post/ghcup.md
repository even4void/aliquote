---
title: "GHCup and Haskell tooling in 2022"
date: 2022-08-13T21:23:04+02:00
draft: false
tags: ["haskell"]
categories: ["2022"]
---

For my Haskell toy scripts, I used to rely on [Stack] since [Chris Done] and [Alexis King], that I believe to be highly respectable in the field, recommend it. I only write small scripts, like I write small Scheme scripts. Maybe I should consider using those languages as my default scripting tools, but see [Why Haskell became my favorite scripting language].

Up to now, Stack was a great option : You can install global packages easily, so that System.Random is available after you launch a REPL with `stack ghci`, or you can manage small projects using `stack` directly. Getting [HLS] to work with external or local projects was of great service after years of hazards regarding Haskell's proper LSP plugin. Once properly configured, Neovim with its builtin LSP facilities makes writing Haskell code really enjoyable, especially thanks to the hints and linting/formatting facilities.

Two or three months ago I heard about [GHCup], which might be seens as what [rustup] is to Rust. Now, with only a single tool you'll get everything you need, including `ghc`, `cabal`, `stack` and `hls`, which you no longer need to compile or download as a release tarball from Github every month or so.

After you installed GHCup for the first time, you should have a working Haskell stack on your machine. You can upgrade or update at any time, much like you would do with `rustup`:

```shell
% ghcup list
% ghcup upgrade
% ghcup install ghc 9.4.1
% ghcup install cabal 3.8.1.0
```

If you're a Stack user, you can continue working as usual, you just got HLS for free.

![img](/img/2022-08-15-19-24-17.png)

{{% music %}}Keith Jarrett • _Never Let Me Go_{{% /music %}}

[^1]: To be honest, I really miss [Intero] from my Emacs days, much like I miss [Geiser] and Greg Hendershott's [racket-mode] for Scheme programming.

[stack]: https://docs.haskellstack.org/en/stable/README/
[chris done]: https://chrisdone.com/posts/haskell-repl/
[alexis king]: https://lexi-lambda.github.io/blog/2018/02/10/an-opinionated-guide-to-haskell-in-2018/
[why haskell became my favorite scripting language]: https://zignar.net/2021/07/09/why-haskell-became-my-favorite-scripting-language/
[hls]: https://github.com/haskell/haskell-language-server
[intero]: https://chrisdone.github.io/intero/
[geiser]: https://www.nongnu.org/geiser/
[racket-mode]: https://www.greghendershott.com/2020/02/using-drracket-check-syntax-in-racket-mode.html
[ghcup]: https://www.haskell.org/ghcup/
[rustup]: https://rustup.rs/
