+++
title = "Emacs versus Textmate"
description = ""
date = 2010-05-25T11:38:49+01:00
draft = false
tags = ["emacs", "apple"]
categories = []
[[gallery_item]]
album = "1"
image = "20100702203401.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20100702203412.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20100702203450.png"
caption = ""
+++

Yes, it seems like another post about the best editor for the Mac. I spent two months using Textmate as my main editor for various stuff, but mainly tex and R editing. I always used Emacs before, but I decided to give Textmate a try, juste once again. Note that I am using the MacOSized version of Emacs, namely [Aquamacs][Aquamacs].

{{< gallery album="1" >}}

Hereafter, I enumerate useful functionalities that are expected when using a text editor for coding or text editing (I emphasized the conjunction because my own texts mostly are in text or tex mode). For keybinding, I use the convention from Emacs and Textmate communities, where <kbd>M</kbd> means the meta or escape (<kbd>⎋</kbd>) key, <kbd>C</kbd> the control (<kbd>⌃</kbd>) key and <kbd>A</kbd> the alt (<kbd>⌥</kbd>) key.

<table border="0">
<tbody>
<tr>
<td width="20%"><strong>Action</strong></td>
<td width="40%"><strong>Emacs</strong></td>
<td width="40%"><strong>Textmate</strong></td>
</tr>
<tr>
<td>switching buffer/window</td>
<td><code>C-x b</code></td>
<td><code>⌘`</code>/<code>⌘~</code></td>
</tr>
<tr>
<td>filling mode</td>
<td><code>M-Q</code><br /><code>auto-fill-mode</code> or <code>fill-region</code></td>
<td><code>⌃-Q</code></td>
</tr>
<tr>
<td>forward/backward search</td>
<td><code>C-s</code> and <code>C-r</code></td>
<td><code>⌃-s</code> and <code>⌃⇧s</code></td>
</tr>
<tr>
<td>rectangular selection</td>
<td>(1) <code>C-x r r</code>, (2) <code>C-x r k</code>, (3) <code>C-x
r y</code> <br /><code>kill-rectangle</code>, <code>copy-rectangle-to-register</code>, <code>yank-rectangle</code></td>
<td>press <code>⌥</code> while selecting with the mouse</td>
</tr>
<tr>
<td>code folding</td>
<td><code>M-1 C-x $</code><br /> assign to
<code>selective-display</code> the value 1</td> 
<td><code>F1</code> or click the opening or closing arrow in the gutter </td>
</tr>
</tbody>
</table>


[Aquamacs]: http://aquamacs.org
