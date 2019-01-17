---
title: "Emacs and git-gutter"
date: 2019-01-15T20:08:00+01:00
draft: false
type: "tweet"
---

Wanna customize your fringe with Git markers similar to [doom emacs](https://github.com/hlissner/doom-emacs)? Add this to
your `init.el` file:

```text
(with-eval-after-load 'flycheck
  (setq flycheck-indication-mode 'right-fringe))
(with-eval-after-load 'git-gutter-fringe
  (fringe-helper-define 'git-gutter-fr:added '(center repeated) "XXX.....")
  (fringe-helper-define 'git-gutter-fr:modified '(center repeated) "XXX.....")
  (fringe-helper-define 'git-gutter-fr:deleted '(center repeated) "XXX....."))
```
