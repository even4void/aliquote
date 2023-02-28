---
title: "Monochromatic Theme"
date: 2023-02-27T20:20:22+01:00
draft: true
tags: []
categories: ["2023"]
---

I already discussed the use of monochrome scheme.

I have the following settings in my `.bashrc`, which I mostly use on virtual consoles or ssh terminals:

```shell
if [ "$XDG_SESSION_TYPE" = "tty" ]; then
	unset LS_COLORS
	export TERM=xterm-mono
	export NO_COLOR=1
	alias ll="ls -alF"
	alias vim='nvim -c ":set notermguicolors" -c ":colorscheme mono"'
	PS1="\W \$ "
else
	eval "$(starship init bash)"
fi
```

{{% music %}}XXX • _XXX_{{% /music %}}
