+++
title = "A text-based workflow for taking note"
date = 2018-02-18T17:26:15+01:00
draft = false
tags = ["emacs", "apple"]
categories = ["2018"]
+++

Over the years, I have been using various approaches to note taking on my Mac, especially to annotate articles or books I read, or just quickly write some reminders or archive snippets of code. None has definitely been satisfactory--the last iteration was a combination of a standard BibTeX file and hundreds of ebooks managed by [Papers](https://www.readcube.com/papers/) app, and I definitely need a more robust workflow. 

<!--more-->

So, I decided to start again from scratch. Since I use (Space)macs[^1] for almost everything serious in my work, I set up a solution entirely based on two dedicated directories and a set of Markdown and Org files. I took inspiration from a very instructive [Reddit thread](https://www.reddit.com/r/emacs/comments/4gudyw/help_me_with_my_orgmode_workflow_for_notetaking/) in which one of the poster describes his setup to manage bibliographic entries using a combination of [Helm-bibtex](https://github.com/tmalsburg/helm-bibtex) and [org-ref](https://github.com/jkitchin/org-ref), and by another great blog post by Piotr Limanowski: [Reading for Programmers](https://codearsonist.com/reading-for-programmers).

I followed the instructions to initialise Helm-bibtex and org-ref, which basically amounts to define a few variables in my `.emacs`, as described on the Github links referenced above. For whatever reason we have to define the PDF directory and the BibTeX file twice, but this is something that I can live with. However, at some point I should really `setq` a constant filename to define the BibTeX file, since I only have once now. (Previously, I was exporting a separate bib file from Papers app to help differentiate entries coming from Papers and Emacs.)

The BibTeX keys are automagically generated (<kbd>C-c C-c</kbd> when editing an entry) and formatted thanks to additional work from `org-ref-clean-bibtex-entry`. Sometimes, the bibtex mode does not do a good job at generating a proper key and I found that the combination of the two commands yields best results. Each key basically consists in the name of the first author, the year, and the abbreviated title--all separated with hyphen to avoid messing the PDF filename with colon all over. Using this scheme, "cormen-2009-introd-algor" will stand for the following entry: 

```
Cormen, Thomas H and Leiserson, Charles E and Rivest, Ronald L and Stein, Clifford
Introduction to Algorithms
2009
The MIT Press
```

Then, Helm-bibtex comes to the rescue, and it really is a killer package! It can be insinuated in $\TeX$, Org, Markdown and Text mode, and it is bound to <kbd>M-m m i c</kbd> (major mode > insert > org-ref) in Markdown, or you can just <kbd>M-x helm-bibtex</kbd> just about anywhere. For instance, in a Markdown file like the one I am currently editing, it will bring up a window where I can locate or search all my references, like in [Deft mode](https://jblevins.org/projects/deft/), and insert a reference that [pandoc-citeproc](https://github.com/jgm/pandoc-citeproc) will take care of formatting in the final bibliography for me. Moreover, I can annotate or update any entry on the fly, and of course if there is an associated PDF file I can read it right away. I do not use Interleave that much, nor [org-noter](https://github.com/weirdNox/org-noter). In fact, I am fine with reading articles or books using Preview, Skim, or [Highlights](http://highlightsapp.net) app which offers a nice UI for visualizing annotations and highlighted paragraphs. But i know that I could potentially use Emacs as a PDF reader, thanks to the [pdf-tools](https://github.com/politza/pdf-tools) package. Likewise, I still use the great [Marked](http://marked2app.com) app to visualize the final output of my Markdown files even if Emacs already has a [live preview mode](https://jblevins.org/projects/markdown-mode/).

Finally, I added a few templates for [org-capture](https://orgmode.org/manual/Capture.html), which are heavily inspired from the documentation itself and a few links I found on the internet, nothing really original: TODO item and Journal entry. But I also have a quick template for capturing web link I am currently visiting on Safari app, thanks to a little gem found on [Irreal's blog](http://irreal.org/blog/?p=3726). 

{{% music %}}New Order • *Lost Sirens*{{% /music %}}



[^1]: The Space in brackets is here to signal that I really love the Spacemacs architecture but I stand by the Emacs part of the system.
