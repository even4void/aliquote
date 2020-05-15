---
title: "Handy command-line utilities"
date: 2020-05-15T08:55:35+02:00
draft: false
tags: ["misc"]
categories: ["2020"]
---

I'm an old hand at the command line and have a hard time adopting new tools. Most of the time, a shell and Emacs is all what I need in my daily job. This was true when I worked as a medical statistician, and it is still the case for bioinformatics stuff. I believe it follows from a form of respect for digital minimalism, hardware constraints (I always worked on small laptops with less than 16 Mb RAM), and daily tasks that are primarily text-based and that can be chained together, which is at the heart of the [Unix philospohy](https://en.wikipedia.org/wiki/Unix_philosophy). I learned Bash (and later Zsh) and Emacs twenty years ago now, and I suppose habit explains the rest. The only thing that really changed along the way in my daily workflow is the use checkers and linters for all "prog-mode" languages in Emacs.

Most of the time, I'm happy with GNU [core utilities](https://www.gnu.org/software/coreutils/coreutils.html), sed and awk, make, and shell scripts. There are many tutorials or lists of handy tools for your preferred terminal, but for the record here is what I've settled on in the last few years:

- [fd](https://github.com/sharkdp/fd) and [rg](https://github.com/BurntSushi/ripgrep) (ripgrep) are handy replacement for find and grep, in my view. Of course, I know grep quite a bit and it is hard to switch entirely to rg, but for casual search I found it better than grep with default settings. Before ripgrep I was using ack, but I try to stay on rg now, if not because it is also what I use in Emacs.
- [exa](https://github.com/ogham/exa) and [bat](https://github.com/sharkdp/bat) are excellent when it comes to list files and directories (with Git info) and short source files.
- [git-quick-stats](https://github.com/arzzen/git-quick-stats) and [delta](https://github.com/dandavison/delta) are interesting addition when you're involved with Git repositories, notwithstanding Github's own [gh](https://github.com/cli/cli) utility.

Again, there are probably many other great tools, including those I've once installed on my Macbook and forgot about afterwards or that I don't use so much. The above utilities are part of the commands I use almost every day in Zsh.

Regarding Emacs, there are a few packages that I could not live without. They are all bundled with Doom Emacs, of course, but these are the ones that come to my mind when I think of what I used the most in Emacs, apart from Org, [ESS](https://ess.r-project.org), [markdown-mode](http://jblevins.org/projects/markdown-mode/) and [mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html). This includes [ivy-bibtex](https://github.com/tmalsburg/helm-bibtex) (to manage my bibliographic entries and [reading notes](/post/notes-taking-workflow/) --- and yes, I now prefer Ivy to Helm), [git-gutter](https://github.com/emacsorphanage/git-gutter) ([magit](https://magit.vc) does not count, right?), [lsp-mode](https://github.com/emacs-lsp/lsp-mode) (mainly for Python, C and Rust) and [sly](https://github.com/joaotavora/sly) as a replacement to Slime for Lisp stuff.

Happy hacking!

![emacs](/img/2020-05-15-20-35-35.png)

{{% music %}}Tom Waits • _Asylum Years_{{% /music %}}
