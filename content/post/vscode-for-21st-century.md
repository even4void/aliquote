---
title: "Code for the 21st century"
date: 2020-06-24T08:01:50+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

VS Code is the new cool editor of the 21st century that everybody knows, likes, and/or uses. I rarely come across negative review of it, even from Vim or Emacs heavy users. As far as I am concerned, I reinstalled it lately, just to edit some Python code because Emacs LSP is too slow to my taste --- the startup phase, I mean, because it keep insisting on indexing and caching over and over again the same codebase.

I already wrote a short review in the past: [VS Code and Python](/post/vscode-python/). One of the things that significantly changed since last year is far better support for R, thanks to the new [language server](https://github.com/REditorSupport/languageserver). The UI has significantly improved too. Yet I'm still on Emacs for a long time apparently, if only because I process plain text editing in Markdown or Org, and Emacs has better support for this kind of writing tasks in my opinion. While I really liked [Typora](/post/typora/), I couldn't last more than a few days using an application other than Emacs. Go figure. Probably a matter of taste, or "culture and habit" as one used to say in the following thread:

{{< tweet 1275106475581505540 >}}

Here are a few things that I like in Emacs and that I always missed in any other editors:

- Frame (buffer) management: Along with find/replace, copy/paste, motion, inline evaluation and code navigation, being able to switch to a different buffer or workspace is one of the thing that I find difficult in other code editors. Atom or VS Code offers a project sidebar --- note that this is really a project drawer, and it assumes that you're only working on the files indexed in that specific project; see point below --- but that's very little compared to what can be done under Emacs. I'm using Doom Emacs, and in addition to the available key bindings, like `SPC SPC` or `SPC .` which allows to find any file in the current project or elsewhere, I added some handy key bindings: `s-&` let me switch between opened buffer for the current project (this is `persp-switch-to-buffer`), and `s-@` (`+workspace:switch-next`); `s-←`, `s-→`, `s-↑` and `s-↓` to navigate between frames (like `windmove`); `s-P`, `s-$`, `s-B` to toggle `M-x`, minor mode `M-x` and `treemacs`, respectively.

- Multiple projects: The very fact that we can work on several projects during the same session is undoubtedly one of the most important aspects of Emacs. It's not much that we can work on a Python project, and an R session, and some Scheme code alongside. I would better think of it as a way to have a permanent log book and a buffer for quick note taking, a shell, and a woring project (be it in Python and/or R). I always found that Atom or VS Code, which are definitely project-centric editors, were quite limiting in this regard, unless you're willing to open another editor and eat up another part of your RAM.

- Embedded shell and process: This is definitely what has always been missing in Textmate or Atom --- having a proper shell embedded along the text editor, where you can send commands and process the results. I can spend a whole day without even opening iTerm2 when I'm writing some R or Python code in Emacs.

- Keyboard centric approach: Last but not least, I'm so used to Emacs (and some Vim) keybindings that I always have a hard time rewiring my fingers to deal with another key mapping set.

Of course, VS code looks pretty, comes full of nice feature and integrates all the modern tools for test-driven development and continuous integration. Updating the whole packages and the application itself is less risky than upgrading Doom Emacs or Spacemecs sometimes, because money of course (I mean, there's probably an army of paid developers behind VS Code, while only benevolent folks take care of package development and maintenance on the Emacs side). However, the advance of `lsp-mode` and related projects will likely make Emacs even more comfortable in the near future. Note that I do not even talk of functional hackers who might miss a lot of Emacs features for Lisp (Slime or Sly), Scheme (Geiser) or Clojure (CIDER) development after switching to web-centric UIs. Remember this?

> Modern text editors have higher latency than 42-year-old Emacs. Text editors! What can be simpler? --- [Software disenchantment](https://tonsky.me/blog/disenchantment/)

Finally, I would say that Emacs affords some kind of digital minimalism, precisely because of what some folks think of a rough UI. However, once you get a pretty informative modeline, a project drawer, a task runner, a nice Git interface, you're close to being as productive as VC coders, IMO. Here's one example of a recent Emacs session during which I was writing some R code. This is powered by Doom emacs and the R langage server (running on top of ESS), btw.

![emacs](/img/2020-06-23-09-25-43.png)
