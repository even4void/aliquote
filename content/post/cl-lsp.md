---
title: "Trying out cl-lsp"
date: 2023-11-08T10:51:39+01:00
draft: false
tags: ["lisp", "vim"]
categories: ["2023"]
---

I tried using [roswell](https://github.com/roswell/roswell/) as my daily Common Lisp (CL) driver a few years ago, and then got back to good old SBCL for quick scripting. Note that if you rely on Ubuntu apt repos, sbcl is likely outdated (SBCL 2.1.11.debian at the time I write this post). Roswell looks great since it allows us to install multiple flavors and/or versions of CL programs (e.g., sbcl, ccl), but also to use a simple shebang for CL scripts, like the one below:

```shell
#!/bin/sh
#|-*- mode:lisp -*-|#
#|
exec ros -Q -- "$0" "$@"
|#

(with-output-to-string (*standard-output*)
  (asdf:load-system :hyperspec))

(defun main (cword &rest argv)
  (declare (ignore argv))
  (format t "~D~%" (hyperspec:lookup (read-from-string cword))))
```
<small>This allows to fetch the Hyperspec documentation for, e.g., symbol at point if you use it as a keywordprg in (Neo)vim.</small>

Furthermore, there was an implementation of a CL [LSP](https://github.com/cxxxr/cl-lsp) that apparently [requires roswell](https://github.com/cxxxr/cl-lsp/issues/5), plus additional dependencies that I could not manage to install with quicklisp alone. Thus I gave up. Today, I reinstalled roswell and started again to compile the whole system to see if I could get cl-lsp working this time.

First, the install instructions are not really clear or probably just incomplete on GitHub. We are told to run `ros install lem-project/lem cxxxr/cl-lsp`, but this does not quite work. I keep getting a fatal error, even after installing lem-project/micros and lem-project/lem-mailbox as suggested in [issue #29](https://github.com/cxxxr/cl-lsp/issues/29):

```shell
[1/3] System 'lem' found. Loading the system..
While evaluating the form starting at line 1, column 0
  of #P"/home/chl/.roswell/local-projects/lem-project/lem/lem.asd":Aborted during step [1/3].
Unhandled LOAD-SYSTEM-DEFINITION-ERROR in thread #<SB-THREAD:THREAD tid=180321 "main thread" RUNNING {10013E0003}>: Error while trying to load definition for system lem from pathname /home/chl/.roswell/local-projects/lem-project/lem/lem.asd: Couldn't execute "qlot": No such file or directory
```

So, qlot is missing, even after installing qlot or fukamachi/qlot. I went to <https://qlot.tech/> directly and install it in my home directory, symlinked `$HOME/.qlot/bin/qlot` to a directory that is already reachable in my `$PATH`, and this solved all the problems mentioned above. You likely need to add roswell bin directory to your path, e.g. `[ -d "$HOME/.roswell" ] && PATH="$HOME/.roswell/bin:$PATH"`. I did not bother to check if we really need micros and lem-mailbox. So now, in addition to my local quicklisp folder, I have an additional one which is managed by roswell, and additional stuff from qlot in the lem project itself:[^1]

```shell
~/.roswell
» tree -L 1
.
├── archives
├── bin
├── config
├── env
├── impls
├── lisp
├── local-projects
├── src
└── tmp

8 directories, 1 file

~/.roswell
» cd local-projects/lem-project/lem

lem main
» pwd
/home/chl/.roswell/local-projects/lem-project/lem

lem main
» ls .qlot
asdf.lisp  bin/  dists/  local-init/  local-projects/  quicklisp/  setup.lisp  source-registry.conf  tmp/

lem main
» du -sh .qlot
172M    .qlot
```

For testing purpose, I set up Neovim very basically using a filetype-specific init file (`ftplugin/lips.lua`):

```lua
vim.lsp.start({
  name = "cl_lsp",
  cmd = { "cl-lsp" },
  root_dir = vim.fs.dirname(
    vim.fs.find({ "." }, { upward = true })[1]
  ),
})
```

Here are the server functionnalities obtained from `vim.lsp.get_active_clients()[1].server_capabilities`:

```
{
  completionProvider = {
    completionItem = {
      labelDetailsSupport = true
    },
    resolveProvider = true,
    triggerCharacters = { ":" }
  },
  definitionProvider = {},
  documentFormattingProvider = vim.empty_dict(),
  documentHighlightProvider = vim.empty_dict(),
  documentOnTypeFormattingProvider = {
    firstTriggerCharacter = "(",
    moreTriggerCharacter = { ")" }
  },
  documentRangeFormattingProvider = vim.empty_dict(),
  documentSymbolProvider = vim.empty_dict(),
  executeCommandProvider = {
    commands = { "cl-lsp.interrupt", "cl-lsp.eval-range", "cl-lsp.eval-last-expression" }
  },
  hoverProvider = {},
  referencesProvider = vim.empty_dict(),
  signatureHelpProvider = {
    retriggerCharacters = {},
    triggerCharacters = { " " }
  },
  textDocumentSync = {
    change = 2,
    openClose = true,
    save = true
  }
}
```

Mandatory screenshot:

{{< figure src="/img/2023-11-08-11-45-33.png" >}}

Formatting does not seem to work correctly (see [#26](https://github.com/cxxxr/cl-lsp/issues/26)), while hover information is okay. No luck with goto actions (definition, reference), nor with omnicompletion (`C-X C-O`). I don't know if it is able to report diagnostics. It doesn't even produce a log file that we could inspect for diagnostic purpose. Also, sbcl is consuming a significant amount of CPU in the background, at least enough to trigger the fans on my laptop. The process is detached correctly upon quitting Neovim, though. This looked like a really cool project, although [slimv](https://github.com/kovisoft/slimv) or [vlime](https://github.com/vlime/vlime) are probably better shaped for interactive Lisp development.

I'm back with my original config: hyperspec via [dasht](https://github.com/sunaku/vim-dasht) for documentation, and [paredit.vim](https://github.com/kovisoft/paredit). And I removed all the intermediate junk files right away. That was a fun exercise anyway!

{{% music %}}Sad Lovers & Giants • _Like Thieves_{{% /music %}}

[^1]: I understand that this is useful for [project-based management of quicklisp libraries](https://github.com/fukamachi/qlot#what-qlot-is-trying-to-solve).
