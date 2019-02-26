---
title: "Emacs flush-lines"
date: 2019-02-25T12:21:00+01:00
draft: false
type: "tweet"
---

[How to delete empty lines in a file by Emacs?](https://stackoverflow.com/a/26492924) Useful to clean up an HTML page
with lot of extra blank lines. `#emacs`

```text
M-x flush-lines RET ^[[:space:]]*$ RET
```
