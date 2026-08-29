---
title: "CONTEXT once and for all"
date: 2026-08-25T20:36:42+02:00
draft: false
tags: ["tex"]
categories: ["2026"]
---

I've kept installing the latest MacTeX distribution on my MacBook for as long as
I remember having a Mac. I never used MS Word (except for occasional
proof-reading of scientific papers), and when it was absolutely necessary to
produce a DOC (then a DOCX) document, I wrote everything in Pages and then
exported it to the desired format. Working with MS format in Pages was (and is
still) a pain because you always end up exporting the final version each time.
Importing and exporting after each major revision has always felt like a pain in
the ass. And working with BibTeX was never an option. Yes, we could use Endnote
in principle, should we were willing to loose cross-references after exchanging
the file with a colleague. I transferred my licence to a former colleague of
mine. Anyway, I always wrote in $\LaTeX$ since my PhD, although I never really
like the plethora of packages which need to be part of the whole document.[^1]
I'm talking using the base classes like article or report, not more elaborated
stuff like KOMA-Script, memoir & Co. Now I don't even know what the state of the
art is: what is the mandatory set of default packages to include, should we use
lualatex only, who's still using the dvi-ps-pdf toolchain, should lmodern be the
default font now? I stopped following best practices and I spent years letting
Pandoc do all the job of converting my Markdown document for me, although
Markdown remains very limited in its basic form. But you know how it is -- we've
got a report to produce by tomorrow, we're already running late, and we're not
20 anymore, so we can't spend hours pulling all-nighters trying to impress our
colleagues.

I had a great time with Org, then plain $\TeX$, and now I remember that I've
only been tied to $\LaTeX$ because of literate programming with R or Stata. I
had my time with Sweave, knitr, now quarto. I also had good times with noweb and
statweave. Remember the 2000s? The only format I've always felt comfortable with
was CONTEXT, though. Sadly, I only spent a few years writing in CONTEXT. This
was in 2008-2010, BibTeX support was already there, the simple-slides and filter
modules written by Aditya Mahajan were already useable, CONTEXT felt closer to
plain $\TeX$, and the documentation was already excellent. The design of this
website was largely inspired by that of the [PRAGMA Advanced Document
Enginnering][1] itself -- check the Wayback machine if you like. But literate
programming was the clear winner at that time. I had reports to produce every
week or so, and knitr soon became the *de facto* typesetting system. I may have
produced more than a thousand of such reports over a period of 10 years,[^2] and
all of this was perfectly reproducible. I can still run some of those reports 10
years later. But that's not the point.

$\LaTeX$ and Beamer. I can't count the number of times I've seen the same slides
being shown at conferences or internal meetings, all based on standard Beamer
templates. Yes, there was an alternative, Metropolis (originally [mtheme][2] --
the so-called modern $\LaTeX$ Beamer theme), and everyone started using that
theme. How come nobody wrote their own template? I had to resort to foiltex or a
stremlined version of Metropolis (now forked as [Moloch][3]) to feel like I have
something to say about clear presentation and typography without all the hassle
of configuring $\LaTeX$ options.

It's appalling to see that the scientific publishing machine (think AMSTeX,
arXiv, etc.) has imposed such a stranglehold on $\LaTeX$ that CONTEXT found no
place within the system. Yet, it comes battery included. You will rarely need to
include third-party modules, or even redefine default behavior, and typesetting
math is far superior to that of LaTeX without specifying any options at all.
Although I only used CONTEXT to process my slides and posters back in the days
(around 50 in 10 years!), I now want to write everything using the new
typesetting system.[^3]

{{< figure src="/img/2026-08-25-21-41-35.png" >}}

There are thousands of pages of [documentation][4] published on all aspects of
CONTEXT. I do not even speak of journal entries and magazines available online.
This is not texdoc or the not so short intro to $\LaTeX$. You get all the
details, and all the templates from the talks given all around during the past
15 years.

{{< figure src="/img/2026-08-25-22-02-22.png" caption="Hans Hagen (PRAGMA ADE, Hasselt, NL)" >}}

The CGJ, MAPS and PRACJOURN templates are available in your TL distribution. The
[TeX-sidenotes][5] package provides you with the Tufte handout for free as well.
I devised a dozens of templates for TeXShop in less than an hour with all those
resources. Hopefully I still have my old templates from the old me and I guess
I'll just need to adapt the environments a little.

I warmly recommend you give CONTEXT a try if you're tired of $\LaTeX$ or MS
Word. Don't be afraid, despite the large number of available commands, you can
get started with as few as a [dozen of commands][6] or so, so let's
`\starttext`:

{{< figure src="/img/2026-08-27-11-35-36.png" caption="Source: <i>CONTEXT: the manual</i> (old version)" >}}

[1]: https://www.pragma-ade.nl
[2]: https://github.com/matze/mtheme
[3]: https://moloch.ink
[4]: https://wiki.contextgarden.net/Documentation
[5]: https://github.com/andythomas/TeX-sidenotes/
[6]: https://mirror.gutenberg-asso.fr/tex.loria.fr/formats/context/cont-enp.pdf
[7]: https://tex.stackexchange.com/users/270600/max-chernoff

[^1]: I don't even speak of writing in French back in the days (circa 2000).

[^2]: And again, I don't even speak of the number of times I was asked if I
    could produce an Excel table instead of my nicely formatted PDF report.

[^3]: Quoting [Max Chernoff][7] on TeX.SE: "The most recent version of ConTeXt
    is included in TeX Live, but TeX Live also includes the older versions.
    context <filename>.tex will compile with the latest version (MkXL), context
    --luatex <filename>.tex will compile with the slightly older version (MkIV),
    and texexec <filename>.tex will compile with the oldest version (MkII)."

{{% music %}}The March Violets • *Rich City*{{% /music %}}
