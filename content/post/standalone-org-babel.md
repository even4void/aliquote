---
title: "On creating Org documents using shell scripts"
date: 2020-12-28T20:28:18+01:00
draft: false
tags: ["emacs", "unix"]
categories: ["2020"]
---

I switched recently to Neovim as a full-time text editor. This means that I no longer have access to Emacs Org mode natively. Of course, I still have Emacs on my machine --- otherwise, I wouldn't be able to handle Org file without resorting to Pandoc (which doesn't handle Babel code chunks, unfortunately). This is just that I want to avoid opening Emacs just to export an Org file to a PDF or HTML document. Hopefully, it's quite easy to call Emacs from the command line and ask it to compile Org files on the go.

Over the past few months, I wrote some custom templates for PDF and HTML exports, namely the Tufte $\LaTeX$ handout and a hand crafted HTML template that I discussed in previous posts. I know I could write in Markdown and use Pandoc, but I don't want to forget all those Org files that I wrote in the last two years or so. Moreover, I still believe that the Org specs are better than the Markdown ones, especially because the latter are not really ones.

Here is a simple shell script that takes care of this:

```bash
#!/usr/bin/env bash

OPT=$1
FILE=$2

ELISP="/home/chl/Documents/notes/.assets/org-babel.el"
BIB="#+BIBLIOGRAPHY: references ieeetr limit:t option:-nobibsource"

case $OPT in
-pdf)
	emacs --batch -l "$ELISP" --eval "(progn (find-file \"$FILE\") (org-latex-export-to-pdf))"
	;;
-html)
	cp "$FILE" "_$FILE"
	rc="$(grep '#+BIBLIOGRAPHY' "$FILE")"
	[ -z "$rc" ] && echo "$BIB" >>"_$FILE"
	emacs --batch -l "$ELISP" --eval "(progn (find-file \"_$FILE\") (org-html-export-to-html))"
	mv _"${FILE%.org}.html" "${FILE%.org}.html"
	rm "_$FILE"
	;;
*)
	echo "Unknown export format."
	;;
esac
```

<br>
{{% alert note %}}
<small>[2022-04-24]</small><br>
I updated the above script to account for the case where we want to produce both a PDF and an HTML file. The latter requires a `#+BIBLIOGRAPHY:` directive to generate a proper bibliography with `bibtex2html`, but this directive is not well handled when exporting to PDF. Maybe there's an option to detect the exporting backend and discard such a directive in case it is not the HTML format, but I don't really know. For the time being, I will just add the HTML directive manually. Older version of this script can be found in the [Git history](https://github.com/even4void/aliquote/blob/master/content/post/standalone-org-babel.md).
{{% /alert %}}

Basically, it allows to compile an Org file and to produce either a PDF or HTML file, based on the flag passed when invoking the command. Of note, for HTML documents it relies on `ox-bibtex`, while PDFs are produced using the standard toolchain (biblatex with bibtex backend and pdflatex, but it is not difficult to use biber and lualatex instead). With that in place, I can now regenerate my previous documents without even opening Emacs, which is great after all. I know that the [vim-orgmode](https://github.com/jceb/vim-orgmode) plugin can take care of this as well, but as you see it is not very difficult to write your own backend for that purpose. I keep my custom settings in the file `org-babel.el`, which remains available on Github in my "org" repository, in case you're interested.
