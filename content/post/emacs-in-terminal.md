---
title: "Running Emacs in a terminal"
date: 2020-08-06T14:01:09+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

I know this has been debated at large on the web, and there are already [excellent](comments) [threads](https://www.reddit.com/r/emacs/comments/5lh1fg/any_glaringly_large_disadvantages_to_emacs_in_nw/) on Reddit regarding the use of Emacs in terminal vs. GUI mode. Also, there are compelling arguments about why it is probably better to run Emacs in a GUI: generally this amounts to displaying images, using OS specific or extra keybindings not available in tty (unless you use xterm, rxvt or iTerm, but it's cumbersome to remap everything), but there are probably some other subtleties that I never noticed besides `posframe` which is quite great. At [one point](/post/emacs-15-years-later/) I was using Emacs almost exclusively from iTerm, then I got bored or something like that and switched to GUI mode only. I guess my main complaints were the lack of support for 24-bit colors (while iTerm supports them), which means tweaking your default theme or adding a lot of if/switch statements.

Later I discovered that you can have a 24-bit mode for terminal applications, and you just have to prefix the invocation of your preferred command with `env TERM=xterm-24bit`, once you have installed the corresponding `terminfo` stuff.[^1] So far so good. I can have the same rendering of font and color in GUI and terminal mode. That's all good. And this makes a huge difference! What else? Well, I think it depends on the intended usage. For quick editing of text files, including writing micro-posts or Git commit messages, I tend to use Neovim. Startup time, ease of text manipulation, you know. When working on projects, I use Emacs, exclusively. I know I have dired and vterm available withing a few key presses, and that's really all I need in addition to Emacs editing facilities. I should note that as I use Doom emacs, many things are already configured the right way (linter, checker, spelling, project management, etc.).

Sometimes, I feel lazy or in retro mode and I only want to run a Terminal on my Mac. Surely I cannot browse the web as easily as when using Safari or `xwidget` in Emacs, but that's okay, especially when I don't need to browse the internet. So, to answer the original question I think it all depends: If you want a full-fledged Emacs, you should probably run it in GUI mode, so that you will also enjoy reading your PDF files right into a separate buffer when editing your Org file. On the contrary, if you only want to quickcly revise an existing project, or create one from scratch, while staying at your preferred Terminal application, `emacs -nw` is quite good actually.

When in GUI mode, I have a lot of keybindings involving the command key on my Macbook. This is handy since I'm used to use, e.g., `⌘-F` to search for some expression, or `⌘-S` or `⌘-W` to save or close a buffer (which are not really buffers in other macOS applications, but that's another issue). Finally I made them all available via the leader key (`SPC`) in Doom, so that `s-&`, which means "switch to the next workspace" in GUI mode, becomes `SPC-&` when I run Emacs in a Terminal. By the way, `which-key` is such a nice add-on, I wish it exists long before when I started learning more advanced Emacs shortcuts. Indeed I added a lot of custom shortcuts under my leader key, see below.

![emacs-which-key](/img/2020-08-06-15-08-11.png)

Overall, I'm starting to appreciate Evil mode, especially motion, visual mode, and the `z` and `g` prefixes. I'm still learning, though. at this point, I would say I use 50% of Vim keybindings, in addition to `which-key` shortcuts, when I'm not simply moving around using the arrow keys with or without the `fn` key (yes I know, this is bad, we have `hjkl` and `C-u`/`C-d`). However, I tend to be slowly moving to using Vim keybindings exclusively, especially when running Emacs in a Terminal.

[^1]: Unfortunately, I don't remember where exactly I got mine, but this was on Stack Overflow a few years ago.
