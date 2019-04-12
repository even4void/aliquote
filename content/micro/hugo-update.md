---
title: "Hugo update broke my website"
date: 2019-04-12T14:18:00+02:00
draft: false
type: "tweet"
---

Great. Just when I was trying to recompile my Hugo website I noticed that the
0.54->0.55 upgrade just broke everything! And we can see [comments like this](https://github.com/gohugoio/hugo/issues/4117#issuecomment-475810894). I
don't care about performance issue or variable name changes or even Go itself. I
just want a tool to build my static pages, using an old theme that I customized
to my liking. Anyway, since I no time to fix the Go code for the modified
template I use, let's go back to the previous release (0.54 has SHA
`6c0c7919de42ee5d629d3a9786fb111f4498dab3`) and pin it for good!

```shell
brew uninstall hugo
brew install https://bit.ly/2UxujU1
brew pin hugo
```
