---
title: "Neovim and LSP made easy"
date: 2023-10-27T18:02:14+02:00
draft: false
tags: ["vim"]
categories: ["2023"]
---

Continuing the rewrite of my Neovim config described in [this post](/post/vim-revamp-again/), I decided to get ride of [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig). Indeed, since version 0.8 Neovim offers some convenient functions and autocommands to start an LSP server with predefined mappings which can be made aware of available server capabilities. This is well explained by [Mathias Fußenegger](https://zignar.net/2022/10/01/new-lsp-features-in-neovim-08/). I came across his post some months ago and forgot about it. And then I found a similar discussion on another [blog post](https://f1sty.github.io/neovim/nvim/lsp/language-server/config/dotfiles/completion/2023/09/10/simple-nvim-lsp-setup.html). So why not remove nvim-lspconfig and define LSP settings in my ftplugin directory. This way, I get all vimL stuff in after/ftplugin, with appropriate guards for nvim and executable that I use for linting and formatting, and all Lua stuff in my init.lua and ftplugin.

This solved many problems at the same time. First, nvim-lspconfig doesn't let me loop over a series of server so easily. For instance, the following loop must account for specific servers that need additional settings (e.g., clangd to get background indexing, etc.) or slight modification from the default config (e.g., racket_langserver which is defined for racket and scheme filetype -- we really don't want the second one):

```lua
local servers = {
  ...
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = on_attach(),
    capabilities = capabilities,
  })
end
```

Second, there are some edge cases, which I think are related to the definition of the project root directory for LSP that really need a `root_dir` (e.g., clojure_lsp), meaning that the server will start if I open a file with the associated filetype directly but not after a simple `vim .` from the root directory. On the other hand, nvim-lspconfig provides some interesting functions to define the root directory of a project (pending the minor issue just mentioned) or to query the server state, and to restart it if required.

So, how does the in-built facilities of Neovim solve my concerns? I can now isolate the logic of writing specific settings for each LSP in separate files that live in ftplugin, while defining common guarded features relevant to all LSPs. Here is a simple example in the case of Python (I use pyright in this case):

```lua
-- ftplugin/python.lua
local config = {
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = vim.fs.dirname(
    vim.fs.find({ "setup.py", "pyproject.toml", "setup.cfg", "requirements.txt", ".git" }, { upward = true })[1]
  ),
}

vim.lsp.start(config, {
  reuse_client = function(client, conf)
    return (
      client.name == conf.name
      and (
        client.config.root_dir == conf.root_dir
        or (conf.root_dir == nil and vim.startswith(api.nvim_buf_get_name(0), "/usr/lib/python"))
      )
    )
  end,
})

local augroup = vim.api.nvim_create_augroup("PythonFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd({ "BufWritePre " }, {
  group = augroup,
  buffer = bufnr,
  callback = function()
    vim.api.nvim_command("call FormatFile()")
  end,
})
```

The last block allow to complement pyright with autoformatting thanks to a custom VimL function, inspired from [this post](https://phelipetls.github.io/posts/code-formatting-vim/), that checks the value of `formatprg` associated with that filetype. This is defined in `after/ftplugin`, which further allows me to use `gq` whenever I want.

```vim
" after/ftplugin/python.vim
setlocal formatprg=python3\ -m\ macchiato
" setlocal formatprg=black\ -q\ 2>/dev/null\ --stdin-filename\ %\ -
```

Then I defined mappings and an autocommand in my `init.lua` file:

```lua
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = args.buf })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions({ jump_to_single_result = true })<cr>")
    vim.keymap.set("n", "gr", "<cmd>lua require('fzf-lua').lsp_references()<cr>")
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set("n", "z=", "<cmd>lua require('fzf-lua').lsp_code_actions()<cr>")
    end
    if client.server_capabilities.renameProvider then
      vim.keymap.set("n", "zr", vim.lsp.buf.rename, { buffer = args.buf })
    end
    if client.server_capabilities.documentSymbolProvider  then
      vim.keymap.set("n", "go", "<cmd>lua require('fzf-lua').lsp_document_symbols()<cr>")
    end
    if client.server_capabilities.workspaceSymbolProvider then
      vim.keymap.set("n", "gO", "<cmd>lua require('fzf-lua').lsp_workspace_symbols()<cr>")
    end
    if client.server_capabilities.codeLensProvider then
      vim.api.nvim_create_autocmd({ "CursorMoved " }, {
        callback = function()
          vim.lsp.codelens.refresh()
	end,
      })
      vim.keymap.set("n", "z!", vim.lsp.codelens.run, { buffer = args.buf, silent = true })
    end
    if client.supports_method("textDocument/formatting") then
      -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function() vim.lsp.buf.format() end)
      vim.keymap.set("n", "g=", vim.lsp.buf.format, { buffer = args.buf })
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd({ "BufWritePre " }, {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
```

Note that I use [fzf-lua](https://github.com/ibhagwan/fzf-lua) as a fuzzy picker for many things in this case.

Needless to say, my Neovim [starts even faster now](/micro/2023-10-26-21-18-02/).

{{% music %}}Editors • _Like Treasure_{{% /music %}}
