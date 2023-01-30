---
title: "Python Plotnine"
date: 2023-01-30T13:21:25+01:00
draft: true
tags: []
categories: ["2023"]
---

I use Matplotlib for all my plots in Python. [Seaborn](https://seaborn.pydata.org/) is becoming a really great way to use Matplotlib backend for statistical graphics. I originally thought it was only working with [Pandas](https://pandas.pydata.org/) data frames, but it also accepts Numpy libraries as well as built-in Python types like lists and dictionaries.

Here is an example of plot from the on-line tutorial:[^1]

```python
import seaborn
flights = seaborn.load_dataset("flights")
seaborn.relplot(data=flights, x="year", y="passengers", hue="month", kind="line")
```

To produce this kind of plot using Matplotlib alone, it would requires a lot more instruction as we need to group data by month and use year on the x-axis. The syntax above is mostly comparable with `qplot` from the [ggplot2](https://ggplot2.tidyverse.org/) R package.

{{% music %}}XXX • _XXX_{{% /music %}}

[^1]: This is basically a data structure we studied in [another post](https://aliquote.org/post/stata-plot-01/).
