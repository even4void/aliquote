---
title: "Neovim 0.10"
date: 2024-07-03T20:11:23+02:00
draft: false
tags: ["vim"]
categories: ["2024"]
---

[I](/post/lazy-nvim/) [did](/post/vim-revamp-again/) [it](/post/neovim-lsp-easy/) again: I cleaned up unused or defunct stuff in my Neovim config. I have one excuse, though: Since I upgraded to version 0.10, I needed to account for API breaking changes but also to accommodate [all the goodies](https://gpanders.com/blog/whats-new-in-neovim-0.10/), especially regarding LSP & Co.

Neovim gained a builtin commenting system, probably inherited from [mini.nvim](https://github.com/echasnovski/mini.nvim). Since I removed the plugin I was using, I'm glad this is now shipped as a default. The default theme (on the right below) has been redesigned, and it looks great (except for the diff view), but I much prefer the quiet theme (on the left) which removes almost everything and yields a very slick UI, IMO.

{{< fluid_imgs
"pure-u-1-2|/img/2024-07-05-13-34-43.png"
"pure-u-1-2|/img/2024-07-05-13-34-58.png" >}}

Regarding LSP, omnifunc and tagfunc are now automatically set up when attaching an LSP. There are now default mapping to navigate diagnostics and to pop up the diagnostic window. It is also easier to determine the root folder for a project (see `vim.fs.root`). Inlay hints have landed in the 0.10 release (it works great with rust-analyzer and clangd), which means we can show them on demand using a simple mapping:

```lua
if client.supports_method('textDocument/inlayHint') then
  vim.keymap.set("n", "zI", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", {})
end
```

I found [a way](https://www.reddit.com/r/neovim/comments/q6lvsl/lsphelp_simple_script_to_place_a_sign_where_code/) to get ride of [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) using the following snippet:

```lua
function code_action_listener()
  local bufnr = vim.api.nvim_get_current_buf()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = vim.lsp.util.make_range_params()
  local ns_id = vim.api.nvim_create_namespace('code_action')
  local r,c = unpack(vim.api.nvim_win_get_cursor(0))
  local curr = 1
  params.context = context
  local line = params.range.start.line
  vim.lsp.buf_request(bufnr, "textDocument/codeAction", params, function(_, actions, _)
    if not actions or type(actions) ~= "table" or vim.tbl_isempty(actions) then
      vim.api.nvim_buf_del_extmark(bufnr, ns_id, curr)
    else
      vim.api.nvim_buf_del_extmark(bufnr, ns_id, curr)
      vim.api.nvim_buf_set_extmark(bufnr, ns_id, line, -1,
	{id = curr, virt_text = {{"░", "DiagnosticInfo"}}, virt_text_pos = "eol"})
    end
  end)
end

if client.server_capabilities.codeActionProvider then
  vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    group = vim.api.nvim_create_augroup("code_action_sign", { clear = true }),
    callback = function()
      code_action_listener()
    end,
  })

  vim.keymap.set("n", "z=", "<cmd>lua require('fzf-lua').lsp_code_actions({ previewer = 'codeaction' })<cr>")
end
```

This is all great news from people who like to keep their editor free of any IDE fancy things.

As an aside, following my [recent post](/post/scheming-in-vim/), I briefly tried to get used to Conjure but I couldn't find my way with the log buffer. The thing that I will probably miss is the ability to set marks and reevaluate them at will. But to be honest, I reverted back to [molten-nvim](https://github.com/benlubas/molten-nvim) which provides the best compromise between inline evaluation and my full REPL driven (with a terminal opened in a split) workflow. And I like the idea that I can plot almost anything in R, Stata or Python (with plotnine) and get a nice PDF almost instantaneously.

{{% music %}}ANOHNI and the Johnsons • _Epilepsy is Dancing_{{% /music %}}
