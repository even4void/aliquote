---
title: "Signals and shell scripts"
date: 2022-08-14T22:54:54+02:00
draft: true
tags: ["unix"]
categories: ["2022"]
---

I was reminded of signals in shell scripts, after reading some arcane Bash code a few months ago. What are signals, and how can they be used in shell scripts? The kernel sends signals to running processes about ongoing events. If you type `trap -l` in your terminal you'll a list of all available signals, with both their number and their name. Either one can be used to reference a given signal. See the [Bash manual] for more information.

I don't remember what script caught my attention, but the gist of it is that you can easily monitor `SIGHUP` or `SIGINT` signals in a shell script, as you would do with other environmental variables or user input.

Without further ado, here's a sample script which catch up eventual user interrupt (`Ctrl-C`) when an external program is running :

```shell
#!/usr/bin/env bash

trap "echo User interrupt; exit" SIGINT

ghc -e '
import System.Random
g <- newStdGen
(randoms g :: [Double])
'
```

A similar approach is discussed in [this blog post]. Other options are discussed on [Stack Overflow]. Another nice usage of the `trap` command is to clean up intermediate or temporary files in case the program carshes. See an exemple in [this article].

{{% music %}}Keith Jarrett • _You've Changed_{{% /music %}}

[bash manual]: https://www.gnu.org/software/bash/manual/html_node/Signals.html
[this blog post]: https://lgfang.github.io/computer/2020/02/13/bash-signal-trap
[stack overflow]: https://stackoverflow.com/questions/15785522/catch-sigint-in-bash-handle-and-ignore
[this article]: https://phoenixnap.com/kb/bash-trap-command
