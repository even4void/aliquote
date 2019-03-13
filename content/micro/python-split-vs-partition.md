---
title: "Python split vs. partition"
date: 2019-03-12T21:36:00+01:00
draft: false
type: "tweet"
---

TIL Better to use `partition` rather than `split` when you want to convert a 'string' to a 'dict' based on the first occurence of a specific delimiter (as in `.split(..., 1)`). Note that unlike `split`, the delimiter is kept and you probably [don't want to keep it](https://stackoverflow.com/a/21568360). `#python`
