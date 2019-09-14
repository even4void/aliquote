+++
title = "Visualizing results from SQL queries"
date = 2012-11-23T15:28:56+01:00
draft = false
tags = ["database", "apple"]
categories = ["2012"]
+++

Most statistical or dedicated software can process data stored in SQL databases and plot results from specific queries. There are also custom applications that allow to display query results, like [DbVisualizer](http://www.dbvis.com).

<!--more-->

I recently installed a full-featured binary package of PostgreSQL, [Postgres.app](http://postgresapp.com), which I find particularly convenient to work with database on my Mac since it generally comes with an up to date Postgres system, as well as [PostGis](http://postgis.refractions.net) and [PLV8](http://code.google.com/p/plv8js/wiki/PLV8) (which I haven't explored yet). From the same author, there is also a nice GUI for querying and visualizing results as basic charts (actually, points or lines scatterplot, and donuts, i.e. much less features compared to [DbVisualizer](http://www.dbvis.com)): [Induction](http://inductionapp.com) <i class="fa fa-chain-broken fa-1x"></i>. The list of [upcoming features](https://github.com/Induction/Induction/blob/master/README.md#roadmap) <i class="fa fa-chain-broken fa-1x"></i> looks really impressive although I doubt all tasks will be completed tomorrow. Anyway, that's an interesting project because there are several connectors (PostgreSQL, Redis, sqlite and MongoDB) and it is just free.

To connect to a running Postgres, just enter the following information

```
postgres://chl@localhost:5432
```

that is: your login name, `@`, host and port where the server is running.

## A toy example

I will used the <i class="fa fa-file-code-o fa-1x"></i> [auto](http://aliquote.org/pub/auto.txt) dataset which I saved as a plain text file on my hard drive. Here is a brief sketch of the SQL statements: (This assumes there is a database named `datasets`.)

```sql
chl=# \c datasets
datasets=# CREATE TABLE auto (MAKE char(20), PRICE real, MPG real, REP78 real, HEADROOM real, 
                              TRUNK real, WEIGHT real, LENGTH real, TURN real, DISPLACEMENT real, 
                              GEAR_RATIO real, FOREIGNER real);
datasets=# COPY auto FROM '/Users/chl/Documents/data/auto.txt' DELIMITERS ',' CSV HEADER;
datasets=# SELECT make FROM auto WHERE rep78 = -999;
datasets=# UPDATE auto SET rep78 = NULL WHERE rep78 = -999;
datasets=# SELECT * FROM auto LIMIT 5;
```

Here is the table viewed from Induction:

![Viewing a table](/img/20121123120510.png)

And here is a little query (with syntax highlighting and auto-complete):

![Writing a query](/img/20121123120935.png)

Finally, a simple scatterplot (nothing fancy, of course):

![Plotting a scatterplot](/img/20121123121050.png)

The plotting framework is held on a separate Github repository: [LiesDamnedLies](https://github.com/Induction/LiesDamnedLies) and I noticed it included a [D3](http://d3js.org) backend, but for the moment data visualization remains static. I hope this open source project will go beyond the alpha stage because it might well be a handy and free alternative to existing software (e.g. DbVisualizer at $179/year).


### Sidenote

There are certainly a ton of papers dealing with vizualisation of database queries. I found some old work from the Stanford Graphics group,

1. Stolte, C., Tang, D., and Hanrahan, P. (2002). [Query, Analysis, and Visualization of Hierarchically Structured Data using Polaris](http://graphics.stanford.edu/papers/polaris_olap/).
2. Stolte, C., Tang, D., and Hanrahan, P. (2008). [Polaris: a system for query, analysis, and visualization of multidimensional databases](http://graphics.stanford.edu/papers/polaris/). *Communications of the ACM* 51(11): 75-84.

Also, one can find a lot of communications or abstracts on `visual query language` (e.g. [Databases will Visualize Queries too](http://www.vldb.org/pvldb/vol4/p1498-gatterbauer.pdf) by Wolfgang Gatterbauer, but see <http://queryviz.com>) which has nothing to do with what I was looking for! Other solutions include embedding some JS backend into your database system, like in [Visualize Your Oracle Database Data with JFreeChart](http://www.oracle.com/technetwork/articles/marx-jchart-085298.html). There's also [Google Chart Tools](https://developers.google.com/chart/interactive/docs/queries) but this is probably another story. 
