+++
title = "Customizing terminal emulator and the Like on OS X"
date = 2012-07-21T19:31:52+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Some nifty customizations for my [CLI](http://en.wikipedia.org/wiki/Command-line_interface) environment.

## Colorized terminal

I decided to change the look'n feel of my Terminal. I'm using iTerm2, instead of Terminal.app, and I was usually just printing the simplest shell prompt ever: `$`. I wanted to change this for a modern UTF-8 prompt, and after looking at this post on [Unix & Linux](http://unix.stackexchange.com/q/25903), I realized that awesome shell prompt do indeed exist. Other interesting discussions can be found by following these links:

- [8 Useful and Interesting Bash Prompts](http://bit.ly/MO0oJ9)
- [Color Bash Prompt](http://bit.ly/O5bwV8)
- [A better bash prompt on Mac OS X](http://bit.ly/MO0sJ1)

My terminal now looks like this:

![OS X Terminal](/img/20120721103526.png)

Basically, current history line number, command line number, hostname, number of jobs and current directory are displayed on the first line, a left to right arrow replacing the standard Bash `$` on the second line. When in a `git` repository, actual branch is printed next to the path. When last command returns an error, a red star is printed after command history. I found that displaying the number of jobs is really useful in case you want to run different programs into the same terminal, say R, python and Emacs, switch easily between them (`C-z`, `fg` followed by jobs number to get the process back) and never forget there are running jobs when leaving it. All that is done with the pretty ugly instructions (in my `.profile`):

```
PS1="\[\e[33m\][\!:\#]\`if [[ \$? != "0" ]]; then echo $'\[\033[31m\] \
\xe2\x98\x85\[\e[0m\]'; fi\` \[\e[32m\]\h (\j)\[\e[0m\] \ 
\[\e[33m\]\w\[\e[0m\] \[\e[32m\]\$(__git_ps1)\[\e[0m\]\n\[\e[33m\]\$(echo \
$'\xe2\x86\x92')\[\e[0m\] "
PS2=$'\\[\e[33m\\]\xe2\x86\x92\\[\e[0m\\] '
```

## Bash vs. zsh

There are many shells on OS X, see e.g.

```
$ ls /usr/bin/*sh
```

Older Mac systems were using `tcsh` as the default shell program. Bash was introduced when switching from OS X Jaguar to Panther, and is now the default shell program. Of course, they are never updated and you are left with the version that ships with OS X when you buy your computer. Well, we can compile newer version ourselves, unless we rely on some kind of external package manager like [port](http://www.macports.org/) or [brew](http://mxcl.github.com/homebrew/). I start to feel myself like a brontosaurus since I am always compiling everything by hand, but everything seems quite in order, so I don't feel too much off base.

At the time of this writing, current version of `zsh` is 4.3.17, while I have

```
$ zsh --version
zsh 4.3.11 (i386-apple-darwin11.0)
```

I've always heard good things about [zsh](http://zsh.sourceforge.net/). A short introduction is available in this quite old post, [zsh: The last shell you’ll ever need!](http://bit.ly/Pq6Ruo). The [reference manual](http://bit.ly/LEbeW3) is however a must read first.

Of course, there are lot of tutorials on internet, and as much tips and tricks we may want to try. First thing to do is, however, to customize the configuration file, `.zshrc`:

- `.zshrc` on <http://dotfiles.org/>
- Stack Overflow, [What's in your .zshrc?](http://stackoverflow.com/q/171563/420055)

For those using `zsh`, I believe they should take a look at [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). There are some [custom themes](https://github.com/robbyrussell/oh-my-zsh/wiki/themes) to get started with.

After 8 years or so of Bash, maybe its's time to make the switch and try `zsh` for, say, one week or two.


## Tmux

I have yet to familiarize myself with using [tmux](http://tmux.sourceforge.net/) on a more regular basis. Previously, I used to use [GNU screen](http://www.gnu.org/software/screen/). Installation on OS X and integration with iTerm2 went very simple: I just downloaded the tarball, compiled and installed as described in the installation notes.

I found some good tutorials here:

- [iTerm2 With Tmux](http://bit.ly/PpSXIN)
- [Less Perplexing Terminal Multiplexing with tmux](http://bit.ly/Q31dDb)
- [Practical Tmux](http://mutelight.org/practical-tmux)


## R for statistics

After watching a nice video on [how to build R packages in less than 6 minutes](http://bit.ly/PpX3Az), I discovered the [colorout](http://cran.r-project.org/web/packages/colorout/index.html) package which basically offers colorized output when R is run on a terminal emulator.

I added this to my `.Rprofile`.

```
> options(colorout.emacs = TRUE)
> library(colorout)
> setOutputColors(4, 4, 4, 4, 3, 1, 1, FALSE)
```

I choose to use very few different colors, essentially for normal output (blue), warnings (orange), and errors (red).

![R shell](/img/20120721112832.png)
