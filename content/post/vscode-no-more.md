---
title: "No more VS Code"
date: 2022-02-03T10:23:13+01:00
draft: true
tags: ["vim"]
categories: ["2022"]
---

I think I reinstalled [VS Code] on my laptop one or two years ago. Since then, I never used it, and I found myself only updating the application and the limited set of extensions I installed alongside for one year long without even touching it. In fact, I was mostly interested in Language Server add-ons, but now that Neovim builtin LSP is quite stabilized, I believe I no longer need to check whether it works as expected (i.e., as it is expected to behave in VS Code or IntelliJ). In fact, I have everything at hand under Neovim, and it sparks joy.

I have a long [series of posts] about how I configured Neovim during last summer. Most of those settings are still relevant today, but I added a few packages, including debugging capabilities, $\TeX$ (see [Texing in Vim]) and Org (see [Org in Vim]) stuff, etc. Regarding LSP, I added specifically the following packages:

- [nvim-lightbulb], because I wanted to have some idea of where code action were available. Since I don't like intrusive help or notification, I choose to show them only for the current line thanks to an `autocommand`.
- [lsp_extensions.nvim], only to display inlay for Rust code.
- [lsp_codelens_extensions.nvim], to get pretty code lens actions right to a Rust test `fn` or for inline Haskell snippets.
- [nvim-dap], [nvim-dap-ui], [nvim-dap-virtual-text], for debugging. I only trigger `dap` UI on demand, but I have virtual text activated automagically when I started a debugging session. I use it mostly for Python scripts. As an update to a [previous micro-post], I even get this working for Haskell.
- [neogen], because everyone likes `docstrings`.




{{% music %}}Memory Cassett • _Asleep at a Party_{{% /music %}}

[VS Code]: /post/vscode-yet-again/
[series of posts]: /post/modern-neovim/
[Texing in Vim]: /post/texing-in-vim/
[Org in Vim]: /post/org-in-vim/
[nvim-lightbulb]: https://github.com/kosayoda/nvim-lightbulb
[lsp_extensions.nvim]: https://github.com/nvim-lua/lsp_extensions.nvim
[lsp_codelens_extensions.nvim]: https://github.com/ericpubu/lsp_codelens_extensions.nvim
[nvim-dap]: https://github.com/mfussenegger/nvim-dap
[nvim-dap-ui]: https://github.com/rcarriga/nvim-dap-ui
[nvim-dap-virtual-text]: https://github.com/theHamsta/nvim-dap-virtual-text
[previous micro-post]: /micro/2022-01-28-18-09-39/
[neogen]: https://github.com/danymat/neogen
