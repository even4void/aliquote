---
title: "Stata and Julia on Atom"
date: 2018-09-19T19:36:16+02:00
draft: false
tags: ["stata", "julia"]
categories: ["2018"]
---

Regularly, I like to give [Atom](https://discourse.julialang.org/t/julia-1-0-support-just-landed-on-gadfly-master/14978) another try. This time, coupled to Hydrogen I found that Atom became a solid editor scientific computation and text editing.

<!--more-->

I have always thought of Hydrogen as a nice replacement for IPython notebook (and now Jupyter), but the configuration was not as easy as it is now apparently. All kernels are installed via Python, and configuration options are available in Atom preferences panel. As I already had the Python and R kernels installed on my Macbook, I just had to install the Julia and Stata kernels using Python 3. 

Since Julia reached the stabilized 1.0 version, the package management system has slightly evolved compared to the previous one. Other than that, it was as simple as entering the `pkg` mode and issuing `add IJulia` at the prompt. Thanks to the [stata_kernel](https://github.com/kylebarron/stata_kernel) (not to be confused with [stata-kernel](https://github.com/jrfiedler/stata-kernel)), it is quite easy to get Stata code running right into Atom. It is as smooth as ESS under Emacs and it is obviously much more convenient than using the kernel directly in a Jupyter notebook. The [dedicated website](https://kylebarron.github.io/stata_kernel/) highlights the main features, especially some very useful ["magics" commands](https://kylebarron.github.io/stata_kernel/using_stata_kernel/magics/), while also providing some comparison to other packages, like [ipystata](https://github.com/TiesdeKok/ipystata). Everything works like a charm (see the screenshot below) so that I don't think I will have to launch the Stata UI in a while. (On a Mac, it is possible to run Stata in a Terminal but without command history, paging or direct graphic output, so it has never been very interesting other than using pure estimation commands or running in batch mode.) Syntax highlighting and completion support are both excellent, better than their ESS counterparts, IMHO. I was not able to use a custom graphic scheme, though. The Julia kernel also works quite nicely, with the [master version](https://discourse.julialang.org/t/julia-1-0-support-just-landed-on-gadfly-master/14978) of Gadfly as the graphical backend.

![](/img/2018-09-19-09-23-22.png)

That being said, Emacs will probably remain my main editor especially for Lisp, Racket and Org. But let's not fool ourselves: Without further configuration, for each additional package you install in your Elisp directory (most of the times), it won't run so smoothly, let alone provides you with a pleasant visual experience (unless you are willing to run Emacs in a Terminal only). This is the reason I switched to Spacemacs (or even Doom Emacs) long ago. Try Atom or IntelliJ IDEA if you want direct autocompletion and code assistance right out of the box. Surely, there is some potential in Atom (at least much more than VS Code) as advocated by [Bodil Stokke](https://twitter.com/bodil/status/1016728171323035648) (see her [Atom config](https://github.com/bodil/ohai-atom)) if it stays away from Microsoft's tentacles of course. Other alternatives do exist, however. I've heard of [Xray](https://github.com/atom/xray) (still an electron app, with a bit of Rust) and [Xi](https://github.com/xi-editor/xi-editor) (also with a Rust backend) after reading Nikita Prokopov's post about [Software disenchantment](http://tonsky.me/blog/disenchantment/).
