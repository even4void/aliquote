---
title: "A grammar of graphics for Python"
date: 2023-01-30T13:21:25+01:00
draft: false
tags: ["python", "dataviz"]
categories: ["2023"]
---

I use Matplotlib for all my plots in Python. [Seaborn](https://seaborn.pydata.org/) is becoming a really great way to use Matplotlib backend for statistical graphics. I originally thought it was only working with [Pandas](https://pandas.pydata.org/) data frames, but it also accepts Numpy libraries as well as built-in Python types like lists and dictionaries.

Here is an example of plot from the on-line tutorial:

```python
import seaborn
flights = seaborn.load_dataset("flights")
seaborn.relplot(data=flights, x="year", y="passengers", hue="month", kind="line")
```

To produce this kind of plot using Matplotlib alone, it would requires a lot more instruction as we need to group data by month and use year on the x-axis. The syntax above is mostly comparable with `qplot` from the [ggplot2](https://ggplot2.tidyverse.org/) R package.

This dataset is basically a data structure we studied in [another post](https://aliquote.org/post/stata-plot-01/). To reproduce our earlier small multiples, we would write:[^1]

```python
g = seaborn.relplot(
    data=flights, x="year", y="passengers",
    col="month", col_wrap=4, kind="line",
    linewidth=4, zorder=5, legend=False
)
for month, ax in g.axes_dict.items():
    seaborn.lineplot(
        data=flights, x="year", y="passengers", units="month",
        estimator=None, color=".7", linewidth=1, ax=ax,
    )
```

The `seaborn.relplot` command is used for facetted displays. The on-line doc says that it

> provides access to several different axes-level functions that show the relationship between two variables with semantic mappings of subsets. The kind parameter selects the underlying axes-level function to use

In the above example, the same effect could be achieved using `seaborn.lineplot` instead. There's a lot more commands in the [API](https://seaborn.pydata.org/api.html), msot of them targeting statistical applications (e.g., `rugplot`, `ecdfplot`, `kdeplot`, `strippplot`, `boxplot`). Combined with [statsmodels](https://www.statsmodels.org/stable/index.html) and (scipy](https://scipy.org/), I feel like it provides a complete statistical toolbox for newcomers to Python for statistical munging, albeit with less specialized routines compared to R or Stata.

Next to Seaborn, there's [plotnine](https://plotnine.readthedocs.io/en/stable/), which started to be developed six or seven years ago. Its syntax is even closer to ggplot2, so if you're an R user you may want to start with plotnine directly. For instance, the above plot could be produced as follows:

```python
from plotnine import *
(ggplot(flights, aes("year", "passengers", color="factor(month)")) + geom_line())
```

Note that you don't need to call pyplot's `show()` in this case. The number of [geoms](https://plotnine.readthedocs.io/en/stable/api.html#geoms) that are currently supported make it a good competitor to other ggplot-like alternative in Python. Actually, the [ggplot](https://github.com/yhat/ggpy) package looks staled; I haven't tested [lets-plot](https://lets-plot.org/), and I don't remember the third option I tried a few years ago but it was nothing compared to plotnine.

Our facetted small multiples would then be written as follows:

```python
from plotnine import *
flights2 = flights2.rename(columns={"month": "mmonth"})
(ggplot(flights)
  + geom_line(aes("year", "passengers", color="factor(month)"), size = 3)
  + geom_line(flights2, aes("year", "passengers", group="factor(mmonth)"), color="grey")
  + facet_wrap("~ month", nrow=3)
  + scale_color_discrete(guide=False))
```

{{% music %}}Face The Beat: Session 7 • _Dance My darling -- Love & Hate_{{% /music %}}

[^1]: There's a slightly different illustration of [small multiple time series](https://seaborn.pydata.org/examples/timeseries_facets.html) on Seaborn gallery.
