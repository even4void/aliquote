---
title: "Python and H2O"
date: 2019-12-23T09:40:17+01:00
draft: true
tags: ["python", "statistics"]
categories: ["2019"]
---

Back in [2008](/post/python-scientific-packages/) I started looking at what's available in Python for statistical analysis on OS X. [Few years after](/post/python-for-statistical-computing/), there already was a growing stack of packages. However, I never felt comfortable using Python for data processing other than basic web scraping or bioinformatics stuff. I always found R much more suitable for structured data. In the mean time, I've been following the advance of the [h2o](https://www.h2o.ai) machine learning library for a long time now. I know there are bindings for Scala, Java, R and Python.

I don't really like using the scikit-learn package, but [h2o](http://docs.h2o.ai/h2o/latest-stable/h2o-py/docs/intro.html) or [weka](https://pypi.org/project/python-weka-wrapper3/) are great alternatives in my view, and they are available for R too. Likewise, I don't really like Pandas, but there's spark which also handles data frame-like object. Finally, [plotly](https://plot.ly/python/) is a handy replacement for matplotlib or seaborn, while I can imagine that [dash](https://plot.ly/dash/) could easily replace most of Shiny functionalities at some point. All that to say that I am looking for strong and reliable libraries available cross-platform, in R or Python. Since I'm doing quite a lot of stuff in Python these days, why not take a closer look at the data mining stack available there? Here is a brief review of what I am interested in at the moment. I will probably write separate posts to highlight what features I find particularly useful (or not) and some workflows built upon these tools.



## Spark

Basically, Spark is the successor of Hadoop, with built-in modules for processing streaming or SQL-like data, machine learning or even [graph processing](https://spark.apache.org/docs/latest/graphx-programming-guide.html). It can be run in the console using a Scala or Python backend. In case you use Python, don't forget to set the relevant version of Python you want to use in your shell config, e.g., `export PYSPARK_PYTHON=python3` if you're using Bash or Zsh. If you are an R and/or RStudio user, you probably alredy know the [sparklyr](https://spark.rstudio.com) package. If you're into Python, the corresponding standalone package is [pyspark](https://pypi.org/project/pyspark/). While data frame objects are available on Spark, the core data structure is called Resident Distributed Dataset (RDD), which stands for an immutable (i.e., read-only) partitioned collection of records. Thanks to in-memory processing computation, it alleviates the large time spent in disk IO read/write that is commonly encoutered with Hadoop. The corresponding file format for data import/export is usually [Parquet](https://spark.apache.org/docs/latest/sql-data-sources-parquet.html), while [Spark SQL](https://spark.apache.org/sql/) acts as the main query language to access those columnar data structures. However, you can still rely on [data frames](https://docs.databricks.com/spark/latest/dataframes-datasets/introduction-to-dataframes-python.html). So far, so good. Wanna see Spark in action?



## H<sub>2</sub>O





##  Plotly

Plotly is more a matter of convenience than a real taste, to be honest. While I greatly appreciate the quality of D3 and Vega rendering, I don't like the syntax at all. Having some convenient wrappers to use plotly backend from R or Python is, however, fine with me. The fact that you can build a custom ggplot graphical object and just use `ggplotly()` to get a plotly graph displayed in your browser or a Shiny app is clearly a win.