---
title: "Zero-plugin linting and fixing in Neovim"
date: 2022-10-10T10:13:45+02:00
draft: false
tags: ["vim"]
categories: ["2022"]
---

Like Vim, Neovim comes with a bunch of preconfigured "compilers" (i.e., general settings for `makeprg` and `errorformat`), yet it is possible to define additional compilers when you're not relying on a language server or, as in my case, when you want to use a specific linter via `makeprg`. Indeed, when it does not make sense to use a build system, it might be interesting to consider a linter as an alternative for Vim's `make` feature. The results of invoking `:make` are displayed in the quickfix window, which I particularly like. Likewise, the `formatprg` option allows one to define a fixer for `gq`'ing on a selection. We can also define a mapping to fix the whole buffer. This way, we can have linting and fixing facilities without relying on external plugins, like [null-ls][], [ALE][] or [efm-langserver][].

Usually, I stand by the already defined compilers, but I added two specifications, one for pytest and the other for shellcheck. The following is for pytest, and it has been proposed by [Phelipe][]:[^1]

```vim
if exists('current_compiler')
  finish
endif
let current_compiler = 'pytest'

if exists(':CompilerSet') != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ --tb=short\ -vv\ $*
CompilerSet errorformat=
      \%EE\ \ \ \ \ File\ \"%f\"\\,\ line\ %l,
      \%CE\ \ \ %p^,
      \%ZE\ \ \ %[%^\ ]%\\@=%m,
      \%Afile\ %f\\,\ line\ %l,
      \%+ZE\ %mnot\ found,
      \%CE\ %.%#,
      \%-G_%\\+\ ERROR%.%#\ _%\\+,
      \%A_%\\+\ %o\ _%\\+,
      \%C%f:%l:\ in\ %o,
      \%ZE\ %\\{3}%m,
      \%EImportError%.%#\'%f\'\.,
      \%C%.%#,
      \%+G%[=]%\\+\ %*\\d\ passed%.%#,
      \%-G%[%^E]%.%#,
      \%-G

function! FixColumnNumber()
  if b:current_compiler !=? 'pytest'
    return
  endif

  let qflist = getqflist()
  for i in qflist
    let i.col = i.col + 1
  endfor
  call setqflist(qflist)
endfunction

augroup FixPytestQuickFix
  au!
  autocmd QuickFixCmdPost <buffer> call FixColumnNumber()
augroup END
```

For shellcheck, I have the following in my `compiler` directory:

```vim
CompilerSet makeprg=shellcheck\ -f\ gcc
CompilerSet errorformat=%f:%l:%c:\ %trror:\ %m\ [SC%n],
               \%f:%l:%c:\ %tarning:\ %m\ [SC%n],
               \%f:%l:%c:\ %tote:\ %m\ [SC%n],
               \%-G%.%#
```

In both cases above, the tricky part is to manage the `errorformat`. Once you have defined your custom compiler, you can declare it in your filetype file in `after/ftplugin` and optionally defined an appropriate `makeprg` command. For instance, in the case of shellcheck I use the following:

```vim
compiler shellcheck
setlocal makeprg=shellcheck\ %
nmap <buffer> <silent> g= :!shfmt -i 2 -ln posix -sr -ci -s -w %<cr>:redraw!<cr>
```

The last line define a mapping to format the whole buffer using shfmt. I use `g=` for `vim.lsp.buf.format()` when a language server is available too. Of course I realize that the ALE or null-ls plugins handle all of that in a more elegant and efficient way, especially since it is asynchroneous contrary to the approach presented above and you are limited to one linter unless you write a shell script to gather several commands,[^2] but that's my take for exploiting Neovim's builtins.

I summarized sone of the options I have in my vimrc folder in the following table.

<small>
<table border="0">
<tbody>
<tr>
<td><em>Filetype</em></td>
<td><em>LSP</em></td>
<td><em>Linter</em></td>
<td><em>Fixer</em></td>
</tr>
<tr><td>c</td><td>clangd</td><td>built-in</td><td>built-in</td></tr>
<tr><td>python</td><td>pyright</td><td>built-in</td><td>black,[^3] isort</td></tr>
<tr><td>racket</td><td>racket-langserver</td><td>built-in</td><td>built-in</td></tr>
<tr><td>haskell</td><td>hls</td><td>built-in</td><td>built-in</td></tr>
<tr><td>purescript</td><td>purescriptls</td><td>built-in</td><td>built-in</td></tr>
<tr><td>sh</td><td>not used</td><td>shellcheck</td><td>shfmt</td></tr>
<tr><td>javascript</td><td>not used</td><td>quick-lint-js</td><td>prettier</td></tr>
</tbody>
</table>
</small>

{{% music %}}Greg Abate • _Sunshower_{{% /music %}}

[^1]: It is available on [GitHub](https://github.com/phelipetls/dotfiles/blob/master/.config/nvim/compiler/pytest.vim).
[^2]: I don't really mind formatting a buffer using a shortcut, although it is possible to use an autocommand to format it on save.
[^3]: I also use `setlocal formatprg=python3\ -m\ macchiato` for range formatting.

[null-ls]: https://github.com/jose-elias-alvarez/null-ls.nvim
[ALE]: https://github.com/dense-analysis/ale
[efm-langserver]: https://github.com/mattn/efm-langserver
[Phelipe]: https://phelipetls.github.io/posts/vim-errorformat-for-pytest/
