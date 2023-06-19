---
title: "Using managed functions in sqlite"
date: 2023-02-19T10:09:26+01:00
draft: false
tags: ["database"]
categories: ["2023"]
---

Sqlite comes with a bundle of [built-in functions](https://www.sqlite.org/lang_corefunc.html) including aggregate functions such as `count()`, `sum()`,[^1] or `avg()`. No function to compute standard deviation, though. There are ways to compute the variance in a query directly, and its square root, but hopefully sqlite3 comes with a set of [extensions](https://www.sqlite.org/contrib?orderby=date) that can be loaded directly into sqlite command. See also [miscellaneous function](https://www.sqlite.org/src/file/ext/misc).

The following assumes that you already downloaded the `extension-functions.c` from the link above file and compiled it as shared library. On Linux, this is as easy as:

```shell
% gcc -g -fPIC -shared extension-functions.c -o extension-functions.so
```

Here is a toy example:

```sql
sqlite> .load ./extension-functions
sqlite> create table data(x real not null);
sqlite> insert into data select (abs(random() % 10)) as x from generate_series(1, 20);
sqlite> select round(stdev(x), 2) as sd from data;
sd
----
2.56
```

<small>Note that [`generate_series()`](https://sqlite.org/series.html) is already loaded in the command-line shell.</small>

How about writing a custom function, e.g. a `percentile()` function which would return the percentile rank of an observation in a series of values? There's a two-part series on this topic, which explains the basics: [Writing a Custom SQLite Function (in C)](https://www.openmymind.net/Writing-A-Custom-Sqlite-Function-Part-1/). Such functions are known as [Run-Time Loadable Extensions](https://www.sqlite.org/loadext.html), and there's some boilerplate C code to get started.

If you are in a hurry, though, [sqlean](https://github.com/nalgeon/sqlean) provides a bunch of domain-specific functions.[^2] In the case of statistical functions, you will find the median, various pre-defined percentile as well as a percentile rank function, Pearson correlation coefficient, as well as sample and population estimate of the variance or the standard deviation, and [many](https://github.com/nalgeon/sqlean/issues/27#issuecomment-1000902666) [more](https://github.com/nalgeon/sqlean/issues/27#issuecomment-1002703581). Installation is quite simple since there are binaries available for each OS.

```sql
sqlite> .load ./stats
sqlite> create table data(x real not null);
sqlite> insert into data select (abs(random() % 10)) as x from generate_series(1, 20);
sqlite> select avg(x) as avg from data;
avg
----
4.55
sqlite> select percentile(x, 25) as p25, percentile(x, 50) as p50, percentile(x, 75) as p75 from data;
p25  p50  p75
---  ---  ---
2.0  5.0  7.0
```

{{% alert note %}}
<small>[2023-06-19]</small><br>
Recently, sqlean was made available for Python as a dedicated package, see [Python's sqlite3 with extensions](https://antonz.org/sqlean-py/).
{{% /alert %}}

{{% music %}}Lauren Bush • _In a Mellow Tone_{{% /music %}}

[^1]: There's also a `total()` function which behaves a little bit differently as it returns "0.0" in case the query returns only NULL values, while `sum()` will return NULL like other SQL variants.
[^2]: See also [SQLiteStudio](https://github.com/pawelsalawa/sqlitestudio) which seems to provide a function editor.
