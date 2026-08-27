---
title: "Setting up (Neo)vim for CONTEXT"
date: 2026-08-27T10:15:21+02:00
draft: false
tags: ["vim", "tex"]
categories: ["2026"]
---

Although there's no LSP nor any advanced plugin for the CONTEXT typesetting
system, it is quite easy to configure Vim or Neovim in a way that makes editing
$\TeX$ more pleasant. Like I did for Scheme in the past, we need to set up
several things first.

Autocompletion can be done using dictionary completion, which is the simplest
way I can think of. I already use this technique for Scheme. You just need a
list of language keywords in plain text. Fortunately, CONTEXT provides us with a
way to extract all commands easily, and for different text editors, but see
`mtxrun --script interface --interfaces`. You can filter the XML output that is
generated for BBEdit as it is quite easy to parse in Vim itself, or use the text
output itself as I discovered later. Either way, you'll end up with more than 5k
commands that you can add to a custom dictionary. I will use
`$HOME/.local/share/context/words`

```shell
% mtxrun --script interface --text & mv context-commands-common.txt ~/.local/share/context/words.txt
```

Then, in Vim or Neovim (I use `after/ftplugin/context.vim`), put the following
line:

```vim
setl complete+=,k~/.local/share/context/words
```

And now you can use `<C-n>` and `<C-p>` as you type. You also likely want to get
some auto-formatting option. The following lines will allow to use `gq` and `=`
to hard wrap text at 80 chars and reformat table most of the times:

```vim
setlocal formatprg=fmt\ -w80
setlocal equalprg=column\ -t
```

The ft plugin that ships with Vim and Neovim already includes everything you
need to compile a CONTEXT document. Use `:ConTeXt` or `:make`, and you're done.
This matches the ConTeXt-TL engine you have in TeXShop on macOS. Also, CONTEXT
is not $\LaTeX$, and any error will appear nicely formatted in the QuickFix
list. Just ensure that you set up synctex properly if you want to use
forward/reverse search (on macOS, it should be possible to interact with TeXShop
previewer directly if TeXShop is configured to use an alternate editor):

```vim
let b:context_synctex=1
```

If you want to use the older MkIV engine instead, pass the `--luatex` option as
follows:

```vim
let b:context_extra_options="--luatex"
```

The [CG wiki][1] provides extra advices for abbreviations, cleaning auxiliary
files (fewer than those returned by latexmk or pdflatex in any case). Note that
the ft plugin provides the handy shortcuts you are used to when navigating
between section and paragraphs (`]]`, `[]`, etc.), as well as a properly
configured `%` matchit operator.

As for browsing the doc using `keywordprg` I currently use the CG wiki for the
[CONTEXT command reference][2] using the same helper shell script that I
described in a [previous post][3]. As seen in the screenshot below (right), it
launches w3m in a new window and displays the online doc with proper
highlighting and working links. On the left you can see the result of calling
`:make` on a document. Using `:ConTeXt` just adds some colored output. It's up
to you.

{{< fluid_imgs
"pure-u-1-2|/img/2026-08-27-10-42-35.png"
"pure-u-1-2|/img/2026-08-27-15-26-25.png" >}}

See, no LSP, no super-charged plugin. Actually this is how I write Lisp-related
or Stata stuff and it's perfectly fine to have a minimal toolbox at your
fingertips. And things never break!

[1]: https://wiki.contextgarden.net/Input_and_compilation/Text_editors/Vim
[2]: https://wiki.contextgarden.net/Command
[3]: /post/neovim-markdown

{{% music %}}Jeff Buckley • *Everybody Here Wants You*{{% /music %}}
