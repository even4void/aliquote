---
title: "Markdown and slideshow"
date: 2014-04-17T22:05:37+01:00
draft: false
tags: ["misc"]
categories: ["2014"]
---

I really like [Markdown](http://daringfireball.net/projects/markdown/syntax) for its simplicity and the fact that it allow to write text-based documents with very few requirements: You just need a text editor (mine is Emacs but this doesn't really matter).

Long ago, I wrote a little post entitled [Markdown everywhere](/post/markdown-everywhere), when I started evolving from old typesetting habits ($\LaTeX$ or Context) to more simplified markup languages (before Markdown, I used to use [Asciidoc](http://www.methods.co.nz/asciidoc/)). For more elaborated ideas on combining $\TeX$ and Markdown, please see [How I stopped worrying and started using Markdown like $\TeX$](http://randomdeterminism.wordpress.com/2012/06/01/how-i-stopped-worring-and-started-using-markdown-like-tex/). I still like $\TeX$-based documents, because it offers so much flexibility and great rendering options; here is an <i class="fa fa-file-pdf-o fa-1x"></i> [example](http://www.aliquote.org/cours/misc/gee/gee_tutor-fa3ce81.pdf) with a custom Context template. Now, it is clear that Markdown gained enough popularity to come in various flavors as the main texting tools in several software, e.g., the R statistical software.

There are a number of great review of available software to edit and process Markdown files. For example, here are two recent articles I found with little Googling:

- [78 Tools for Writing and Previewing Markdown](http://mashable.com/2013/06/24/markdown-tools/)
- [35+ Markdown Apps for the Mac](http://mac.appstorm.net/roundups/productivity-roundups/35-markdown-apps-for-the-mac/) for the Mac more specifically

But see [What is Markdown?](http://whatismarkdown.com/) to learn more about.

Recently, I heard about [Deckset](http://www.decksetapp.com/), which looks like a really great tool to publish nice looking slides using Markdown only. Unfortunately it appears that is is [only available](https://twitter.com/decksetapp/status/456534972648550400) for OS X 10.9, while I choose to stay at 10.7 ([long ago](/post/my-setup) again). I know how easy it is to produce [Beamer slides](http://johnmacfarlane.net/pandoc/demo/example9/producing-slide-shows-with-pandoc.html) with Pandoc and Markdown, the advantage being that we are not restricted to HTML+JS output.

Hopefully, this is not the only solution and there are a couple of links about standalone apps or wrappers.

- [Markdown to Slide Presentation](http://caseywatts.github.io/2012/12/12/markdown_to_slide_presentation/): reviews some HTML frameworks, see also [Roundup of HTML-Based Slide Deck Toolkits](http://www.impressivewebs.com/html-slidedeck-toolkits/).

- [Swipe](http://beta.swipe.to/markdown/): offers an online hosting solution (akin to [Rpubs](https://rpubs.com/) or [NBViewer](http://nbviewer.ipython.org/) except that you write your slides online).

- [Markdown Presenter](https://github.com/jsakamoto/MarkdownPresenter): a minimalist wrapper around [Showdown.js](https://github.com/coreyti/showdown).

- [Remark](https://github.com/gnab/remark): another in-browser, markdown-driven slideshow, see <http://remarkjs.com/>.

- [Landslide](https://github.com/adamzap/landslide): a Python-based slideshow system, which Chris Fonnesbeck was using for one of his course:

{{% alert note %}}
<small>[2022-11-08]</small><br>
Unfortunately, the tweet with ID 382960381607809024 has been deleted.
{{% /alert %}}

I'm pretty sure I bookmarked other links from Twitter, but well, that's where Twitter sucks: it's hard to find something you posted or bookmarked, say, three or four months ago. Here is all what I found by looking in my recent tweets:

![chl's tweets](/img/20140417104911.png)

By the way, Pandoc can also [make use of Reveal.js](https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides). Of course, if you are using R as often as I do you may well know that RStudio now has a nice [Presentation mode](http://www.rstudio.com/ide/docs/presentations/overview). That's what I used in my [latest course](http://cogmaster-stats.github.io/site/), although I would have preferred to use [Slidify](http://slidify.org/) (when I started writing this course, I wanted to publish everything on [Rpubs](http://rpubs.com) and RStudio was great for that).
