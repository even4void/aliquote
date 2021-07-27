---
title: "Neovim and LSP (3/n)"
date: 2021-07-27T20:19:08+02:00
draft: true
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/vim-shortcuts/) in this series

There was a time where a dedicated package did exist for every new language you wanted to use, whether it be Emacs or Vim. For instance, Intero has long been the de facto standard for Haskell in Emacs (there was also a port to Vim, IIRC), while Slime probably still remains the only one true package for dealing with Common Lisp in Emacs. Times are changing since Microsoft invested the scene of code editors with their flagship product, VS Code, and now we get the Language Server Protocol which allows communicating in a standardized manner signals emitted by a running process (e.g., a linter) to an editor. Emacs, (Neo)Vim, Sublime Text, IntelliJ all have plugins for interacting with existing servers in Python, Clang, Clojure, R, or Julia to name a few. Often times there are many implementations available on the language side. For instance, Python has python-language-server (as a replacement of pylsp), pyright (which requires Node), jedi-lsp, and others that I forgot about. Regarding Python, Microsoft devloped on its side pylance, as an enhanced version of pyright (in fact it relies on pyright, it's just that it is not released as an easy install for other code editors).

I have long been happy with ALE, as discussed in my [other](/post/getting-into-neovim/) [posts](/post/vim-and-lsp/), since it provides an easy and intuitive way to add one or more linters and fixers to a language (fileype in Vim parlance), but also provides access to LSP settings: Go to definition or refrences, rename, help on hover, etc.

My new LSP setup is provided below. I use the following packages: 'neovim/nvim-lspconfig', 'hrsh7th/nvim-compe', 'folke/lsp-trouble.nvim'.

```lua
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
		underline = true,
		signs = true,
    update_in_insert = false
	}
)

local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap("n", "<localleader>w=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<localleader>wd', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<localleader>ww', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', opts)
  buf_set_keymap('n', '<localleader>wW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

end

local servers = {"pylsp", "clangd", "hls", "r_language_server", "racket_langserver", "clojure_lsp", "tsserver", "julials"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
  }
end

-- rust-tools
require('rust-tools').setup {
    tools = {
        autoSetHints = false,
        hover_with_actions = false,
        runnables = {use_telescope = false},
        inlay_hints = {
            parameter_hints_prefix = "▮ ",
            other_hints_prefix = "▯ "
        },
        hover_actions = {auto_focus = false}
    },
    server = {
      on_attach = on_attach,
      flags = {debounce_text_changes = 150}
    }
}

-- trouble
require("trouble").setup {
    height = 7,
    icons = false,
    mode = "lsp_workspace_diagnostics",
    fold_open = "v",
    fold_closed = ">",
    auto_open = false,
    auto_close = true,
    auto_preview = true,
    auto_fold = true,
    use_lsp_diagnostic_signs = true
}
```

