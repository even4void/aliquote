---
title: "Latexing in the 21st century"
date: 2020-02-13T10:07:42+01:00
draft: false
tags: ["tex"]
categories: ["2020"]
---

What about $\LaTeX$ nowadays? I haven't written a single TeX document since 4 years or so, and even when I was delivering statistical reports every month or so, I relied mostly on RMarkdown whenever possible. When I needed to switch to Latex-based solution (knitr or Sweave), this was mainly because of a high load of tabular outputs or because I needed some fine tuning regarding figure placement. Along the years, I started replacing the standard "tex $\rightarrow$ dvi $\rightarrow$ ps $\rightarrow$ pdf" workflow with `pdflatex`, then `xelatex` to get unicode support and nice fonts, and finally `lualatex`. I had my moments where I was using exclusively [Context](http://www.pragma-ade.com), but it was tricky to do litterate programming with R or Stata in this environment. In the mean time, I also happened to write small documents using plain TeX, because you know: $\LaTeX$ is just for kids, we could just be fine using Context or TeX.

Now that we have luatex, I realize that we could perfectly write a plain TeX document using our preferred font at zero cost. Consider the following snippet of teX:

```latex
\ifdefined\directlua
  \input luaotfload.sty
\fi
\font\tenrm="Alegreya" at 10pt
\tenrm

\parindent 0pt

The foundations of the rigorous study of {\it analysis} were laid in the nineteenth century, notably by the mathematicians Cauchy and Weierstrass. Central to the study of this subject are the formal definitions of {\it limits} and {\it continuity}.
Let $D$ be a subset of $\bf R$ and let $f \colon D \to {\bf R}$ be a real-valued function on $D$. The function $f$ is said to be {\it continuous} on $D$ if, for all $\epsilon > 0$ and for all $x \in D$, there exists some $\delta > 0$ (which may depend on $x$) such that if $y \in D$ satisfies $$|y - x| < \delta$$ then $$|f(y) - f(x)| < \epsilon.$$
One may readily verify that if $f$ and $g$ are continuous functions on $D$ then the functions $f+g$, $f-g$ and $f\cdot g$ are continuous. If in addition $g$ is everywhere non-zero then $f/g$ is continuous.
```

Below is the result when compiled with `luatex`:

![luatex](/img/2020-02-13-10-24-48.png)

This is not just to use nice looking fonts. Unicode support also enables the use of accented letters (which are quite useful in French or German) and instead of `\'e` we can now simply write `é` as we would do in a Latex document. Yet, we are missing lot of goodies in plain TeX, like verbatim, Figure or Table environments, but it is not too hard to find useful macros that do the job well. If you haven't read [TeX for the Impatient](https://www.gnu.org/software/teximpatient/) (available in English and in French), go check the code in your TeX distribution.

Next, what about Latex presentations? For as long as I remember, I never liked the default Beamer theme --- you know this one with header and footer banners all in royal blue, which everyone was bringing to each conference back in the 2010s. Yet, customizing Beamer could be tricky at that time. Hopefully, we got new themes, until the last one which came to replace the default blueish one: Metropolis (originally [mtheme](https://github.com/matze/mtheme)). Then, Beamers' start using it, and this was the new de facto standard in the slideshow industry. I ended up using either Context when writing slides for conferences or courses, or custom Beamer templates, but it sucked at some point. I stopped giving lectures some years ago, but during my last year of teaching, I decided to start from scratch with Beamer. You know [which theme](https://hartwork.org/beamer-theme-matrix/) is best? The minimal one: no header or footer, no sidebar or navigation buttons whatsoever, no fancy title/subtitle or bullet points. Here is what I ended with:

{{< fluid_imgs "pure-u-1-3|/img/2020-02-13-14-31-36.png"
               "pure-u-1-3|/img/2020-02-13-14-31-46.png"
               "pure-u-1-3|/img/2020-02-13-14-32-06.png" >}}

Nothing fancy, but a nice looking sans serif font (Fira), with a condensed variant for quotation, neutral color, and figures displayed on full slide. The full set of slides is available on [Github](https://github.com/even4void/rstats-ssample) in case you are interested, but here is the gist of the Beamer configuration. First, I wrote the slides using Markdown, and let Pandoc process the text file using `xelatex` and a custom YAML header. I am always using a Makefile because I tend to forget how I compile my documents, so here it is:

```
TARGET := $(patsubst %.md,%.pdf,$(wildcard *.md))

.PHONY: all clean

all: $(TARGET)

%.pdf : %.md
	pandoc -s --pdf-engine=xelatex --filter pandoc-citeproc --listings -t beamer $^ header.yaml -o $@

clean:
	rm -f $(TARGET)
```

The YAML header itself provides very basic customization, like fonts, colors and bibliography, and the remaining of the custom theme happens in a TeX file, where I removed everything I found too visually heavy in the default themes. Again, see the Github repository to see how I did. Anyway, this was a really great exercise at that time, since I got a working slideshow with minimal friction during the writing stage: writing in Markdown is still a lot faster. The harder part was to write the custom template. But this has always been the case. The only advantage, now, is that it is much easier to use any font available on our OS.

{{< fluid_imgs "pure-u-1-3|/img/2020-02-13-14-54-15.png"
               "pure-u-1-3|/img/2020-02-13-14-54-35.png"
               "pure-u-1-3|/img/2020-02-13-14-54-45.png" >}}
