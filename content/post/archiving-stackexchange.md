---
title: "Archiving my responses on StackExchange"
date: 2011-01-20T09:11:40+01:00
draft: false
tags: ["statistics", "tex"]
categories: ["2011"]
---

I decided to backup my posts on [stats.stackechange.com](http://stats.stackechange.com) into a single PDF file. This is easy for me because all my responses are already saved on my hard drive in Markdown format. In what follows, I will describe how I managed to create my own archive.

All my posts are available as plain text files, with names `0001.txt` to `0245.txt`. They include the title of the questions (with link to [stats.stackexchange.com](stats.stackexchange.com)) followed by my response, in [Markdown](http://daringfireball.net/projects/markdown/syntax) format.

![worddle](/img/20110121111926.png)

## The hard (and ugly) way

The first thing that came to my mind was just to convert each file to individual HTML files, and then assemble the whole stuff into a single file.

```
$ ./convert_md.sh --html
$ htmldoc --continuous --charset utf-8 --color -f \
  chl_stats_stackechange_2011-01-20.pdf *.html
```

In the above instructions, [`convert_md.sh`](http://www.aliquote.org/pub/convert_md.sh) features a simple loop for calling [pandoc](http://johnmacfarlane.net/pandoc/) on the Markdown files. Using [htmldoc](http://www.htmldoc.org/) rather than a compiled HTML file allows to quickly solve the problem of the Markdown link encoded as numbered references which won't update between each piece of HTML. 

The other advantage is that `htmldoc` will fetch all linked images (which are stored on <http://i.imgur.com>), although it is rather long. But it appears that this is not a so good idea because then images are not croped or resized. As a consequence, it produces an ugly PDF file, notwithstanding the fact that there appears to be some problem with long lines not breaking, and TeX expressions rendered incorrectly. Generating a single HTML file, and then converting it to PDF with `Apercu.app` does not solve the problem either.

## The easy (but pretty) way

This time, I decided to assemble all files in a Context file. For this to be possible, I needed each file as an independent $\TeX$ chunk, to decide of a common figure width, and to assemble the whole stuff into a single document:

```
$ ./convert_md.sh --tex
$ cat ~/header.tex > all.tex
$ cat [0-9]*.tex >> all.tex
$ echo '\stoptext' >> all.tex
```

The file `header.tex` includes the preamble for the master file. This is a slightly modified version of the default header produced when calling `markdown2pdf`. I'm still working on it to enhance the layout and color scheme. Here is the current [copy](http://www.aliquote.org/pub/header.tex) I am using.

The advantage is that Context handles inline images with URI without any problem: the file is just downloaded into `luatex` cache, and then reused from that location. Here, it doesn't work, though and I get a `libpng error: Not a PNG file` when running Context on such a file. It is very likely that there is a problem with URL handling in this particular case. However, it works perfectly well with other PNG files, e.g.:

```
\starttext
\externalfigure[http://upload.wikimedia.org/wikipedia/commons/thumb/ \   
                0/0d/ConTeXt_Unofficial_Logo.s \
                vg/200px-ConTeXt_Unofficial_Logo.svg.png]
\stoptext
```

will compile using `context`, but replacing the above link with a `bit.ly` shortcut, e.g. [http://j.mp/gOcjTS](http://j.mp/gOcjTS), doesn't.

So, for the time being, I ended up grabing images on the fly and put them in the same folder, and I make a `tar.gz` archive just after Context files have been processed.

```
$ grep -o --color=never 'http://i.imgur.com[^"]*[png$]' all.tex > imglist.txt
$ cat imglist.txt | awk '{print $1 " -O";}' | xargs curl -O --silent
$ sed 's|http://i.imgur.com/||g' < all.tex > all2.tex
$ texexec all2.tex
```

<small>(Note that we don't need to explicitly use a slash character as a delimiter with `sed`!)</small>

I used `curl` because `wget -q -i imglist.txt` doesn't work --- I don't know why it said the URL is malformed but I suspect it is because of the presence of `i.`. The `curl` command is a little bit tricky because we need to add an `-O` statement for each line in the file `imglist`. Another solution is to use `curl -K` with a list of URLs in a text file, but then we need to convert this file to replace the raw URLs with `url = "http://..."`.

I am now also able to produce single PDF files, and then concatenate them into a single file, e.g.

```
$ ./convert_md.sh --pdf -s
$ pdfjoin *.pdf -o all.pdf
```

Here are two screenshots that show how it looks once compiled:

{{< fluid_imgs
  "pure-u-1-2|/img/20110127165642.png"
  "pure-u-1-2|/img/20110127165629.png" >}}

A [sample PDF file](http://www.aliquote.org/pub/all2.pdf) is also available. 