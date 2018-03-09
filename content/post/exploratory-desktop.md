+++
title = "Exploratory Desktop"
date = 2018-01-21T14:04:43+01:00
draft = true
toc = true
autoCollapseToc = true
tags = ["review", "software"]
categories = []
+++

Here's the January review of tech software. 

In this article, we will talk about [Exploratory Desktop](https://exploratory.io), a fresh approach to visual analytics and interactive dashboard. 

I have been following the development of Exploratory since its inception, or when the very first beta was released. It is continuously updated and it has smoothly evolved towrad a full-featured UI for exploratory and, more recently, explanatory data analysis. For the latest news (version 4.2), see the [blog post](https://blog.exploratory.io/exploratory-v4-2-released-dashboard-new-analytics-new-charts-and-more-ee5d8aab1adc) from Exploratory team.

At its heart, there is the open-source [R](http://www.r-project.org) statistical software and the [tidyverse](https://www.tidyverse.org) ecosystem. The original idea of Exploratory is to propose a clean UI that allows to 


When you first launch Exploratory, it will install the latest R release and around 170 required packages. Everything goes under your home directory (`~/.exploratory` on my Mac) so that it does not interfere with existing installation of R or related packages.

![The initialization step](/img/2018-01-04-17-52-24.png)



## Let's get started: importing some data

The data used throughout this review were fetched from the [National Bureau of Economic Research](http://www.nber.org/data/vital-statistics-natality-data.html) (NBER) but are otherwise available on the [CDC portal](https://www.cdc.gov/nchs/nvss/births.htm). They are available in CSV or Stata format. Note that the CSV file is 2.2 Gb and contains 3,956,113 records. The Stata file is more convenient since variables are already labelled and in the right format. It is as easy to import a delimited text file than proprietary formats like Stata or SAS, thanks to the [haven](http://haven.tidyverse.org) package. It took about 2-3 min to preview and load the data in Exploratory on a Macbook Retina 12” running High Sierra with 8 Gb RAM (the process eats up all my RAM due to other applications running in the background, though).


Here are some benchmarks using more (compared to base R `read.csv()` function) or less (default options for [data.table](http://r-datatable.com) and [readr](http://readr.tidyverse.org) were used) efficient approaches to load the data in CSV format right into R:

- `data.table::fread()` takes 56 sec; `object.size()` gives me 4512.4 Mb 
- `readr::read_csv()` takes 193 sec; `object.size()` gives me 4784.1 Mb (Python `pandas.read_csv()` is a winner of a little on that one with 163 sec)

In comparison, loading the Stata file in Stata is almost instantaneous. Since Exploratory also accepts database connection, we could load the data into a dedicated PostgreSQL table and work from there. There are various ways to import CVS data into SQL. One approach is to use `COPY` (and I believe it is the faster option in our case), another approach relies on Python with, e.g., `csvsql` from [csvkit](http://csvkit.readthedocs.io/en/1.0.2/) or [Pandas](https://pandas.pydata.org)'s `to_sql()` utility. Yet another way is to use [pgloader](http://pgloader.readthedocs.io/en/latest/). Pure PostgreSQL solution require that we provide field specificatons (name and storage mode) for the table. Fortunately, the NBER provides a Stata dictionary that can be used to fill out the required information, pending some minor formatting issues that were handled using Perl.

To sum up, a straightforward technique from a Terminal is to use "csvkit" command-line tools:

    $ createdb natl2016
    $ csvsql --db postgresql://5432/chl --table natl2016 --insert natl2016.csv

Using "pgloader", I happened to populate a PostgreSQL table using a custom [command file](http://aliquote.org/pub/natl2016.load): 

    $ pgloader natl2016.load

I should note that it is also possible to work on a sample of the dataset


## Data munging


## Statistical modeling


## Reporting
