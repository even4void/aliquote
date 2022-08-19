---
title: "Nyxt V3"
date: 2022-08-19T12:38:06+02:00
draft: true
tags: ["app"]
categories: ["2022"]
---

Two years ago I presented the [Nyxt browser], and how I thought at that time it fit well in my text-oriented workflow. This is still the case, although I had neglected this browser a bit because of big web developments these last twenty months. Now I'm back to it as my daily driver for browsing, using the v3 (pre release), after trying out v2.2.4 for a week or so. I must admit it changes the surfing experience quite a bit, but it's all good. Last time, I only scratched the surface of this wonderful app. Let's go into the details of what I like:

- it's quite fast, and largely less bloated than most other web browsers
- keyboard shortcuts are useful and well thought (both for Vi and Emacs users)
- you can easily jump to headings or opened buffers using dedicated panels, with fuzzy search
-

Vim users get the comfort of modal mappings for free, and the normal mode can be defined for all but editing tasks (input box in web document, status prompt in Nyxt). The Nyxt team even defined some `g` mappings, like in Vim.

As I said in the other post, I can simply `yt` and `yu` to get the title and url of a web page in my primary clipboard. It doesn't look like much but it saves so much copy/paste back and forth between my text editor and the browser. The shorcut `yy` is used to copy (yank in Vim parlance) text, but you can safely add a `C-c` shortcut in addition.

Here is a list of shortcuts I find useful in my daily browsing activities using Nyxt:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Mapping</em></td>
<td><em>Mode</em></td>
<td><em>Command</td>
<td><em>Role</em></td>
</tr>
<tr><td><kbd></kbd></td><td></td><td><kbd></kbd></td><td></td></tr>
</tbody>
</table>
</small>

Nyxt 3 introduced some changes in how we defined our configuration files (`config.lisp` versus `init.lisp`) and how we address some components. You can start with [Artyom Bologov]'s config to get an idea of how it feels to customize Nyxt a bit.

{{% music %}}Kendra Morris • _This Life_{{% /music %}}

[nyxt browser]: /post/nyxt-browser/
[artyom bologov]: https://github.com/aartaka/nyxt-config
