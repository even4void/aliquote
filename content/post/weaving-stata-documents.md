+++
title = "Weaving Stata Documents"
date = 2012-04-22T10:06:55+01:00
draft = false

tags = ["stata", "tex"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

[StatWeave](http://www.divms.uiowa.edu/~rlenth/StatWeave/) has been recently updated and it has become a powerful engine for weaving [Stata](http://www.stata.com) documents.


## StatWeave

The good news is that we can now use graphical commands with Statweave. There's a minimal working example in the testing suite: [Stata-test.swv](http://www.divms.uiowa.edu/~rlenth/StatWeave/tests/tex/Stata-test.swv). The Statweave package offers some handy customizations like code formatting (see `\StataweaveOpts{}`), and basically all we need to do is to put our Stata code in a `Statacode` environment. For R, we would use a `Rcode` environment. Like with [Sweave](http://www.statistik.lmu.de/~leisch/Sweave/), we can display or hide the code, and ask Statweave to generate a figure like shown in the following example:

```latex
\begin{Statacode}{fig, hide, height=4.5in, width=9in, dispw=4in}
predict g_hat
twoway (scatter gp100m disp) (line g_hat disp, sort), by(foreign)
\end{Statacode}
```

The [STATWEAVE Users’ Manual](http://www.divms.uiowa.edu/~rlenth/StatWeave/StatWeave-manual.pdf) has more informations on running and customizing StatWeave. I think it should not be too difficult to create language-specific files for, e.g. [Julia](https://julialang.org/) or [gsl-shell](http://www.nongnu.org/gsl-shell/).


## Context filter

Nowadays, the Context [filter](https://github.com/adityam/filter) module allows to call external programs, like R, pandoc, or Asymptote, and insert their results into our $\TeX$ document. That's really awesome because it means that we can build dynamic documents that keep in sync with accompanying code or simulation, à la Sweave. There are nice demos in the `tests/` directory in the abobe Github repository.

I tested the R weaving option, and it works quite well although I noticed two minor points: (a) a `proc.time()` command is issued at the end of each R chunk, and (b) we have to explicitly ask to save graphics before embedding them in our document. The first issue is easily solved by modifying the `filtercommand`:

```latex
filtercommand={R CMD BATCH -q --no-timing %
  --\externalfilterparameter{mode} %
  \externalfilterinputfile\space \externalfilteroutputfile}
```

Adding `--no-timing` will ensure R will exit without printing elapsed time. I added another option, `--\externalfilterparameter{mode}`, which allows to write things like

```latex
\startR[mode=slave]
summary(x)
\stopR
```

to get results returned by R only (well, it's a bit crappy but it works). The second issue should easily be solved by saving all graphics into a single PDF file, and using `\externalfigure` command with a `page=` option. This is what I use with <span class="latex">LaT<sub>e</sub>X</span> and it works quite well. So, we could add something like

```latex
\startR[read=no]
pdf("figs.pdf")
\stopR
```

at the beginning of our document, and a `dev.off()` command at the end. This way, we just have to call `\externalfigure` while incrementing page number after each call.

What about Stata?

A basic filter would look like

```
$ stata -q -b do \externalfilterinputfile
```

which tells Stata to process `\externalfilterinputfile` `do` file in batch mode. Again, there are some caveats with the above command: it will leave something like `end of do file` as well as a leading Stat prompt (`.`) at the end of the Stata code chunk.

I wrote a small Bash script to post-process Stata `do` file available as a Gist: 
{{< gist chlalanne 2439496 >}}
It has few options: keep only results (i.e., remove Stata commands), and/or tidy up the log file by removing extra blank lines. If the `do` file includes `-graph export-` commands, they are removed as well. (Almost everything is done with `sed`.)

```
$ ctxstata -h
Usage: /usr/local/bin/ctxstata [-hst] file

This script asks Stata to process a do file and log its output.

OPTIONS:
  -h  --help    show this message
  -s  --slave   slave mode (discard Stata command)
  -t  --tidy    remove all empty lines
```

I defined the following filter:

```latex
\defineexternalfilter
  [Stata]
  [filtercommand={ctxstata --\externalfilterparameter{option} \externalfilterinputfile},
    output=\externalfilterbasefile.log,
    readcommand=\typefile,
    color=typecolor,
    cache=yes,
    label=yes,
    spacebefore=big,
    spaceafter=big,
    continue=yes]
```

For an unknown reason, it works for printing Stata code and results, but it fails rendering images.

So, the following piece of code does not generate an EPS picture

```latex
\startStata
sysuse auto, clear
summarize mpg
twoway scatter mpg weight, by(foreign, total)
graph export mpg.eps
\stopStata
```

while processing a `do` file just happens to work:

```latex
\processStatafile[output=auto.log,option=tidy]{auto.do}
```

That's puzzling, so I guess I'm just missing something obvious or I need to investigate more about the `filter` module behavior.
