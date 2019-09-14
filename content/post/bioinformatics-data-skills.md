---
title: "Bioinformatics Data Skills"
date: 2019-03-21T10:26:19+01:00
draft: false
tags: ["readings", "review", "bioinformatics"]
categories: ["2019"]
---

Here are quick notes I took while reading [Bioinformatics Data Skills: Reproducible and Robust Research with Open Source Tools](http://shop.oreilly.com/product/0636920030157.do), by Vince Buffalo.

<!--more-->

![](/img/bioinformatics-data-skills.jpg)

Note that there is a dedicated [Github repository](https://github.com/vsbuffalo/bds-files) as well as a companion website on Vince Buffalo's [website](http://vincebuffalo.org/book/).

O'Reilly books are generally of good quality, this book is excellent. It covers much more useful material than you would expect from basic textbooks on bioinformatics tools. Why? Because the author writes as a scientist rather than an engineer while putting a great emphasis on the data-centric workflow currently involved in the bioinformatics field. I have been following Vince Buffalo [here](https://twitter.com/vsbuffalo/) and [there](https://www.biostars.org/u/69/) for years, and I always learned something by reading his posts. He is a very talented guy. Now, I can also say that I spent some very good days reading his book.

Even if I was initially more motivated by the bioinformatics stuff (chapters 9 and following), I learned some good tricks like using `grep -c "[^ \\n\\t]" file` instead of `wc -l file` to count the number of lines in a file without having to worry about blank lines. Or that there is a `man ascii` available right from my Terminal. Or even that `LC_CTYPE=C grep --color='auto' -n -P "[\x80-\xFF]" file` will look for non-ASCII characters in a text file, much like `hexdump` does. Note that you will need GNU `grep`, since the BSD version of this program doesn't have such an option `-P`. However, we can do this in Vim using its powerful searching facilities, e.g. `/[^\x00-\xFF]`, to highlight all characters lying outside the (extended) ASCII range. The chapters on Unix tools (7 and 12) are really well written and full of other interesting illustrations. I can understand why Unix pipes are so important in bioinformatics since I used BSD utils (or GNU coreutils) a lot myself when processing raw data from the command line. If you are a beginner you will learn a lot by just reading the chapter "Inspecting and Manipulating Text Data with Unix Tools". At this point, I believe the important aspect is not to retain all the options of the commands presented but to know what can be done with them. Next time you will have to a problem to solve, then you will remember that `grep` is probably the right tool and that there's a specific option to match full expression (`-w`) or exclude specific keyword (`-v`). The man or info pages are here to help, provided you spend some time digging into them.

What I really like with Unix shell tools is that you can easily define function on the go or store them in your config file to reuse them in future sessions. Following the author's own example, we could define the following functions to inspect a text file:

```sh
inspect() { (head -n 2; tail -n 2) < "$1" | column -t }
nrow() { grep -c "[^ \\n\\t]" "$1" }
ncol() { awk -F "\t" '{print NF; exit}' "$1" }
```

This has inspired many command-line tools for [statistical](https://github.com/nferraz/st) [analysis](https://www.gnu.org/software/datamash/) or [data](https://github.com/bitly/data_hacks) [processing](https://github.com/dpmcmlxxvi/clistats). Sadly, <http://hcibib.org/perlman/stat/>, which a friend recommended to me years ago, seems to be dead now.

While CSV is a common data format (after Excel, in some domain), don't forget that most Unix program expect tab-delimited source file. This is the case for `cut` or `column`, for example. I have long been using tab-delimited file when teaching R several years ago using good old `read.table()` instructions to load the data. Windows users did not like that format very much--hard to parse using MS Word, isn't it? I also happened to use old-fashioned fixed format<sup>[^1]</sup> when teaching Stata and the use of custom dictionary.

> There’s no reason to make data formats attractive at the expense of readable by programs.

And don't forget that Unix tools can be really faster than anything you could think of using your favorite programming language. A good illustration can be found in the following article: [Command-line Tools can be 235x Faster than your Hadoop Cluster](https://adamdrake.com/command-line-tools-can-be-235x-faster-than-your-hadoop-cluster.html). Other examples are available in Jeroen Janssens's excellent book, [Data Science at the Command Line](https://www.datascienceatthecommandline.com).

The rest of the book is as good as this chapter, of course. I especially liked the very first chapters which provide a nice summary of all the useful tools (Unix shell, Git, access to remote server, etc.) that help to ensure reproductibility and the sustainability of a bioinformatics project. I wish I knew all that stuff well before I entered my PhD program, and I think it would be worth teaching such material to every scientist involved in data analysis at large. I learned a lot from the remaining chapters about biological sequences. Notably, I found funny that the 0 vs. 1-base indexing also applies when working with so-called range data. Although I did not read the chapter on R, I wonder why the author did not include one on Python since it is mentioned in several places in the book, including the case of 0-based coordinate system mentionned above.

[^1]: While we are into writing custom one-liner, I have this little function in my `.zshrc`, which I find quite handy to browse online Stata documentation directly from a Terminal: `function statahelp() { links https://www.stata.com/help.cgi\?"${1}" }`. If you source it in your shell, then `stathelp infix` will give you an idea of what fixed format from the 80's means.
