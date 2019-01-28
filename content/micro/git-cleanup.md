---
title: "Git cleanup"
date: 2019-01-28T09:06:00+01:00
draft: false
type: "tweet"
---

How to [clean merged branches](https://medium.freecodecamp.org/how-to-free-up-space-on-your-developer-mac-f542f66ddfb) from all your Git repos? (Assuming they all live in
the same master directory.):

```nil
for d in */; do cd $d; echo WORKING ON $d; git branch --merged master \
  | grep -v "\* master" | xargs -n 1 git branch -d; cd ..; done
```
