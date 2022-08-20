---
title: "Nyxt V3"
date: 2022-08-20T12:38:06+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

Two years ago I presented the [Nyxt browser], and how I thought at that time it fit well in my text-oriented workflow. This is still the case, although I had neglected this browser a bit because of big web developments these last twenty months. Now I'm back to it as my daily driver for browsing, using the v3 (pre release), after trying out v2.2.4 for a week or so. I must admit it changes the surfing experience quite a bit, but it's all good.

![img](/img/2022-08-19-20-54-32.png)

Last time, I only scratched the surface of this wonderful app. Let's go into the details of what I like:

- it's quite fast, and largely less bloated than most other web browsers
- keyboard shortcuts are useful and well thought (both for Vi and Emacs users)
- you can easily jump to headings or opened buffers using dedicated panels, with fuzzy search
- if you're a Lisp user, you also get an REPL for free (I didn't try it, though)
- fuzzy search is available for almost everything (switching buffer, history, commands)

Vim users will get the comfort of modal mappings for free, and the normal mode can be defined for all but text input (e.g., input box in web document, status prompt in Nyxt). The Nyxt team even defined some `g` mappings, like in Vim. As I said in the other post, I can simply `yt` and `yu` to get the title and URL of a web page in my primary clipboard. It doesn't look like much but it saves so much copy/paste back and forth between my text editor and the browser. The shortcut `yy` is used to copy (yank in Vim parlance) text, but you can safely add a `C-c` shortcut in addition.

{{< fluid_imgs
  "pure-u-1-2|/img/2022-08-19-20-54-47.png"
  "pure-u-1-2|/img/2022-08-19-20-55-06.png" >}}

Here is a list of shortcuts I use in my daily browsing activities using Nyxt:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Mapping</em></td>
<td><em>Mode</em></td>
<td><em>Command</td>
<td><em>Role</em></td>
</tr>
<tr><td><kbd>C-=</kbd>*</td><td><kbd>buffer-listing-mode</kbd></td><td><kbd>buffers-panel</kbd></td><td>list all buffers in a separate buffer</td></tr>
<tr><td><kbd>C-h</kbd>*</td><td><kbd>history-mode</kbd></td><td><kbd>list-history</kbd></td><td>list history in a separate buffer</td></tr>
<tr><td><kbd>H</kbd></td><td><kbd>history-mode</kbd></td><td><kbd>history-backwards</kbd></td><td>go backward in history</td></tr>
<tr><td><kbd>L</kbd></td><td><kbd>history-mode</kbd></td><td><kbd>history-forwards</kbd></td><td>go forward in history</td></tr>
<tr><td><kbd>f</kbd></td><td><kbd>hint-mode</kbd></td><td><kbd>follow-hint</kbd></td><td>prompt for hint and follow in current buffer</td></tr>
<tr><td><kbd>F</kbd></td><td><kbd>hint-mode</kbd></td><td><kbd>follow-hint-new-buffer-focus</kbd></td><td>prompt for hint and follow in new buffer</td></tr>
<tr><td><kbd>/</kbd></td><td><kbd>search-buffer-mode</kbd></td><td><kbd>search-buffer</kbd></td><td>search in current buffer</td></tr>
<tr><td><kbd>C-j</kbd></td><td><kbd>download-mode</kbd></td><td><kbd>list-downloads</kbd></td><td>show all dowload in a separate buffer</td></tr>
<tr><td><kbd>+</kbd></td><td><kbd>document-mode</kbd></td><td><kbd>zoom-page</kbd></td><td>zoom in</td></tr>
<tr><td><kbd>-</kbd></td><td><kbd>document-mode</kbd></td><td><kbd>unzoom-page</kbd></td><td>zoom out</td></tr>
<tr><td><kbd>C-d</kbd>*</td><td><kbd>document-mode</kbd></td><td><kbd>scroll-page-down</kbd></td><td>scroll down (one page height)</td></tr>
<tr><td><kbd>C-u</kbd>*</td><td><kbd>document-mode</kbd></td><td><kbd>scroll-page-up</kbd></td><td>scroll up (one page height)</td></tr>
<tr><td><kbd>gh</kbd></td><td><kbd>document-mode</kbd></td><td><kbd>jump-to-heading</kbd></td><td>jump to a given heading (H1, H2, etc.)</td></tr>
<tr><td><kbd>}</kbd></td><td><kbd>document-mode</kbd></td><td><kbd>next-heading</kbd></td><td>jump to next heading</td></tr>
<tr><td><kbd>{</kbd></td><td><kbd>document-mode</kbd></td><td><kbd>previous-heading</kbd></td><td>jump to previous heading</td></tr>
<tr><td><kbd>C-c</kbd>*</td><td><kbd>document-mode</kbd></td><td><kbd>copy</kbd></td><td>copy highlighted text to clipboard</td></tr>
<tr><td><kbd>o</kbd></td><td></td><td><kbd>set-url</kbd></td><td>open URL in current buffer</td></tr>
<tr><td><kbd>O</kbd></td><td></td><td><kbd>set-url-new-buffer</kbd></td><td>open URL in new buffer</td></tr>
<tr><td><kbd>D</kbd></td><td></td><td><kbd>delete-current-buffer</kbd></td><td>close buffer</td></tr>
<tr><td><kbd>R</kbd></td><td></td><td><kbd>reload-current-buffer</kbd></td><td>reload page</td></tr>
<tr><td><kbd>yt</kbd></td><td></td><td><kbd>copy-title</kbd></td><td>save page title to clipboard</td></tr>
<tr><td><kbd>yu</kbd></td><td></td><td><kbd>copy-url</kbd></td><td>save URL to clipboard</td></tr>
<tr><td><kbd>gb</kbd></td><td></td><td><kbd>switch-buffer</kbd></td><td>switch buffer using fuzzy completion</td></tr>
<tr><td><kbd>]</kbd></td><td></td><td><kbd>switch-buffer-next</kbd></td><td>switch to next buffer</td></tr>
<tr><td><kbd>[</kbd></td><td></td><td><kbd>switch-buffer-previous</kbd></td><td>switch to previous buffer</td></tr>
</tbody>
</table>
</small>

In addition to the above mappings where custom mappings are highlighted using an asterisk, I also use a custom shortcut (<kbd>C-o</kbd>) to open the current buffer in Firefox:

```lisp
(define-command-global open-external-browser ()
  "Open the current url in Firefox"
  (uiop:run-program (list "firefox" (render-url (url (current-buffer))))))
```

As I said, Nyxt is great for basic navigation but when it comes to inspecting HTML or CSS elements I'm more comfortable using Firefox developer tools. Time will tell if I can manage to do even basic web dev tasks in Nyxt. Also, Nyxt 3 introduced some changes in how we defined our configuration files (`config.lisp` versus `init.lisp`) and how we address some components. Basic stuff I showed in my earlier post no longer works, unfortunately. You can start with [Artyom Bologov]'s config to get an idea of how it feels to customize Nyxt a bit. I used some of his macros to define my own shortcuts, for example.

{{% music %}}Kendra Morris • _This Life_{{% /music %}}

[nyxt browser]: /post/nyxt-browser/
[artyom bologov]: https://github.com/aartaka/nyxt-config
