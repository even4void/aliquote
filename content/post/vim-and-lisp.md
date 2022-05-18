---
title: "Common Lisp Hyperspec in Vim"
date: 2022-05-17T21:33:20+02:00
draft: false
tags: ["vim", "lisp"]
categories: ["2022"]
---

I really like the `keywordprg` mapping in Vim. It's the capital K that you press to get help for the word under the cursor (known as `cword` in Vim parlance). If you use an LSP client (builtin Neovim LSP, Coc or ALE, for example), you likely use it everyday since it is generally mapped onto the Hover method of the LSP server.

When not in an LSP-aware environment, I write my own `keywordprg`. You can find plenty of [nice ideas] on the web. Since I use some programming languages that don't come with an LSP yet, I have the following in my `after/ftplugin/stata.vim` settings, for instance:

```vim
setlocal keywordprg=stata_help
```

As mentioned in a [footnote] of one my older posts, I query Stata's online documentation when working from TUIs. In this case, `stata_help` is just a wrapper shell script for `links https://www.stata.com/help.cgi\?"${1}"`. This way, when I'm over a Stata command, I just press K and I get its online help in a tab, with a proper text-mode browser. Note that I prefer [Links] over Lynx for text-mode browsing the internet.

This morning I wrote a little Lisp script using [Roswell], since I wanted to try it for a moment. I already configured Roswell to fetch the latest release of SBCL on my laptop because Ubuntu's default version is pretty outdated. It works great but I never use the scripting facilities that Roswell offers. I wrote two versions of a small utility that allows to fetch the relevant documentation from Lispworks [Hyperspec] online documentation. The first version was a simple lookup through the documentation to retrieve the URL corresponding to the symbol at point and to return a system call to open it in the default browser. The lookup step is performed thanks to the [hyperspec] package. I used ASDF builtin facilities to launch external program (`uiop:run-program`) but one could also makes use of SBCL's builtin extensions (`sb-ext:run-program`). Finally, I decided to just return the URL to the standard output, in case I need to reuse the script for another purpose. Both versions are shown below:

```lisp
#!/bin/sh
#|-*- mode:lisp -*-|#
#|
exec ros -Q -- "$0" "$@"
|#

(with-output-to-string (*standard-output*)
  (asdf:load-system :hyperspec))

;; (defun main (cword &rest argv)
;;   (declare (ignore argv))
;;   (uiop:run-program
;;     (list "/usr/bin/xdg-open"
;;           (funcall #'hyperspec:lookup (read-from-string cword)))
;;     :output nil))

(defun main (cword &rest argv)
  (declare (ignore argv))
  (format t "~D~%" (hyperspec:lookup (read-from-string cword))))
```

Since I just fetch the URL, I need a way to tell Vim to display the online doc right inside a tab. This is done by adding `setlocal keywordprg=hyperspec_lookup` in my `after/ftplugin/lisp.vim` file, where `hyperspec_lookup` is just a wrapper shell script:

```shell
#!/usr/bin/env bash

rc=$(hyperspec_lookup.ros "$1")
links "$rc"
```

And now I get the full CLHS documentation for free when working in neovim!

![clhs](/img/2022-05-17-22-41-44.png)

{{% music %}}Echo & The Bunnymen • _All That Jazz_{{% /music %}}

[roswell]: https://github.com/roswell/roswell
[hyperspec]: http://www.lispworks.com/documentation/HyperSpec/Front/index.htm
[hyperspec]: https://quickref.common-lisp.net/hyperspec.html
[links]: https://links.twibright.com/user_en.html
[nice ideas]: https://til.codeinthehole.com/posts/about-how-to-use-keywordprg-effectively/
[footnote]: https://aliquote.org/post/bioinformatics-data-skills/
