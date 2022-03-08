---
title: "Vim and clangd"
date: 2022-03-08T21:35:53+01:00
draft: true
tags: ["vim", "clang"]
categories: ["2022"]
---

Bioinformatics is what I officially do for a living nowadays, along web dev -- yes, those pretty little command-line tools are often better served using a Bootstrap-based Flask or Django framework, you know. Bioinformatics is cool, but it takes as much time as running a multi-level Bayesian <abbr title="Item Response Theory">IRT</abbr> model, especially on those low cost servers we got at the University. Today I decided to enjoy my free time while processing several tasks in parallel in the background (read mapping and genome assembly) and to dive into my Neovim config.

I removed a few unused packages, as usual. I tried a few other ones, because why not. The most surprising finding was that the successor of ['hrsh7th/nvim-compe'] (now defunct), which is what I use as a basic completion engine for all things related to LSP, buffer and command-line management, is [nvim-cmp]. It is maintained by the same author but this plugin is just asking us to install a ton of additional plugins (e.g., one for LSP stuff, one for buffer, one for `:` stuff, and so on). I can understand why (one target, one package), but I find it weird that we can't get a unified UI for things like completion. After all, we only have to manage one package to get all LSP settings, isn't it? Anyway, I tried this approach and just gave up: too much noise (why do we need to enable a snippet engine system, even if we don't need one, BTW?), not that many improvements over my bare use of completion needs. I reverted back to `nvim-compe`.

Later on, I wanted to test my c/c++ config more extensively. I came across a lot of posts dealing with how to setup Vim or Neovim and LSP/Clangd. I already had the bare config for ['neovim/nvim-lspconfig'], which is (mostly):

```lua
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = {noremap=true, silent=true}

  buf_set_keymap("n", "<localleader>w=", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<CR>", opts)
  buf_set_keymap('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<localleader>wd', '<cmd>lua vim.diagnostic.open_float(buffer, {scope="line"})<CR>', opts)
  buf_set_keymap('n', '<localleader>wl', '<cmd>lua vim.lsp.codelens.refresh()<CR>', opts)
  buf_set_keymap('n', '<localleader>wL', '<cmd>lua vim.lsp.codelens.run()<CR>', opts)
  buf_set_keymap('n', '<localleader>ws', '<cmd>Telescope lsp_document_symbols<CR>', opts)
  buf_set_keymap('n', '<localleader>wS', '<cmd>Telescope lsp_workspace_symbols<CR>', opts)
  buf_set_keymap('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<localleader>wq', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
end

local servers = {
  "pylsp", "clangd", "hls", "r_language_server",
  "racket_langserver", "clojure_lsp", "tsserver",
  "julials", "rust_analyzer", "purescriptls", "quick_lint_js"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
  }
end
```

And, that's it as I said! I mean, I get all the things I need: diagnostics, goto definition/references

{{% music %}}Midnight Sister • _Satellite_{{% /music %}}

['hrsh7th/nvim-compe']: https://github.com/hrsh7th/nvim-compe
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
['neovim/nvim-lspconfig']: https://github.com/neovim/nvim-lspconfig
