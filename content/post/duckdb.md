---
title: "Processing large data: Duckdb vs. datatable"
date: 2023-02-17T19:06:33+01:00
draft: false
tags: ["python", "database"]
categories: ["2023"]
---

I read Rasmus Bååth's last post, [Three strategies to tackle Big Data in R and Python](https://www.sumsar.net/blog/three-strategies-for-big-data/), and I thought I would run my own benchmark on [duckdb](https://duckdb.org/) with the data discussed in my review of [Exploratory Desktop](/post/exploratory-desktop-app/) some years ago.[^1] Moreover, I'm interested in trying out Python [datatable](/post/python-datatable/) `fread` function.

Duckdb has long been a database backend I wanted to try, along with [TileDB](https://github.com/TileDB-Inc/TileDB) (I followed [Dirk Eddelbuettel](https://github.com/eddelbuettel) work on its R frontend, but go checkout [his website](https://dirk.eddelbuettel.com/) for more information; I also warmly recommend his online course on [Data Science Programming Methods](https://stat447.com/)).

Let's benchmark loading some data then. I fetched data for year 2021 (1.6 Go), which includes 3,669,928 records according to the [codebook](https://data.nber.org/nvss/natality/code/nat2021us.html).[^2] For the sake of comparison, loading the same data file in sqlite took less than 1,5 minutes, with little RAM caching. Simple queries are a breeze as expected, although I forgot to enable proper timing (`.timer on`):

```sql
sqlite> .mode csv nat2021us
sqlite> .import nat2021us.csv nat2021us
sqlite> SELECT DISTINCT dob_mm, COUNT(*) AS count FROM nat2021us GROUP BY dob_mm ORDER BY CAST(dob_mm AS UNSIGNED) ASC;
dob_mm,count
1,277533
2,266725
3,303139
4,293630
5,301343
6,314024
7,326611
8,330740
9,326280
10,315909
11,302309
12,311685
```

Now using `duckdb`:

```python
import duckdb
import time

tic = time.time()
con = duckdb.connect(database='duckdb_python_db')
con.execute('drop table if exists nat2021us')
con.execute("""
  create table nat2021us as
  select * from read_csv_auto("nat2021us.csv")
""")
toc = time.time()
con.close()
print(f"Elapsed time: {(toc-tic) * 10**3:.2f} ms")
```

It shortly raised 99% but then we have to wait for about 1 minute for the data to be available at the IPython prompt:

```
100% ▕████████████████████████████████████████████████████████████▏
Elapsed time: 62689.09 ms

```

And here is the `datatable` approach:

```python
import datatable as dt

tic = time.time()
nat2021us = dt.fread("nat2021us.csv")
toc = time.time()
print(f"Elapsed time: {(toc-tic) * 10**3:.2f} ms")
```

I was a little bit surprised at first: it took less than 5s (!) , without much more RAM caching:

```
100% |██████████████████████████████████████████████████| Reading data [done]
Elapsed time: 4136.24 ms
```

Then, again results are computed at the speed of light:

```python
In [4]: nat2021us[:, dt.count(), dt.by(dt.f.dob_mm)]
Out[4]:
   | dob_mm   count
   |  int32   int64
-- + ------  ------
 0 |      1  277533
 1 |      2  266725
 2 |      3  303139
 3 |      4  293630
 4 |      5  301343
 5 |      6  314024
 6 |      7  326611
 7 |      8  330740
 8 |      9  326280
 9 |     10  315909
10 |     11  302309
11 |     12  311685
[12 rows x 2 columns]
```

Clearly, the `datatable` package is a winner here. I'll keep these quick results in mind when I have to load large datasets in Python.

{{% music %}}Latarnik • _Marianna_{{% /music %}}

[^1]: See also [Processing large CSV files](/post/processing-large-csv-files/).
[^2]: National Center for Health Statistics (2021). Data File Documentations, U.S. Natality Data Files, 2021 (machine readable data file and documentation, CD-ROM Series), National Center for Health Statistics, Hyattsville, Maryland.
