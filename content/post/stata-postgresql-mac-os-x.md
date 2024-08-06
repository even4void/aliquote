---
title: "ODBC drivers on Mac OS X"
date: 2012-11-24T15:28:38+01:00
draft: false
tags: ["apple", "database", "stata"]
categories: ["2012"]
---

A brief survey of ODBC and database connectivity on Mac OS X, since I wanted to test ODBC drivers on Stata (see [How do I set up an ODBC Data Source Name for Stata on Mac or Linux/Unix?](http://www.stata.com/support/faqs/data-management/configuring-odbc/)).

## What is available on OS X?

Starting with Mac OS X version 10.6 (Snow Leopard), ODBC Administrator is no longer shipped with the operating system and must be downloaded and installed separately: [ODBC Administrator Tool for Mac OS X v1.0](http://support.apple.com/downloads/ODBC_Administrator_Tool_for_Mac_OS_X), or alternatively we can use [ODBC Manager](http://www.odbcmanager.net).

Mac OS X comes with [iODBC](http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/), installed in `/usr/bin`.

However, ODBC connectors seem to be slowly updated for newer version of OS X. For example, the latest release of [MySQL Connector/ODBC](http://dev.mysql.com/doc/refman/5.6/en/connector-odbc.html) targets [10.6](http://dev.mysql.com/downloads/connector/odbc/) (but it should work with 10.7 and onwards). There are detailed instructions on how to [install the ODBC connector](http://dev.mysql.com/doc/refman/5.6/en/connector-odbc-installation.html) from either a binary or source package. Please note that there is a packaged installer where we can see what's going to be installed on the system:

{{< figure src="/img/20121123182733.png" >}}

Unfortunately, there's no file `libmyodbc3S.so` as reported in the above screenshot or in the on-line help. As I used the tarball, I just copied files in `bin/` and `lib/` to my `/usr/local`. Then we need an `odbc.ini` file. I copied the one in the `test/` folder in `~/Library/ODBC` (which I had to create), and changed absolute paths in there. Then I just used ODBC Administrator to configure a User DSN, according to the [instructions](http://dev.mysql.com/doc/refman/5.6/en/connector-odbc-configuration-dsn-macosx.html).

{{< figure src="/img/20121123225519.png" >}}

We can also check that it worked directly from the command line:

```
$ iodbctest
iODBC Demonstration program
This program shows an interactive SQL processor
Driver Manager: 03.52.0607.1008

Enter ODBC connect string (? shows list): ?

DSN                              | Driver                                  
------------------------------------------------------------------------------
myodbc5                          | /usr/local/lib/libmyodbc5w.so           
```

For PostgreSQL, things were supposed to be a bit more complicated if we refer to this blog post: [ODBC on OSX 10.7 for Postgresql is broken: a suggested fix](http://www.feeny.org/odbc-on-osx-for-postgresql-is-broke-a-suggested-fix/). But wait, aren't we all working on a BSD platform with all GNU tools? I first tried to compile `psqlodbc-09.01.0200` from PostgreSQL [File browser](http://www.postgresql.org/ftp/odbc/versions/src/).

```
$ ./configure --with-iodbc
$ make
$ sudo make install
```

This should install `psqlodbcw.{la|so}` in `/usr/local/lib`. I then added an entry to `~/Library/ODBC/odbc.ini` (and correlate its entries with the file `odbcinst.ini`, as indicated in the [IODBC FAQ](http://www.iodbc.org/dataspace/iodbc/wiki/iODBC/FAQ)). Guess what? This just works:

```
$ iodbctest
iODBC Demonstration program
This program shows an interactive SQL processor
Driver Manager: 03.52.0607.1008

Enter ODBC connect string (? shows list): ?

DSN                              | Driver                                  
------------------------------------------------------------------------------
myodbc5                          | /usr/local/lib/libmyodbc5w.so           
psqlodbc                         | /usr/local/lib/psqlodbcw.so             
```

## A little test

Using the example from my [last post](/post/visualizing-sql-queries), I first imported the `auto.txt` dataset into MySQL. I have probably an outdated version (`Server version: 5.5.18 MySQL Community Server (GPL)`) but that's another issue. I happened to record the dataset as follows:

```sql
mysql> CREATE DATABASE datasets;
mysql> USE datasets;
mysql> CREATE TABLE auto (MAKE char(20), PRICE double, MPG double, REP78 double, HEADROOM double,                     
                          TRUNK double, WEIGHT double, LENGTH double, TURN double, 
                          DISPLACEMENT double, GEAR_RATIO double, FOREIGNER double);
mysql> LOAD DATA LOCAL INFILE '/Users/chl/Documents/data/auto.txt' INTO TABLE auto 
       FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
mysql> UPDATE auto SET rep78 = NULL WHERE rep78 = -999;
```

Then, in Stata:

{{< figure src="/img/20121123234857.png" >}}

How about R with the [RODBC](http://cran.r-project.org/web/packages/RODBC/index.html) package? Let's try it:

{{< figure src="/img/20121124000019.png" >}}

Next adventures in "Data Land": Connect from Emacs on my Airbook to a SAS server installed on another Mac running some Windows flavor (probably XP) installed on a USB key through Virtual Box! (I don't really like the idea, but I have to use SAS for a course.)

Not tested (probably because I don't see any point in using SQL Server or other Microsoft technology, let alone Excel): [Accessing MSSQL databases from Excel 2011 on Mac OS X 10.7 Lion](http://asmiler.blogspot.fr/2011/10/accessing-mssql-databases-from-excel.html).
