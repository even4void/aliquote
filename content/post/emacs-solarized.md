+++
title = "Color schemes for Emacs and TeX"
date = 2011-08-25T11:19:54+01:00
draft = false
tags = ["emacs"]
categories = ["2011"]
+++

I lastly tried the [Solarized](http://ethanschoonover.com/solarized) color theme for Emacs which provides a nifty colorscheme (for light or dark backgrounds). This led me to wonder whether I could use this theme for highlighting code chunks in my $\LaTeX$ documents.

Although it looks great, I gave up on it for Emacs because I had difficulties reading my text with the base color for body text (`base0` or `base00`, depending on the background color). Also, I don't like having different emphasizes for the same code identifier, e.g. `<a href=` where color for `<` is different than for `a`.

## Pygmentize 

[Pygmentize](http://pygments.org/) is very great, and the [Minted](http://code.google.com/p/minted/) $\LaTeX$ is based on it. I already wrote a [post]({{< ref "/post/syntax-highlighting-in-latex.md" >}}) on it.

According to the documentation, it is possible to customize the output and add our own formatter. Let's try a simplified style:

```python
from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
     Number, Operator, Token

class SolarizedStyle(Style):
    background_color = "#fcf4dc"
    default_style = ""
    styles = {
        Token:                  '#52676f',
        Comment:                '#465a61',

        Operator:               '#728a05',       
        Keyword:                '#728a05',

        Name:                   "#a57705",
        Name.Builtin:           '#2075c7',
        Name.Function:          '#2075c7',
        Name.Class:             '#2075c7',

        String:                 '#259185',
        Number:                 '#c61b6e'
    }
```

Then, we need to put this in the `pygments/styles/` folder, in Python `site-packages`. To check that it works,

```
>>> from pygments.styles import get_style_by_name
>>> get_style_by_name('solarized')
```

It should return something like

```
pygments.styles.solarized.SolarizedStyle
```

We can test it with a little Python script, e.g. <i class="fa fa-file-code-o fa-1x"></i> [par_checker.py](http://www.aliquote.org/pub/par_checker.py). Below, from top to bottom are the simplified solarized theme, and the built-in colorful and Tango themes.

![theme1](/img/20110825194440.png)

![theme2](/img/20110825123125.png)

![theme3](/img/20110825123101.png)

I must admit that I still like how the [Tango](http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines) palette looks like. Now, here is how it looks under my Emacs (*top*, solarized; *bottom*, my custom tango palette):

![emacs1](/img/20110825200518.png)

![emacs2](/img/20110825200350.png)

Well, I have to test it into a $\LaTeX$ paper.

## VIM color scheme 

The Tango palette is great. And it is with great irony that I have to use VIM to beautify my code that I'm typing in Emacs. Indeed, as I like working with Context, instead of $\LaTeX$, I was in need of an efficient solution for syntax highlighting. Despite my best efforts with on-line wiki, I raised the question on <http://tex.stackexchange.com>, see [Code highlighting in ConTeXt](http://tex.stackexchange.com/questions/7789/code-highlighting-in-context). At the time I asked on tex.SE, I wasn't able to get it because of my outdated version of Context. Once I updated to the svn version, everything worked well per @Aditya's solution.


Wrapping the above code like this

```
\usemodule[vim]

\starttext
\definevimtyping [PYTHON] [syntax=python]
\startPYTHON
 ### Put code here ###
\stopPYTHON
\stoptext
```

and running

```
$ context par_checker.tex
```

I get the following PDF:

![tex](/img/20110825195205.png)

