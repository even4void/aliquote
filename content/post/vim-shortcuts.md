---
title: "Custom Vim shortcuts (2/n)"
date: 2021-07-25T21:50:09+02:00
draft: true
tags: ["vim"]
categories: ["2021"]
---

« [Previous post](/post/modern-neovim/) in this series

Here is a list of the personal shortcuts I use the most in Vim. Nothing special, but feel free to copy/paste in case you find anything useful for your own workflow. Of note, I've read so much posts on remapping everything to Vim's hjkl hot keys that I got tired of it, really. I use the hjkl keys when I think I'll need to repeat a command, otherwise we just have plain old arrow keys, right? Likewise, in Tmux, the arrow keys allow to switch to any pane easily. Arrow keys are mapped in many applications as well, whether it be Firefox, iTerm, Gnome terminal, Kitty, etc. Even in Vim you can use arrow keys with <C-w> to navigate along the way. Home row, you said? Come on, the arrows are just below, on your right -- not so far away in fact. But let's go to the point.

Of course, I realize this is all subjective and it really depends on your needs and what you expect from your text editor. I for one consider my text editor as a helping hand: When I need to perform an action, give me the means to do it quickly or efficiently; I have poor abstract memory but if I repeat the same action a sufficient amount of time it will become muscle memory; I want it to correct my misspellings and fix my code formatting automagically, and sometimes -- sometimes only -- suggest better alternatives to what I wrote (mostly code, not prose). Above all, my text editor must be as fast lightning. I don't need sugar candy app, or fancy editors that look like [Christmas trees](https://arxiv.org/abs/2008.06030v2) with everything highlighted here and there. I don't really care about the color theme as long as it's not everywhere unnecessarily. My current color scheme in Vim is deliberately refined to just highlight intentional comments (which must be emphasized), keywords and constants -- and that's all good. I talked about those choices [earlier on](/post/monochrome-color-scheme/).

> Alabaster highlights comments. Most themes try to dim comments by using low-contrast greys. I think if code was complex enough that it deserved an explanation then it’s that explanation we should see and read first. It would be a crime to hide it. --- Nikita Prokopov (tonsky)

Snippets were fun a while ago, but I don't like them anymore. Most of the snippet-based packages are probably inspired by the great Textmate app, which I [used](/post/emacs-versus-textmate/) [to use](/post/textmate2/) a while back. I'm not a robot, I can write, slowly but I like it nevertheless -- I mean, to write, not slowly. Errors are so much instructive and rewarding, and snippets do not cover every user cases, unfortunately. Likewise, autocompletion is great, but only when I need it. Most of the time I know what I want to write and I don't need a popup window to show complete options. This is why I do not use snippets and set a high time value for autocompletion suggestion.

And here we go with my collection of personal shortcuts. These are Vim mappings, mostly for normal mode, so please adapt to your personal settings:

<table border="0">
<tbody>
<tr>
<td><em>Keys</em></td>
<td><em>Description</em></td>
</tr>
<tr><td><code>,x</code></td><td>close current buffer</td></tr>
<tr><td><code>,esc</code></td><td>hide other buffers (<code>:only</code>)</td></tr>
<tr><td><code>␣x</code></td><td>close quickfix, loclist or Trouble window</td></tr>
<tr><td><code>␣e</code></td><td>open files from current working directory (not necessarily root)</td></tr>
<tr><td><code>␣E</code></td><td>open in new tab files from current working directory (not necessarily root)</td></tr>
<tr><td><code>␣f</code></td><td>find files in current working directory (root)</td></tr>
<tr><td><code>tab</code></td><td>switch to next tab (cycle)</td></tr>
<tr><td><code>␣tab</code></td><td>create a new tab</td></tr>
<tr><td><code>␣$</code></td><td>open a terminal in a new tab</td></tr>
<tr><td><code>C-j</code></td><td>go to next quickfix item (also <code>]q</code>)</td></tr>
<tr><td><code>C-k</code></td><td>go to previous quickfix item (also <code>[q</code>)</td></tr>
<tr><td><code>,s</code></td><td>sort current paragraph in lexicographic order (<code>vip:sort u<CR></code>, thanks <a href="https://strager.net/essays.html">strager</a>!)</td></tr>
<tr><td><code>zs</code></td><td>fix misspelled word using first suggested entry (<code>1z=</code>)</td></tr>
<tr><td><code>␣d</code></td><td>switch dictionary (custom autoload function to alternate between FR and EN dicts)</td></tr>
</tbody>
</table>

That's it, not a big deal. I tend to use built-in shortcuts a lot because I learned the hard way that most often than not, default settings are good.

In Vim, my leader key is `<space>` (`␣`) and my localleaderkey key is `,`. I tend to use the leader key for installed plugins, while the localleader is used for custom settings or to remap commands I use a lot. Of note, my CAPS lock key is remapped system-wide to <Esc> (so `,<esc>` is equivalent to `,<caps>` to hide all other buffers in split view). As I said these mappings are mostly for normal mode. I only use `<C-e>` and `<C-a>` in normal and command mode, because these shortcuts are wired in my hands because readline's everywhere. I tend to use the same mapping in lower and upper case for related tasks. I recently replaced all my Fzf setup with [Telescope](https://github.com/nvim-telescope/telescope.nvim) (see my [previous post](/posts/modern-neovim/). I prefer to use the quickfix window rather than the loclist or Telescope for specific task, but I can display the quickfix list in Telescope as well. My complete Telescope mappings are shown below:

```lua
utils.map('n', '<leader><leader>', '<cmd>Telescope buffers<CR>')
utils.map('n', '<leader>!', '<cmd>Telescope commands<CR>')
utils.map('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
utils.map('n', '<leader>.', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<leader>*', '<cmd>Telescope grep_string<CR>')
utils.map('n', '<leader>:', '<cmd>Telescope command_history<CR>')
utils.map('n', '<leader>f', '<cmd>Telescope find_files<CR>')
utils.map('n', '<leader>G', '<cmd>Telescope git_commits<CR>')
utils.map('n', '<leader>g', '<cmd>Telescope git_status<CR>')
utils.map('n', '<leader>h', '<cmd>Telescope help_tags<CR>')
utils.map('n', '<leader>q', '<cmd>Telescope quickfix<CR>')
utils.map('n', '<leader>r', '<cmd>Telescope oldfiles<CR>')
utils.map('n', '<leader>w', '<cmd>Telescope treesitter<CR>')
```

