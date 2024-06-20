---
title: "Scheming in Vim (con't)"
date: 2024-06-17T21:21:32+02:00
draft: false
tags: ["scheme", "vim"]
categories: ["2024"]
---

See also [Scheme in Vim](/post/scheme-in-vim).

I've already given up on the idea of using [molten-nvim](/post/scheme-langserver/) to evaluate code in Neovim via Jupyter kernels. It looks great, really it is, but I always find myself in need of interacting with a live REPL or shell. I left [Magma](/post/jupyter-kernels-in-vim/) when it introduced serious UX changes; this time, I feel like it's just not for me. Without a touch of interactivity, I can't understand the appeal compared to, say, my poor-man "send line or visual selection" to a running terminal. That being said, there's still no proper implementation of a Swank server or a Jupyter kernel for Scheme.

I said in my previous post that I was using [slimv](https://github.com/kovisoft/slimv), which works fine for Common Lisp, but only allows the user to interact with MIT Scheme. I want to use Chicken or Chez Scheme. And so I replaced molten with [Conjure](https://github.com/Olical/conjure). Initially, I tought it would be easy to just tweak my filetype-specific settings so that I could trigger a Chez or Chicken client depending on file extension (I don't mind using `*.ss` for Chez Scheme source file). This is until I realized that Conjure rely on "universal" filetype to decide which client to launch, and so in the case of Scheme files the assumed extension is `*.scm`. So, for the time being I defined some guards based on a buffer-local or global variable, like in the following snippet of my `after/ftplugin/scheme.vim`:

```
if exists('b:is_chicken') || exists('g:is_chicken')
  exe 'ru! syntax/chicken.vim'
  setl keywordprg=chicken-doc
  setl makeprg=csc
  setl complete+=,k~/.local/share/scheme/words
  setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
  setl includeexpr=substitute(v:fname,'$','.scm','')
  setl path+=/home/chl/.cache/chicken-install
  setl suffixesadd=.scm
  setl lispwords+=condition-case
  setl lispwords+=with-input-from-string
  setl lispwords+=with-output-to-string
  setl lispwords+=handle-exceptions
  setl lispwords+=call/cc
  setl lispwords+=rec
  setl lispwords+=receive
  setl lispwords+=call-with-output-file
  let g:conjure#client#scheme#stdio#command = "csi -quiet -:c"
  let g:conjure#client#scheme#stdio#prompt_pattern = "\n-#;%d-> "
  let g:conjure#client#scheme#stdio#value_prefix_pattern = v:false
  nmap <buffer> gs :10 split term://csi -s %<cr>:startinsert<cr>
  nmap <buffer> <leader>! :10 split term://rlwrap csi<cr>
  nnoremap <buffer> <leader># :-1 read ~/.config/nvim/templates/scm<cr>
endif
```

I realize this is awful, especially since I need to set the appropriate variable value before loading a buffer. Even if I wrote a custom Lua user command to update the variable `is_chicken` and `is_chezscheme`, I still need to find a way to activate the correct client with a user-defined command. Relying on file extension is unreliable, IMHO (e.g., what about `*.sls` or `*.sps` files in this case?).

Anyway, I find Conjure quiet pleasant to use actually. It's much like a real REPL, but you mostly get the "PL" since the primary output is a log buffer, also displayed in a pop window (aka HUD) which I disabled rigth away. You can still evaluate expressions in the log buffer. There's no support for R and Stata, but I can still rely on my poor-man send-to-repl mappings (i.e., send current line or visual selection to a running terminal in a split window). I'll see how it goes in the near future, stay tuned!

{{% music %}}Magazine • _Parade_{{% /music %}}

