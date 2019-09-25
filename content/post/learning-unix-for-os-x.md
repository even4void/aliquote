---
title: "Learning Unix for OS X"
date: 2018-02-19T21:37:25+01:00
draft: false
tags: ["review", "apple"]
categories: ["2018"]
---

*Learning Unix for OS X*, from the O'Reilly collection, is a book I read long ago but that I forgot to review in time. Here are some words about it.

![](/img/9781449332310.gif)

First of all, it should be noted that it is not Dave Taylor's first try at writing a book on OS X and Darwin, but most of the previous incantations are now out of print. Dave Taylor designed the [Elm](http://www.instinct.org/elm/) email client in the 90s, well before [Mutt](http://www.mutt.org) and other text-based email software.

TL;DR This book is a very interesting take for two kind of people: those who would like to get a better understanding of the command-line in general and/or OS X internals, and those who would like to work using the command-line in addition to the OS X standard applications, like the Finder, to improve their productivity. In the later case, one of the best use case is certainly the combined use of Spotlight's `mdls` (which return file metadata), `find` and `grep` (See the end of Chapter 5 to learn more).

At first sight, it really looks like a book for people not familiar with Unix or Linux systems, and who know close to nothing to the command-line or what the difference between a shell, a terminal and a TTY is.[^1] Even so there is always something to learn along the way. I for myself learned some cool options about BSD command I used to use almost every day. For instance, I was remembered that `ls -s` indicates the size of files in units of 512 bytes (rather than 1024 bytes); since I always use `ls -l` (aliased to `ll`), I totally forgot about this peculiarity. Somehow I also forgot about the `/Users/Shared/` directory that any user can use to store or write personal files that can be shared with (but not overwritten by) other users of the system.[^2] 

Things get more interesting with Chapter 4 since the author starts using the command line more often to show how to deal with files using `ls`, `less` and `cat`, `grep` (global/regular expression/print; more on this in Chapter 5), `cp` and `mv`, `ln`, `g(un)zip`, `tar`. With no surprise, the author choose to use `vi` rather than Emacs to illustrate basic text processing since it is available on Un*x machine, including OS X. Although I am definitely not a Vi(m) power user (but I do know [how to quit Vim](https://twitter.com/iamdevloper/status/435555976687923200)), I found the instructions clear and instructive. Regarding Emacs, the author qualifies it as "the Ferrari of Unix text editors". 

Chapter 5 is all about finding stuff on your Mac, whether it be files or simple pattern to lookup in one or several files. Mac users are probably used to Spotlight (and maybe its capabilities to exploit file tpe and metadata, see `man mdls` and `man mdfind`--this works great on PDF and Media file[^3]) but it is quite simple to use `grep` (or [ack](https://beyondgrep.com)) with powerful regular expressions, `find` or may be `locate`. Since `find` doesn't know how to open files but just test file attributes, it is often combined with `xargs` to apply a specific command to each result. Here are some funny examples built on top of those proposed by the author: `find /usr/bin -name "c*" -size +30k -type f -user $USER -perm +u=w -print` will find regular files starting with "c" that are executable, greater than 30 KB in size, located in the /bin directory, and for which you write permission; `find . -cmin -60 -print -type f | xargs grep -i TODO` find TODO items (case insensitive) in plain files that have changed within 60 minutes in the current directory. Surely the interested reader will find additional goodies on [bashoneliners.com](http://www.bashoneliners.com) or other "one-liner" website.

In Chapter 6, the author deals with redirecting standard input and output, which extends the piping operations discussed in the preceding chapters and applies to "line-oriented" program as opposed to "screen-oriented" program, per the author distinction. The combination of pipe, output redirection or append (`>>`) to write to an output file helps to define so-called filter. Several utilities are discussed to illustrate this approach to restructure the output of a series of commands: `tr`, `wc`, `head` and `tail`, `sort`, `uniq`.[^4] Again, here are two examples from the author:

```
find . -type f -user $USER -print0 | \
  xargs -0 ls -s1 | sort -rn | head
```

This will return the largest files owned by you in the current directory.

```
tr -cs "[:alpha:]" "\n" < alice.txt | \
  tr "[A-Z]" "[a-z]" | sort | uniq | wc -l
```

This will count the number of distinct words used in *Alice’s Adventures in Wonderland* (available in [plain text](http://www.gutenberg.org/ebooks/11) on Gutenberg). At some point, it becomes clear that the [Word services](https://www.macupdate.com/app/mac/10523/wordservice), that I use from time to time in TextEdit or Mail app, are just plain Un*x filters.

The last chapter I read is about dealing with running processes (`&`, `^z` and `bg`; `ps` and `kill`) and multitasking (`top`). I learned that XCode installs a specific command, `GetFileInfo`, which returns information about the creator and type codes of a given file. Type codes are four characters long and define "which icon gets assigned to certain files and, more importantly, determine the default application for opening that file."

This was a good read. Meanwhile, things have changed a bit on OS X: the ftp command no longer exists in High Sierra, the X11 server has been replaced by XQuartz, and much more. But I guess the next iteration of OS X will come with new UI and core planning policies. 

{{% music %}}The Strokes • *Room on Fire*{{% /music %}}

[^1]: The best explanation I am aware of so far can be [read on Stack Exchange](https://unix.stackexchange.com/a/4132). 

[^2]: And if you wonder what `/Users/Shared/adi` is, let take a look at [this post](http://galvanist.com/post/66313155502/userssharedadi).

[^3]: For instance, `mdfind -onlyin Music "kMDItemMusicalGenre == 'Jazz'"` will find jazzy songs in your Music directory.

[^4]: You can even learn how to print the Un*x way using `lpstat`, `lp` and `pr` : smile :
