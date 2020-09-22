---
title: "Routed Gothic"
date: 2020-09-22T20:44:01+02:00
draft: false
tags: ["rstats", "stata", "python"]
categories: ["2020"]
---
Today I configured my current main plotting engines (R, Stata and Python) to use the [Routed Gothic](https://webonastick.com/fonts/routed-gothic/) font. I choose the Narrow variant as it looks prettier for plotting purpose. I discovered this font thanks to [Steve Losh](https://twitter.com/stevelosh/status/1231434196213796864?s=20), which he [now uses](https://hg.stevelosh.com/.plan/#2020-02-23) with Gnuplot. I like this old design stuff a lot, but it's definitively not the best font available for plotting as typography-centric themes (e.g., [hrbrthemes](https://hrbrmstr.github.io/hrbrthemes/)) usually rely on good kerning and tabular figures. Anyway, I wanted to give it a try for a few weeks and see how it goes. After all it took me a long time to make up my mind to opt for JetBrains Mono after three years of Iosevka.

Using this font in R is not really a problem if you're using [ggplot2](https://ggplot2.tidyverse.org/) since it comes as a TTF font. It can be used on the fly, when saving PDF files, or as a theming option. I had this in my `.Rprofile`:

```r
.First <- function() {
  grDevices::quartz.options(width = 6, height = 6)
  grDevices::palette("Tableau10")
  theme_set(theme_light(base_family = "Routed Gothic Narrow"))
}
```

Stata can be configured to use any font you like in your Do-file editor, variable browser/editor, or in the main UI (command + results window). The default font and theme can also be defined for the graphic device. Below is a quick illustration of R and Stata output for the `mtcars` and `auto` datasets.

{{< fluid_imgs
"pure-u-1-2|/img/qplot-disp-mpg.png"
"pure-u-1-2|/img/scatter-price-mpg.png" >}}

Adding a default font for [matplotlib](https://matplotlib.org/) is actually a little bit trickier. I happened to do it as follows:

1. First, you need to copy the default `matplotlibrc` fiel if you haven't one already under your `~/.matplotlib` directory. For me, it was something like : `cp /usr/local/lib/python3.8/site-packages/matplotlib/mpl-data/matplotlibrc .matplotlib`.
2. Next, copy the `*.ttf` font files in the `site-packages/matplotlib/mpl-data/fonts/ttf` directory.
3. Finally, edit the `matplotlibrc` file to add the Routed Gothic Narrow font as the first item under the `font.sans` entry. Mine now looks as follows:

    ```
    font.sans-serif : Routed Gothic Narrow, DejaVu Sans, Bitstream Vera Sans, Computer Modern Sans Serif, Lucida Grande, Verdana, Geneva, Lucid, Arial, Helvetica, Avant Garde, sans-serif
    ```
    Then, you just have to launch `ipython` with the `matplolib` backend enabled and enjoy your new font settings.[^1]

I'm pretty there is a better option, but this works. That's it.

[^1]: I know about various option to have pyplot enabled as an interactive module, but what I use these days is to use a simple startup script located in `.ipython/profile_default/startup` where I set `matplotlib.interactive(True)`.
