---
title: "Spacemacs June 2018"
date: 2018-06-12T19:33:34+02:00
draft: false 
description: ""
tags: ["emacs"]
categories: []
---

Unsurprisingly, I happened to reconfigure [Spacemacs](http://spacemacs.org) for Emacs 27, this time using the develop branch. Things have moved quite fast these later months. Most notably is the startup time, which is now well below the 7s that I was experiencing with the stable release last year. This, and the fact that I wanted something lighter motivated my move to Doom Emacs. I was quite happy with [Doom Emacs](https://github.com/hlissner/doom-emacs) but at some point I got tired of breaking changes in the develop branch. So, here we go: Back to Spacemacs in June 2018! Of course, I may come back to Doom Emacs in a little while. Who knows?

<!--more-->

Here are two screenshots of my new workhorse:

![](/img/2018-06-12-13-15-29.png)

![](/img/2018-06-12-20-23-31.png)

I use the vim-powerline modeline as it is simple yet informative enough. At least I know when I am in normal or hybrid mode, and what the major mode actually is. You can click on the major mode in the modeline if you like using the mouse and you will have excatly what you get by pressing `SPC-m`, or equivalently `,`, or `C-c`. I only activated the layers I think I will use in most cases and I only added a couple of custom settings in the `user-config` section of the dot file. At some point, I should probably move them to a dedicated private layer. I am still using the [doom themes](https://github.com/hlissner/emacs-doom-themes), and I refrain myself to install the doom modeline, which has been [ported recently to Spacemacs](https://gist.github.com/aaronjensen/32eb280a2ab67201dc350d6e392a3b65).

Instead of Anaconda, I decided to try the "experimental" [LSP](https://github.com/Microsoft/language-server-protocol) backend (Yeah, I know, this is from Microsoft!) for Python. So far it looks like it is working, at least for the minimal requirements that I have when writing Python code. Here is a more [detailed blog post](https://vxlabs.com/2018/06/08/python-language-server-with-emacs-and-lsp-mode/). I am looking forward to the C/C++ [cquery](https://github.com/cquery-project/cquery)-based package. I just added two shortcuts for `xref-find-definitions` (`SPC-<` instead of `M-.`, because it seems that it doesn't play well with evil bindings) and `xref-find-references` (`SPC->` addition to `M-?`), which are convenient to jump from function definition to other part of a Python program for instance. I know `,gg` and `SPC-m-g` are also available.

Based on my preliminary exposition to "workspaces", I managed to get a more productive use of [projectile](https://github.com/bbatsov/projectile) and layout/workspace (or [sub-layout](https://github.com/syl20bnr/spacemacs/issues/6200)) in Spacemacs, even if I am still making a very basic usage of them. Indeed, I just like the idea of having separate environment for my editing activities, e.g. one for blogging, one for editing dot files, one for each project I work on, etc. Using a dedicated workspace (let's call it this way even if I am not sure it is the right term) simplifies the management of opened buffers a lot since running processes, help pages or evilified stuff are masked from the switch buffer action (`C-x b`). This is probably nothing new for people that use to work with projectile projects, but anyway I like this way of managing lot of buffers during a whole day session.

On a related note, I now tend to use a `todo.org` file in the root directory of any new project. This helps focus on specific tasks and provides kind of reminders for future revision or ongoing work. Hopefully, when the project is over, all tasks should be marked as DONE. One nice feature of projectile is that you can associate a global or per-project TODO file that can easily be accessed using `SPC-p-o` (`org-projectile/goto-todos`). Combined with [magit-org-todos](https://github.com/danielma/magit-org-todos.el), I found this very handy to manage ongoing projects using Emacs and [Magit](https://magit.vc).

Last but not least, the `SPC` leader key is really well thought out. This makes it so easy to focus on your text without even thinking to use a mouse (and I don't have a mouse, just a trackpad). But that's probably the reason why Emacs (and probably Vi(m)) users never look away too long.

