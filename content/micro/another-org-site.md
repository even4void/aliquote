---
title: "Yet another org-powered website"
date: 2019-02-22T18:46:00+01:00
draft: false
type: "tweet"
---

Yet another [org-powered website](https://joshrollinswrites.com/blogging/drafting%5Fa%5Fpost/). This makes me think that I added a little
`org-capture` template to write those [micro-posts](/post/blogging-with-ox-hugo) without having to open my
`micro.org` file. `#org`

```emacs-lisp
("b" "Blog post" entry (file+headline "~/org/micro.org" "Micro")
     "** TODO %?\n:PROPERTIES:\n:EXPORT_FILE_NAME:\n:END:\n%^g\n"
     :empty-lines 1)
```
