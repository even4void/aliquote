---
title: "Random thoughts for the end of the year"
date: 2020-12-27T07:27:13+01:00
draft: true
tags: ["unix"]
categories: ["2020"]
---

I replaced my everything-in-Emacs setup with separate apps, and I don't feel lost at all, on the contrary. The only thing I'm really missing is my Org setup, but it's by far the simplest configuration I can setup under vanilla Emacs without too much effort. That being said, I really come to appreciate the power of Vim, or Neovim for what matters, for text editing, and single app for other tasks. I found that this allows me to stay more focused on the current task at hand. If I need to check my emails, then I know I need to use a different app (Neomutt); likewise, checking Git status means I need to get back to Zsh and use Git CLI commands or [Tig](https://github.com/jonas/tig); and so on for readings news, chatting on IRC...

Something I find annoying in Ubuntu are the default permission settings --- 755, which means that others, or the "world", have the same privileges than the groups on your `$HOME` directory, i.e., everybody can read your own directory. [Other distro](https://unix.stackexchange.com/questions/95897/permissions-755-on-home-user) don't use 755 as the defaults, and I believe the right permission flags should 751. Recall that r=4, w=2, x=1, for user, group and other, which means that 751 amounts to `-rwx-r-x--x`, i.e., you grant read access to group only.

There's something strange hapenning with Zsh and colored output for `ls` (or `LS_COLORS` sometimes), unless you're on a BSD-like system where `export CLICOLOR=1` takes care of this setting for you. This means that a basic usage of `ls` returns a listing of the current directory without any color at all in Ubuntu. Of course, you can set up a quick alias `ls=ls --color`, but with time I came to appreciate this. Rather than overriding the default `ls` with an alias, I now use the following shortcuts:

```bash
alias la="ls -A"
alias ll="exa --long --git"
alias lk="ls -lhSp"
```

As can be seen, if I need colored output I use [exa](https://the.exa.website/), otherwise I stand by the default settings for Zsh.

I finally managed to install all the programs and libraries I need (including clang10 and Haskell), and to keep away from Node. Why? When you ask to install the very basic stuff (Node and npm), you ended up with something like 300 packages, including Python 2.7 which noboby uses anymore. Why is it that complicated? Can't we really have binary packages for csslint or eslint?

```bash
Les NOUVEAUX paquets suivants seront installés :
  gyp libc-ares2 libjs-inherits libjs-is-typedarray libjs-psl libjs-typedarray-to-buffer libnode-dev
  libnode64 libpython2-stdlib libpython2.7-minimal libpython2.7-stdlib libuv1-dev node-abbrev node-ajv
  node-ansi node-ansi-align node-ansi-regex node-ansi-styles node-ansistyles node-aproba node-archy
  node-are-we-there-yet node-asap node-asn1 node-assert-plus node-asynckit node-aws-sign2 node-aws4
  node-balanced-match node-bcrypt-pbkdf node-bl node-bluebird node-boxen node-brace-expansion
  node-builtin-modules node-builtins node-cacache node-call-limit node-camelcase node-caseless
  node-chalk node-chownr node-ci-info node-cli-boxes node-cliui node-clone node-co node-color-convert
  -%<------
  node-yargs node-yargs-parser nodejs nodejs-doc npm python-pkg-resources python2 python2-minimal
  python2.7 python2.7-minimal
0 mis à jour, 296 nouvellement installés, 0 à enlever et 16 non mis à jour.
Il est nécessaire de prendre 14,9 Mo dans les archives.
Après cette opération, 75,9 Mo d'espace disque supplémentaires seront utilisés.
```
Anyway, I get a binary-like package for [csslint](http://csslint.net/) by using rhino as recommended on Github. I am not sure I will miss prettier for HTML and CSS stuff. In my opinion, linters are more valuable than fixers, and Vim's [ALE](https://github.com/dense-analysis/ale) doesn't care anyway: If there's one fixer available it will be used, otherwise it's not a big deal.
