---
title: "Yet another Unix geekery"
date: 2023-11-28T20:48:45+01:00
draft: true
tags: ["unix"]
categories: ["2023"]
---

I have been using a custom setup to organize my init shell scripts for more more than one year long now, and I believe it's pretty robust both for local and remote use. The only things you really need to know, beside writing proper shell scripts, is what a login vs. interactive shell is and which init files are loaded in each cases. Briefly, an interactive shell runs in your preferred terminal emulator and this is where you usually type your commands, while a non-interactive process involves some kind of I/O operations which the user can't interact with. A login shell is used whenever you log in on your system (after the X or Wayland server is started, this is probably the one at the top of all child processes), while a non-login shell is everything else that is started in userland after you logged in, including external process launched by separate programs without user's action.

{{% music %}}XXX • _XXX_{{% /music %}}
