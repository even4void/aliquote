+++
title = "Fixing some critical keyboard shortcuts in OS X terminal"
date = 2014-08-13T22:58:51+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here are some minor tweaks to default keyboard shortcuts in Apple Terminal.app and [iTerm](http://iterm2.com).

![Keyboard option on a Mac](/img/2014-08-13-09-01-07.png)

I like being able to switch from one tab to another using left and right arrows, and I prefer to keep consistent shortcuts so I updated the default ones in Terminal.app with those used in iTerm (e.g., <kbd>⌘ ➝</kbd> for next pane). Since Terminal.app uses system localization, labels are in French, and I have a hard time finding how to spell it correctly (because of the single quote).

The other one is for iTerm specifically: I deleted the <kbd>⌘ W</kbd> shortcut to close a terminal session because when using Emacs I found it interfering with the standard `C-c/C-v` for copy/paste (and I just recently happened to lost a whole R session with 200 Mo of statistical modeling).

For Emacs I have the following in one of my Elisp config file:

```lisp
(when (eq system-type 'darwin)
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize)
  ;; (setq ns-function-modifier 'hyper)
  (setq mac-option-modifier nil)
  (setq mac-command-modifier 'meta))

(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")
```

This means that I can type `M-x` as <kbd>⌘ x</kbd> or <kbd>Esc-x</kbd>.
