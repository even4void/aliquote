---
title: "Writing in Markdown with Neovim"
date: 2025-08-31T09:50:36+02:00
draft: false
tags: ["vim"]
categories: ["2025"]
---

I don't use any plugin for writing Markdown in Neovim. I used to have some function to navigate between headings, select code block, or for folding sections, code block and things like that. But now all of this is builtin. To enable folding via Treesitter, just add:

```vim
setlocal foldmethod=expr
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
```

The `[[` and `]]` to jump between headers are available too, and `vab` will select a code block (even `%` works to jump to matching fences[^1]). I like to use reference rather inline links. Fortunately, Seth Brown's [formd][1] still works, and I added a shortcut to put all link rightly numbered at the end of the document. I also have a dedicated function to put all heading in the quickfix list, which I find more convenient than folding all the document and navigating between headers with `zj` and `zk`. Previously, I was relying on `ctags` to generate tags for me, and I used [fzf-lua][2] `btags` to live query the table of contents. I can preview any Markdown file with [Marked2.app][3] -- I have custom preprocessor and processor to render images from my website properly or to use the same custom CSS file that I use to export document to HTML. Finally, I use [translate-shell][4] for brief translation from French to English.

```vim
nnoremap <buffer> gra :call Formd("-r")<cr>
xnoremap <buffer> <silent> grn :!trans :en -brief -<cr>
nnoremap <buffer> gO :call MarkdownHeaders()<CR>
nnoremap <buffer> <silent> gl :!open -a Marked\ 2.app %<cr>
nnoremap <buffer> <leader>cc :setlocal! conceallevel=2<cr>
nnoremap <buffer> <leader># :-1 read ~/.config/nvim/templates/md<cr>
```

Some folks use the `K` mapping to call macOS default dictionary, but I use `setlocal keywordprg=nvim-keywordprg\ dict`, where `nvim-keywordprg` is a little shell script that handles several external doc commands (Stata, Lisp, R, Python) with [w3m][5], although I only use it for Common Lisp actually. Here is the corresponding entry for `dict`:

```vim
term=$(echo -n "$2" | jq -Rr @uri)
curl "dict://dict.org/d:$term"
```

<br>
{{% alert note %}}
<small>[2025-09-02]</small><br>
Finally, I found it more convenient to use [vim-mac-dictionary](https://github.com/johngrib/vim-mac-dictionary/tree/master). With little effort, you can extract the useful part of the code. Be sure to sort your local dictionaries in the right order since the Swift code will only lookup the first entry. Since you can use any VimL or Lua function as `keywordprg` (when prefixed by a colon), you only need to modify the defualt command so that it reads: `command! -nargs=+ MacDictWord :silent! call Find(expand('<cword>'))<CR>`. Much more pleasant than the above ad-hoc solution.
{{% /alert %}}

To manage my bibliographic entries, I use Bibtex and a wrapper around `fzf-lua` which can be called in normal or insert mode. It was very useful when I was writing tutorial and slides, but now I rarely use it since I mostly write on this blog.

{{< fluid_imgs
"pure-u-1-2|/img/2025-08-31-10-30-28.png"
"pure-u-1-2|/img/2025-08-31-10-08-16.png" >}}

Treesitter now include both the `markdown` and `markdown_inline` parsers, which means you get highlighting for free everywhere, including code blocks. I do not use any linter, but [prettier][6] does a nice job when it comes to formatting the whole document:

```vim
compiler quarto
setlocal formatprg=prettier\ --parser=markdown\ --stdin-filepath
```

As can be seen, I also use [quarto][7] as my `make` program. Actually it's not very elaborated,a nd I need to fix the `errorformat`, but at least it allows me to export Markdown or Quarto documents to PDF or HTML using `make pdf` or `make html`:

```vim
" compiler/quarto.vim
if exists("current_compiler") | finish | endif
let current_compiler = "quarto"

let s:cpo_save = &cpo
set cpo&vim

silent CompilerSet makeprg=quarto\ render\ %\ --to\ $*

let &cpo = s:cpo_save
unlet s:cpo_save
```

[^1]: Or maybe not, I didn't really check, but I still have this piece of code: `let b:match_words = b:match_words . ',^```.\+$:^```$'`.

{{% music %}}Linkin Park • _Castle of Glass_{{% /music %}}

[1]: https://github.com/seth-brown/formd
[2]: https://github.com/ibhagwan/fzf-lua
[3]: https://marked2app.com
[4]: https://www.soimort.org/translate-shell/
[5]: https://w3m.sourceforge.net
[6]: https://prettier.io
[7]: https://quarto.org
