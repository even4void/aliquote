+++
title = "Upgrading Bash and zsh on OS X"
date = 2012-07-24T19:30:29+01:00
draft = false
tags = ["apple"]
categories = ["2012"]
+++

Here is a brief description on how to update to newer versions of Bash and `zsh` on OS X.

Few hours after I wrote some notes on [Customizing terminal emulator and the like on OS X]({{< ref "/post/customizing-terminal-emulator-and-the-like-on-os-x.md" >}}"), I just decided to update my old version of Bash (believe it or not, I was still using the one that shiped with my MacBook Air when I got it two years ago, i.e. 3.2.48!). There are quick tutorials for installing Bash by little googling. I followed this one, and everything worked fine: [Change to new BASH Shell (4.1) for Mac OS X](http://bit.ly/NsQiT2). Just make sure to grab the latest version of Bash from a GNU server. The last points (6-12) are important if we want to make the system aware of our new interpreter.

For `zsh`, I downloaded the master zipball from [GitHub](https://github.com/zsh-users/zsh). The install instructions in the `INSTALL` file contains everything that is needed to compile `zsh`, with the following minor exception: I got an error compiling the documentation which is contained in `zsh.texi`. According to this [thread](http://stackoverflow.com/questions/6894790/zsh-compilation-problem-in-osx) on Stack Overflow, we need [Yodl](http://yodl.sourceforge.net/) on OS X. And, of course, to compile Yodl you need yet another program: [icmake](http://icmake.sourceforge.net/). If you don't really care about the manpages and the help manual, you can skip what follows, and just follow with

```
$ make check
$ sudo make install
```

We can check that we now have the latest version of `zsh`:

```
$ /usr/local/bin/zsh --version
zsh 5.0.0 (x86_64-apple-darwin11.4.0)
```

As I am using [iTerm2](http://www.iterm2.com/), I just configured this new version as my default `zsh` interpreter in the Preferences panel.

![OS X Preference panel](/img/20120724125723.png)

We can then launch an new Terminal and see whether everything is working:

```
% print $ZSH_VERSION
5.0.0
```

(AFAIK, there's no `help` command like in Bash.)

--------

To compile icmake, you will have to replace every `#define` by `export` (if you are using Bash) in `INSTALL.im`, and you might want to change the target directories (I prefer to put everything in `/usr/local`), but that's not necessary. Just run:

```
$ ./icm_bootstrap /usr/local/share/icmake-7.16.00
$ sudo ./icm_install all
$ sudo ln -s /usr/local/share/icmake-7.16.00 /usr/local/share/icmake
```

and add /usr/local/share/icmake to your `PATH`, e.g., for this session:

```
$ export PATH="/usr/local/share/icmake:$PATH"
```

One can also symlink executables to a more convenient place, e.g., `/usr/local/bin`.

Then, proceed with Yodl

In `INSTALL.im`, change the install directory in `setLocations()` at the end
of the file. E.g., I used

```
BASE = "/usr/local";
```

Please note that the `build` program assumes that `icmake` is located in `/usr/bin`. How funny? So, let's change the shebang line so that it now reads

```
#!/usr/local/share/icmake -qt/tmp/yodl
```

I stopped here myself because there's a problem with compiling `yodl` that I don't have time to investigate more carefully. I will update this section later!
Yes, I promise: One day I will switch to [Homebrew](http://mxcl.github.com/homebrew/) :-)
