---
title: "Lisp REPL for Vim"
date: 2026-09-20T19:56:27+02:00
draft: false
tags: ["vim", "lisp"]
categories: ["2026"]
---

I've been using a fork of [slimv][1] for several years, but since I don't code
that much in Lisp I often use the default SBCL REPL in a split. I don't miss too
much of slimv capabilities as I handle documentation at point and completion
using custom VimL scripts. However, I don't have access to more involved tools
like the debugger and error backtrace, object inspector, callee/caller
navigation and many other capabilities that are readily available through slimv
or vlime.

If you are looking for light yet powerful and ready to go REPLs for your Vim,
here are two options:

1. [icl][2]: An enhanced REPL
2. [sbcli][3]: A REPL for my SBCL needs

Both provide readline capabilities, as well as syntax highlighting if you like
that.

I would say icl is more in the spirit of modern REPL (like [arf][4] for R) and
it also offers a notebook interface, which I didn't really explore, with a focus
on tabular data views. An interesting aspect of icl lies in its Flame Graph
Profiling for SBCL. It's been a while since I last used it and I juts noticed
that it is now vide coded. As a result, maybe, it now features

> AI integration - Use ,explain to get AI-powered explanations of code, errors,
> and results

One other curious thing is that it now ships with some bindings to Lisp-Stat
(which apparently still doesn't care about Luke Tierney original work, but
that's not the point).

On the contrary, sbcli has a more focused objective: helping the user along the
various steps of developing a program in Lisp. This includes printing
documentation for symbols, entering inspection mode for a symbol, and managing
an interactive debugger with available restarts; it also allows to print the
return type of any expression or to dump the disassembly of a symbol.

[1]: https://github.com/kovisoft/slimv
[2]: https://github.com/atgreen/icl
[3]: https://github.com/hellerve/sbcli
[4]: https://github.com/eitsupi/arf

{{% music %}}Brain Machine • *Heaven 8*{{% /music %}}
