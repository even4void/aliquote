---
title: "Neovim and LSP (3/n)"
date: 2021-07-27T20:19:08+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/vim-shortcuts/) in this series<br>
» [Next post](/post/neovim-useful-plugins/) in this series

Next in this series on using a modern Neovim setup, let's talk about the built-in Language Server Protocol (LSP) facilities.

There was a time where a dedicated package did exist for every new language you wanted to use, whether it be Emacs or Vim. For instance, [Intero](https://chrisdone.github.io/intero/) has long been the de facto standard for Haskell in Emacs (there was also a port to Vim, IIRC), while [Slime](https://common-lisp.net/project/slime/) probably still remains the only one true package for dealing with Common Lisp in Emacs. Times are changing since Microsoft invested the scene of code editors with their flagship product, VS Code, and now we get the Language Server Protocol which allows communicating in a standardized manner signals emitted by a running process (e.g., a linter) to an editor. Emacs, (Neo)Vim, Sublime Text, IntelliJ all have plugins for interacting with existing servers in Python, Clang, Clojure, R, or Julia to name a few. Often times there are many implementations available on the language side. For instance, Python has [python-lsp-server](https://github.com/python-lsp/python-lsp-server) (as a replacement of [pyls](https://github.com/palantir/python-language-server)), [pyright](https://github.com/Microsoft/pyright) (which requires Node), [jedi-language-server](https://github.com/pappasam/jedi-language-server), and others that I forgot about. Regarding Python, Microsoft developed on its side [pylance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance), as an enhanced version of pyright (in fact it relies on pyright with additional server capabilities, it's just that it is not released as an easy install for other code editors).

I have long been happy with [ALE](https://github.com/dense-analysis/ale), as discussed in my [other](/post/getting-into-neovim/) [posts](/post/vim-and-lsp/), since it provides an easy and intuitive way to add one or more linters and fixers to a language (filetype in Vim parlance), but also provides access to LSP settings: Go to definition or references, rename, help on hover, etc. Regarding linters, there is also [Neomake]() but I always found ALE setup easier. And it gave me go to references and go to definitions, although the go to references results were not displayed in a quickfix window. The advantage of ALE is that you can configure as many linters and fixers as you want, they will be executed one after the other in an async manner. When using Neovim built-in LSP, you are apparently tight to the linters that come with the server itself, and you must rely on another plugin to add additional linters if you need more.

My new LSP setup is provided below. I use the following packages: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [nvim-compe](https://github.com/hrsh7th/nvim-compe), [lsp-trouble.nvim](https://github.com/folke/lsp-trouble.nvim).

```lua
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
		underline = true,
		signs = true,
    update_in_insert = false
	}
)

local signs = {Error = "▮", Warning = "▮", Hint = "▯", Information = "▯"}

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

  buf_set_keymap("n", "<localleader>w=", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<CR>", opts)
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
            parameter_hints_prefix = "» ",
            other_hints_prefix = "« "
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

It works quite well in practice, especially for Rust, Haskell and Python. When I first drafted this blog post, it was not working so great for Python buffers. I needed to read on to understand why it doesn't use [mypy](https://github.com/Richardk2n/mypy-ls) or [memestra](https://github.com/QuantStack/pyls-memestra) (and isort, etc.) altogether right out of the box. Upon inspecting LSP log, it happens the bug is probably caused by memestra.[^1]

![img](/img/2021-07-22-10-57-32.png)

For the time being, I use [formatter.nvim](https://github.com/mhartington/formatter.nvim) as a fixer to format on save. I ended up configuring both black and isort for Python buffers. It's quite easy, since you only to pass two functions for Python filetype, it's just that it looks a bit more verbose than other plugin like ALE or [Neoformat](https://github.com/sbdchd/neoformat). Moreover, my `,w=` mapping (which calls Lua's `vim.lsp.buf.formatting_sync(nil, 100)` under the hood) can be used to format on line. I don't want to use ALE after disabling its LSP functionalities, since it's apparently possible to manage everything from within `lspconfig`. I should note, however, that [diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver) may be a [better option](https://github.com/neovim/nvim-lspconfig/issues/903#issuecomment-843820972).

Note that this is a temporary setup, while I'm getting familiar with the LSP ecosystem in Neovim. I keep trying plugins here and there to see how best to enhance the LSP experience while keeping a minimal setup and without impairing Neovim startup time. The very first time, I added [lspsaga](https://github.com/glepnir/lspsaga.nvim) to my set of plugins, but I didn't like it very much.

Finally, not all (Neo)Vim theme provide correct highlighting groups for LSP diagnostics. However, it is quite easy to manually update the theme you use or to add the following settings after your `colorscheme whatever` statement, see also [lsp-colors](https://github.com/folke/lsp-colors.nvim) plugin:

```lua
hi link LspDiagnosticsDefaultError ErrorMsg
hi link LspDiagnosticsDefaultWarning WarningMsg
hi link LspDiagnosticsDefaultInformation InfoMsg
hi link LspDiagnosticsDefaultHint InfoMsg
hi link LspDiagnosticsVirtualTextError ErrorMsg
hi link LspDiagnosticsVirtualTextWarning WarningMsg
hi link LspDiagnosticsVirtualTextInformation InfoMsg
hi link LspDiagnosticsVirtualTextHint InfoMsg
```

{{% alert note %}}
<small>[2021-08-06]</small><br>
I removed `lsp-trouble.nvim` since I don't find any added value for my own usage of LSP diagnostics. I am happy with using the Quickfix window, which `nvim_lsp` can populate for me, and that use for other purpose (make, grep) anyway. Likewise, I think I don't really need `rust-tools.nvim`: Inlay hints are available via [lsp_extensions.nvim](https://github.com/nvim-lua/lsp_extensions.nvim), and that's all what I was interested in. I will discuss all of these choices in a wrap-up post later on. Let's keep it simple, with less than 15 plugins (14 plugins at the time of this writing) and [100 ms](https://www.pubnub.com/blog/how-fast-is-realtime-human-perception-and-technology/) of startup time (70-85 ms at the moment). You know, those magic numbers, like [7 ± 2](https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two), and the like...
{{% /alert %}}

[^1]: Probably something that goes along what [Chris Siebenmann](https://utcc.utoronto.ca/~cks/space/blog/python/PythonPylspNotes) noticed in his case: Memestra attempts to make a directory under sys.prefix, which is owned by root if you're running the system CPython or PyPy.
