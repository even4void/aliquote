---
title: "Random musings with VS Code"
date: 2021-05-07T08:36:56+02:00
draft: true
tags: ["vim"]
categories: ["2021"]
---

I've be playing with VS Code yesterday, mostly for browsing purpose, not really coding. In fact, I believe I am incompetent at GUIs or IDEs nowadays, but for code browsing VS Code is pretty interesting, if only for inlays hints in Rust or [Gitlens](https://gitlens.amod.io/) to browse Git history. I feel, however, more comfortable with a traditional editor like Emacs or Vim with minimal addons. There's a [Vim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) for VS Code, which I use, but it looks like Vim shortcuts don't apply everywhere in the app window. For instance, if you are viewing the keybindings cheatsheet (the one that comes with interactive search), then you're back to non modal keybindings. Also, ex and visual interaction do not feel as fast and natural as they are in Vim or Neovim, or even Doom Emacs.

I installed only a few extensions, mostly for Haskell, Rust, Python and C. In the case of Rust, I learnt that you must choose between the official rust-lang extension or rust-analyzer, otherwise you get a warning that they may clash at some point. My impression is that rust-analyzer is slower with VS Code compared to Neovim (with [Ale](https://github.com/dense-analysis/ale)) on the same codebase. There was nothing special about Haskell that I didn't already get in Neovim, and the same applies for Python. I just spent half an hour adding shortcuts for the LSP features I use the most, namely Hover on symbol, Go to Definition, Go to References, and Rename.

But, first, I needed to set up a decent color scheme. I'm quite happy with the minimalism of Tonsky's [Alabaster](https://github.com/tonsky/vscode-theme-alabaster) theme, but I wanted an even more minimalistic syntax highlighting scheme, comparable to what I have in Vim. This is now almost done, but what a mess! While in Vim it is enough to write a single line `Hi Comment ctermfg=103`, this becomes

```json
"editor.tokenColorCustomizations": {
  "[Alabaster]": {
    "comments": "#8787af",
    ...
}
```

Even more, if you want comments to be italicized, then you have to add:

```json
"textMateRules": [
{
   "scope": "comment",
   "settings": {
   "fontStyle": "italic"
   }
}
```

And things go on and go on for every particular aspect of a programming language. For instance, Haskell has many different scopes like `constant`, `storage.type`, `entity.name.namespace`, `keyword.other.newtype`, etc. The same applies to Python or Rust, of course, which means that you end up with a long list of custom "TextMate rules", in JSON because why not. I wish there was a simpler way to apply custom syntax rules right from the Scope inspector in VS Code.

I use the Vim extension because I don't like standard key mappings in VS Code (or any other GUI application really). Of course, there are some conflicts with built-in shortcuts like `Ctrl+B` which is used to open/close the explorer tree in VS Code, while it has a different purpose in Vim. Henceforth, you need remapping. Remapping is different if this is about standard shortcuts or a specific extension. Here is what we have to do with standard keybindings in `keybindings.json`:


```json
[
  {
    "key": "ctrl+h",
    "command": "workbench.action.navigateLeft"
  },
  ...
]
```

However, in the case of the Vim extension, this becomes:


```json
"vim.normalModeKeyBindingsNonRecursive": [
...
{
  "before": [
  "<ctrl>",
  "b"
  ],
  "after": [],
  "commands": [
  "workbench.view.explorer",
  ]
},
...
```

Lovely. And this goes in `settings.json`, not `keybindings.json` by the way!
