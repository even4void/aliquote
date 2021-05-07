---
title: "Random musings with VS Code"
date: 2021-05-07T08:36:56+02:00
draft: false
tags: ["vim"]
categories: ["2021"]
---

It's been almost a year since I switched to Vim for writing prose and code on my computer. I understand modal editing a lot more than I did last time I discussed [Evil on Emacs](/post/editor-war/), and I feel comfortable using Neovim everyday, for everything related to text. I use few plugins in order to keep close to builtin stuff and because I don't really need much more. As I am more and more interested in Haskell and Rust, I tested their LSP backends as driven by [Ale](https://github.com/dense-analysis/ale). I'm pretty okay with that setup because Ale is not intrusive at all, especially given the way I configured it (minimal error/warning signs in the gutter, delayed auto-completion so that I can complete myself before the completion list pop up if I need it, a few handy keybindings). I know Neovim 0.5+ comes up with a builtin LSP backend, but this setup suits me for the moment.

I've be playing with VS Code yesterday, mostly for browsing purpose, not really coding. In fact, I believe I am incompetent at GUIs or IDEs nowadays, but for code browsing VS Code is pretty interesting, if only for inlays hints in Rust[^1] or [Gitlens](https://gitlens.amod.io/) to browse Git history. I feel, however, more comfortable with a traditional editor like Emacs or Vim with minimal addons, as I always said. I should note that there's a [Vim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) for VS Code. I use it, but it looks like Vim shortcuts don't apply everywhere in the app window. For instance, if you are viewing the keybindings cheatsheet (the one that comes with interactive search), then you're back to non modal keybindings. Also, ex and visual interaction do not feel as fast and natural as they are in Vim or Neovim, or even Doom Emacs. Above all, VS Code is mostly a mouse-oriented text editor. I have nothing against using a mouse, this is just that I don't feel I really need it when I'm writing on a computer. I never used anything other than builtin touchpad on my laptop, and the one I have on the Latitude 7310 isn't that great, to be honest. That being said, the point is that if I can do everything I want by using simple shortcuts, why using a mouse? Whether the keyboard is faster than the mouse is yet [another story](https://danluu.com/keyboard-v-mouse/).

About VS Code, I installed only a few extensions, mostly for Haskell, Rust, Python and C. In the case of Rust, I learnt that you must choose between the official [rust-lang](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust) or [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) extension, otherwise you get a warning that they may clash at some point. My impression is that rust-analyzer is slower with VS Code compared to Neovim on the same codebase, but that may just be me. There was nothing special about Haskell that I didn't already get in Neovim, and the same applies for Python. I just spent half an hour adding shortcuts for the LSP features I use the most, namely Hover on symbol, Go to Definition, Go to References, and Rename.

I also needed to set up a decent color scheme. I'm quite happy with the minimalism of Tonsky's [Alabaster](https://github.com/tonsky/vscode-theme-alabaster) theme, but I wanted an even more minimalistic syntax highlighting scheme, comparable to what I use in Vim, and in Emacs beforehand. This is now almost done, but what a mess! While in Vim it is enough to write a single line `Hi Comment ctermfg=103`, this becomes

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

As I said above, I use the Vim extension because I don't like standard key mappings in VS Code (or any other GUI application really). Of course, there are some conflicts with built-in shortcuts like `Ctrl+B` which is used to open/close the explorer tree in VS Code, while it has a different purpose in Vim. Henceforth, you need remapping. Remapping is different if this is about standard shortcuts or a specific extension. Here is what we have to do with standard keybindings in `keybindings.json`:


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

Lovely. And this goes in `settings.json`, not `keybindings.json` by the way! Lastly, it was time to get rid of the activity bar, the explorer tree, and the tab bar.

![VSCode](/img/2021-05-07-19-14-17.png)

Anyway, I believe VS Code is a great asset, midway between a feature-complete mouse+keyboard-driven text editor and a minimalistic IDE. Clearly, it has gained so much attention in the past 5 years or so that it's hard to imagine someone looking for a good text editor for coding who end up using Notepad+, GEdit, or Kate. And it's surely the perfect tool for the big hearing of web devs (business is business). However, I like Vim (or Emacs) better for it allows me to stay focus on the text I write.


[^1]: Note that this is also available when using Emacs with [LSP mode](https://emacs-lsp.github.io/lsp-mode/).
