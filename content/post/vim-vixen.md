---
title: "Vim Vixen"
date: 2022-09-17T09:57:23+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

One or two years ago I tried Tridactyl to ease navigation in Firefox using familiar Vim shortcuts. It is not that I do not like Firefox's shortcuts, but I find them limited in a certain sense. How do you navigate in a page without using a mouse? At some point, you often need to use the mouse to follow an hyperlink. Most [keyboard-driven navigators] provide a way to highlight all links in a web page using consecutive alphabetical letters or digrams (often times, this is triggered with the f or F shortcut, like in Vim), and to use the corresponding label to follow the link. When there are a limited number of hyperlinks on a page this happens to be quite fine. The two other aspects of managing a running web browser instance that are important to me are: how to efficiently manage my opened tabs and the current web page I ma looking at (e.g., going straight to the bottom or the top of the page), and how to search in a web page. [Nyxt browser] solves both problems very nicely using familiar Vim shortcuts. How about Firefox?

Here comes Vim Vixen. This is yet another keyboard-driven extension to navigate in Firefox. Contrary to Tridactyl it does not require to alter the default starting page, and it comes with the same (sane) default keybindings, which will be familiar to Vim users of course. There are some additional shortcuts that are quite handy too. For instance, you can yank the current URL to the clipboard using `y`, or delete a tab using `d` (`u` will reopen the last closed tab). Navigating your opened tabs is quite easy, using `J` and `K`, like is the case for opening a new page using `o` (open in current tab), `t` (open in new tab) and `w` (open in new window). You can also duplicate the current page (`zd`), and manage zoom level using the `z` prefix as well: `zo` to zoom out, `zi` to zoom in, and `z=` to reset default zoom.

Overall, I like it a lot. I should note that sometimes it loose focus and we are back with usual Firefox shortcuts. For instance, Vim Vixen search shortcut (`/`) becomes unavailable and we have to use Firefox's own quick search box. There are sometimes some other glitches when dark theme are enabled on some websites: The search bar which normally sits at the bottom of the window appears bigger than it should be. This is easily solved by triggering the search shortcut once.

Of note, I installed a bunch of other extensions for Firefox, which I find quite convenient to navigate the web these days (think GDPR, cookies, trackers, etc.): [uBlock Origin], [Decentraleyes], and [I don't care about cookies], which changed my life really. All of them were recommended by [Luke Smith], including Vim Vixen.

{{% music %}}Leonard Cohen • _Traveling Light_{{% /music %}}

[keyboard-driven navigators]: https://www.ghacks.net/2017/05/26/webextension-vimium-brings-vim-like-controls-to-firefox/
[nyxt browser]: /post/nyxt-v3/
[Luke Smith]: https://lukesmith.xyz/programs/
[uBlock Origin]: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
[Decentraleyes]: https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/
[I don't care about cookies]: https://addons.mozilla.org/en-US/firefox/addon/i-dont-care-about-cookies/
