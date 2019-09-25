---
title: "From Beamer to Deckset"
date: 2014-08-17T22:03:32+01:00
draft: false
tags: ["apple", "tex", "app"]
categories: ["2014"]
---

Now that I [upgraded to Mavericks](/post/os-x-mavericks) (OS X 10.9), I decided to give a try to [Deckset](http://decksetapp.com) which I mentioned in a previous post on [Markdown and slideshow](/post/markdown-and-slideshow).

## What is Deckset

The idea of Deckset is that you write simple Markdown (like when using [Pandoc](http://johnmacfarlane.net/pandoc/)) and slides are formatted using gorgeous themes.

![Deckset](/img/2014-08-16-12-53-35.png)

Slides are rendered as you type your Markdown slides, which is pretty handy, and figures can be displayed in different manner (fit to screen, left- or right-aligned, filtered, or at a specific % of the original size). Any editor that supports Markdown editing (well, basically all text editors) can be used, which means that I can write in Emacs. In fact, Deckset is better described as a presenter not an authoring tool. Unlike Pandoc, it is a paid application (available on the AppStore). It is something to consider if you are happy with Keynotes or Beamer.

## Illustration

In what follows, I will use some materials I wrote for a training in [Biostatistics with R](/cours/2012_biomed/). Initially, I used a combination of Pandoc and a custom Beamer template to process a set of Markdown files (with a bit of pure LaTeX instructions, though). This way, I was able to focus on the content rather than the layout. It took me some time, however, to get the definitive look-and-feel that I was looking for. If you are interested, see my [beamer.latex](/pub/beamer.latex) template and the [Makefile](/pub/Makefile) I used to generate the PDF slides. Here is what it looks like:

![02-eda](/img/2014-08-17-11-35-08.png)

<small>(The complete slides are here: [02-eda.pdf](/cours/2012_biomed/02-eda.pdf).)</small>

And here is what I was able to achieve with a default grey theme:

![02-eda-bis](/img/2014-08-17-11-39-05.png)

The same slide with a white background:

![02-eda-ter](/img/2014-08-17-12-15-36.png)

Changing theme is really easy and it applies globally.

![theming](/img/2014-08-17-12-15-53.png)

Here is the final [PDF output](http://aliquote.org/pub/slides.pdf). Note that this uses the nice [PTmono](https://www.google.com/fonts/specimen/PT+Mono) and [Lato](https://www.google.com/fonts/specimen/Lato) fonts.

Some remarks:

- I had to split some of the slides into two or more slides, because of the default font for the theme I choose. There's probably a way to change the font size, but it looks pretty good as it stands. Also, Deckset automatically scale down blocks of code when there is not enough free space on the slide. This is another reason to break down the original layout.
- Unfortunately, Dekset is not able to render $\LaTeX$ mathematical symbols using MathJax at the moment.
- Deckset doesn't seem to like Emacs `auto-fill` very much (like [Marked.app](http://marked2app.com), in fact), and I had to unfill all paragraphs in the original Markdown file.


## Pros and cons

On the Pro side, Deckset is easy to use and it provides live preview, much like Apple Keynote. It further allows to write down in Markdown, which is pretty good, and it has built-in syntax highlighting for many programming languages. Finally, images are handled very decently (although not shown above). If you like text-based editing, doesn't care about complex layouts (which might be a good idea for visual presentation after all), and do not make heavy use of mathematical notation, then Deckset is worth to take a look.

Minor annoyances are: no MathJax support (see above), no way to customize theme easily or syntax highlighting (in my Beamer presentation, I customize `lstlistings` to highlight all R language-specific keywords).
