---
title: "Working with large data files"
date: 2019-03-05T14:40:00+01:00
draft: false
type: "tweet"
---

As I am using Postgresql a lot these days, I thought I would import a large CSV
file (1 Go) to see if I can play with in-database tools from [dplyr & Co](https://db.rstudio.com/dplyr/). I will
probably need this for work so it's worth the effort. I started with a Stata
file that I read using [haven](https://haven.tidyverse.org), and I converted it to a CSV using
`data.table::fwrite`. This already eated up all my RAM. Now, I'm using [csvkit](https://csvkit.readthedocs.io/) to
import the CSV file into a Postgresql local database. Well, it says a lot about
the process:

{{< figure src="/img/2019-03-05-14-34-55.png" >}}
