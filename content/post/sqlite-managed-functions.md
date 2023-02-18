---
title: "Using managed functions in sqlite"
date: 2023-02-18T10:09:26+01:00
draft: true
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

How do we write a custom function, e.g. a `percentile()` function which would return the percentile rank of an observation in a series of values, without relying on [sqlean](https://github.com/nalgeon/sqlean) or [SQLiteStudio](https://github.com/pawelsalawa/sqlitestudio)? There's a two-part series on this topic, which explains the basics: [Writing a Custom SQLite Function (in C)](https://www.openmymind.net/Writing-A-Custom-Sqlite-Function-Part-1/). In what follows, I will roll my own routine in C and plug it as a custom extension that can be loaded in sqlite command-line shell, which is known as [Run-Time Loadable Extensions](https://www.sqlite.org/loadext.html). Fortunately, there's some boilerplate C code to get started.

{{% music %}}Lauren Bush • _In a Mellow Tone_{{% /music %}}

[^1]: There's also a `total()` function which behaves a little bit differently as it returns "0.0" in case the query returns only NULL values, while `sum()` will return NULL like other SQL variants.
