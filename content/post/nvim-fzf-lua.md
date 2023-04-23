---
title: "Using fzf-lua"
date: 2023-04-23T20:29:50+02:00
draft: false
tags: ["vim"]
categories: ["2023"]
---

I use a boring TUI low-color setup, and I have never been as happy since it allows to focus on the task at hand. Anyway, my Neovim configuration has been relatively stable for the past few months, and since Neovim 0.7-dev I haven't encountered a single breaking change in Neovim core, which is pretty good sign. At the time of this writing, the nightly version of Neovim is 0.10.0-dev (LuaJIT 2.1.0-beta3).

Today I decided to give a try to [fzf-lua](https://github.com/ibhagwan/fzf-lua) as a replacement for [fzf.nvim](https://github.com/junegunn/fzf.vim). Since it is my daily driver to navigating files, history, etc. in Neovim, it must be at least as efficient as Junegunn Choi's wonderful plugin. It looks like it is. Everything works perfectly, with the added benefits of a more comfortable Git UI (you can stage or unstage files, and preview local changes), an online help for available shortcuts depending on the context, more utilities (just [take a look](https://github.com/ibhagwan/fzf-lua#search) at the number of functions to grep for something in your files); last but not least, it support Neovim builtin [LSP and diagnostics](https://github.com/ibhagwan/fzf-lua#lspdiagnostics), which I was missing from fzf.vim.

I easily updated my custom grep function, which fuzzy search project directory when on a blank line or the word under the cursor, with FzfLua `grep_*` utilities:

```
" fzf.vim version
" fzf.vim version
" function! misc#fzf_rg() abort
"   let currWord = expand('<cword>')
"   if len(currWord) > 0
"     execute ':Rg ' . currWord
"   else
"     execute ':Rg'
"   endif
" endfunction

" fzf.lua version
function! misc#fzf_rg() abort
  let currWord = expand('<cword>')
  if len(currWord) > 0
    execute ':FzfLua grep_cword'
  else
    execute ':FzfLua grep_project'
  endif
endfunction
```

Ok, not a big deal. No other configuration required, except for displaying all Fzf window as before, in a bottom split. This was easy to configure, though:

```
require("fzf-lua").setup({
  winopts = {
    split = "belowright 10new",
    border = "single",
    preview = {
      hidden = "hidden",
      border = "border",
      title = false,
      layout = "horizontal",
      horizontal = "right:50%",
    },
  },
})
```

So, I think I'll be switching definitely in a few days if nothing bad happens in the mean time.

Finally, I really like the quote on the GH README:

> Why Fzf-Lua<br>
> ... and not telescope or any other vim/neovim household name?<br>
> As @junegunn himself put it, “because you can and you love fzf”.

{{% music %}}Chico Hamilton • _Goodbye Baby Blues_{{% /music %}}
