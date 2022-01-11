---
title: "Pandoc templates are great"
date: 2022-01-10T21:17:41+01:00
draft: true
tags: ["tex"]
categories: ["2022"]
---

In my previous post, I talked about writing Org file in Vim. While I much prefer the Org format, I often fall back on Markdown as the default markup for plain text files. I devised several Pandoc templates over the years, especially for RMarkdown documents. As discussed in an [older post of mine](/post/latex-beamer-21-century/), I use a Makefile and a YAML header to process my text MArkdown or RMarkdown documents. Having a separate YAML header as well as plain $\LaTeX$ file to add custom macros make it easy to define a common template for a series of handouts. The main font is Fira Sans, and its derivation (Fira Sans Condensed and Fira Code). It took me a longer time to understand how to use ligatures in listings-based code block. I've used various workarounds, like using Unicode characters (e.g., for the R assignment operator, `<-`) or additional $\LaTeX$ packages for verbatim environments. Finally, the solution is quite easy once you learn it: Just add the [lstfiracode](https://github.com/RuixiZhang42/lstfiracode) package, and customize your listings settings as follows: `\lstset{basicstyle=\small\ttfamily, style=FiraCodeStyle, ...}`.

Lately, I've also used the Eisvogel template for some handouts. It works great, its design favors simple (sans) defaults, but I don't really like the default settings for code chunks, for example. Needless to say, I wrote my own custom template to export Org file to Latex Tufte handout via Pandoc, as discussed elsewhere on this blog. I also have a similar workflow for Md -> Tex export, without using the Tufte handout Latex class. It reimplements part of the Tufte layout, but it relies on different base fonts (Fira and STIX Two Math) and verbatim environments. Here is an excerpt:

```latex
\usepackage[a4paper, left=1cm, right=8cm, top=1cm, bottom=1cm,
marginparwidth=6.5cm]{geometry}
\usepackage{sidenotes}
\usepackage{sectsty}
\subsectionfont{\color{DarkSlateGrey}}
\usepackage{titlesec}
\titlespacing{\section}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\renewcommand{\baselinestretch}{1}
\usepackage[justification=justified, singlelinecheck=false]{caption}

\DeclareCaptionFont{white}{\color{white}}
\DeclareCaptionFormat{listing}{\hspace*{-3.5pt}%
  \parbox{\textwidth}{\colorbox{LightSlateGrey}{\parbox{\dimexpr\textwidth+1pt}{#1#2#3}}\vskip2.8pt}}
\captionsetup[lstlisting]{labelformat=empty,format=listing,labelfont=white,textfont=white}

\renewenvironment{figure}[1][width=\marginparwidth]
  {\begin{marginfigure}}
  {\end{marginfigure}}

\renewcommand{\footnote}[1]{\let\thesidenote\relax\sidenotetext{#1}}
```

Finally, a long time ago (if memory serves it was in 2009), I got inspired by Kieran Healy's [own templates](https://github.com/kjhealy/pandoc-templates) and I devised a simple Xe$\LaTeX$ article-based Pandoc template which used another set of great fonts:[^1]

```latex
\usepackage[xetex,
            colorlinks=true,
            urlcolor=BlueViolet,
            citecolor=greeny,
            filecolor=,
            linkcolor=greeny,
            plainpages=false,
            pdfpagelabels,
            bookmarksnumbered,
            pdftitle={\mytitle},
            %pagebackref,
            pdfauthor={\myauthor},
            pdfkeywords={\mykeywords}]{hyperref}

\setromanfont[Mapping={tex-text},Numbers={OldStyle},%
              Ligatures={Common}]{Minion Pro}
\setsansfont[Mapping={tex-text},Scale=0.9]{Myriad Pro}
\setmonofont[Mapping=tex-text,Colour=AA0000,Scale=0.9]{Inconsolata}
```

Today, I decided to rehabilitate this template using a much simpler Pandoc template, and to replace the Fira font triumvirate with the above settings. Rather than writing a separate YAML header, I put the header directly into the Markdown file.

```markdown
---
mainfont: Minion Pro
sansfont: Myriad Pro
monofont: Fira Code
mathfont: STIX Two Math
monofontoptions: [Scale = 0.8, Numbers = Lining, BoldFont = Fira Code Medium, Contextuals = Alternate]
mainfontoptions: [Numbers = OldStyle, Ligatures = Rare]
mathfontoptions: [Scale = MatchLowercase]
fontsize: 9pt
linestretch: 1
classoption: [svgnames]
lang: fr-FR
citecolor: DarkSlateGrey
urlcolor:  SlateGrey
linkcolor: SlateGrey
link-citations: true
bibliography: /home/chl/Documents/notes/references.bib
csl: apa-fr-provost.csl
header-includes:
    - \defaultfontfeatures{Extension = .otf}
    - \usepackage{fontawesome}
    - \usepackage{lstfiracode}
    - \usepackage{setspace}
    - \AtBeginEnvironment{quote}{\sffamily\raggedright\frenchspacing\setstretch{1.0}}
    - >
      \lstset{basicstyle=\small\ttfamily,
      style=FiraCodeStyle,
      commentstyle=\color{DarkSlateGrey},
      frame = single,
      rulecolor = \color{LightSlateGrey}}
---
```

Here is a side by side preview of both variants (Adobe fonts on the left, Fira on the right):

{{< fluid_imgs "pure-u-1-2|/img/template_adobe.png"
               "pure-u-1-2|/img/template_fira.png" >}}

[^1]: See also [What best combination of fonts for Serif, Sans, and Mono do you recommend?](https://tex.stackexchange.com/questions/9533/what-best-combination-of-fonts-for-serif-sans-and-mono-do-you-recommend)
