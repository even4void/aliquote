---
title: "Of signals and trap"
date: 2022-08-15T22:54:54+02:00
draft: false
tags: ["unix", "haskell"]
categories: ["2022"]
---

I was reminded of signals in shell scripts, after reading some arcane Bash code a few months ago. What are signals, and how can they be used in shell scripts? The kernel sends signals to running processes about ongoing events. If you type `trap -l` in your terminal you'll a list of all available signals, with both their number and their name. Either one can be used to reference a given signal. See the [Bash manual] for more information. Note that `trap` is also aware of `ERR` signals that occur when programs like `tar` exits with non zero status code.

I don't remember what script caught my attention, but the gist of it is that you can easily monitor `SIGHUP` or `SIGINT` signals in a shell script, as you would do with other environmental variables or user input.

Without further ado, here's a sample script which catch up eventual user interrupt (`Ctrl-C`) when an external program is running :

```shell
#!/usr/bin/env bash

trap "echo User interrupt; exit" SIGINT

ghc -e 'iterate (\x -> ((1103515245 * x) + 12345 `mod` 2^31)) 1'
```

Whatever follows `trap` can also be wrapped in a Bash function. And of course, you can capture more than one signals.

Of note, the congruential generator above is not great of course.[^1] To generate an infinite sequence of random number generator, consider the more elaborated solution below:[^2]

```haskell
import System.Random

main = do
  g <- newStdGen
  (randoms g :: [Double])
```

A similar approach is discussed in [this blog post]. Other options are discussed on [Stack Overflow]. Another nice usage of the `trap` command is to clean up intermediate or temporary files in case the program crashes. See an exemple in [this article].

I don't have a clear idea of how to use `trap` for anything really involved in my Bash script, but I will surely consider using `trap` to clean up messy files from now on. In particular, I think the foloowing might be useful near the top of some of my Bash files (e.g., before carrying out large bioinformatics stuff), to offer a proper garbage collector to my scripts:

```shell
trap "rm -f /tmp/out" EXIT SIGINT
```

{{% music %}}Keith Jarrett • _You've Changed_{{% /music %}}

[bash manual]: https://www.gnu.org/software/bash/manual/html_node/Signals.html
[this blog post]: https://lgfang.github.io/computer/2020/02/13/bash-signal-trap
[stack overflow]: https://stackoverflow.com/questions/15785522/catch-sigint-in-bash-handle-and-ignore
[this article]: https://phoenixnap.com/kb/bash-trap-command

[^1]: It was the original BSD `rand()` function, though. But see [Random numbers fall mainly in the planes](https://www.pnas.org/doi/pdf/10.1073/pnas.61.1.25) (PDF), by Marsaglia for a discussion of linear congruential generators.
[^2]: You will likely need to install the `random` package since it does not come with default install of Stack or GHCup.
