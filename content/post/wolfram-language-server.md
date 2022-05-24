---
title: "Wolfram Language Server"
date: 2022-05-24T12:07:17+02:00
draft: false
tags: ["mathematica", "vim"]
categories: ["2022"]
---

Today I learned that Mathematica 13.0 ships with a builtin language server. There are actually two VS Code plugins that provide client-side code for Wolfram LSP: [lsp-wl] and the official [wolfram] extension.

I first tried to configure lsp-wl with Neovim builtin lspconfig, using a custom server config. Neither of wolframscript or netcat proved to work in this case. However, I got something close to what we have in VS Code with the official extension using the following setup:

```lua
local nvim_lsp = require("lspconfig")
local configs = require("lspconfig.configs")

configs.lsp_wl = {
  default_config = {
    cmd = {
      "wolfram",
      "kernel",
      "-noinit",
      "-noprompt",
      "-nopaclet",
      "-noicon",
      "-nostartuppaclets",
      "-run",
      'Needs["LSPServer`"];LSPServer`StartServer[]',
    },
    filetypes = { "mma", "wl" },
    root_dir = nvim_lsp.util.path.dirname,
  },
}

nvim_lsp.lsp_wl.setup({ on_attach = lsp_attach({}) })
```

<small>The `lsp_attach` function does take care of formatting on save, completion and common key mappings across LSPs.</small>

I mostly use the `mma` filetype because I rely on [mash] for batch processing Mathematica code in Org document, as described in [a minimal Org setup to write scientific notebooks].[^1]

I still have to manage how to get omnifunc completion working, but for the moment I have hover information, diagnostics and formatting.

{{< fluid_imgs
"pure-u-1-2|/img/2022-05-24-11-38-26.png"
"pure-u-1-2|/img/2022-05-24-13-37-00.png" >}}

{{% music %}}Heather Nova • _Heal_{{% /music %}}

[^1]: This also seems to work with [iron.nvim], at least as well as with wolframscript when I last tried.

[lsp-wl]: https://github.com/kenkangxgwe/vscode-lsp-wl
[wolfram]: https://github.com/WolframResearch/vscode-wolfram
[mash]: http://ai.eecs.umich.edu/people/dreeves/mash/
[a minimal org setup to write scientific notebooks]: https://www.aliquote.org/articles/notebooks/org-setup.pdf
[iron.nvim]: https://github.com/hkupty/iron.nvim
