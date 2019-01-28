---
title: "TablePlus App"
date: 2019-01-28T13:41:00+01:00
draft: false
tags: ["apple","database"]
categories: ["app-review"]
---
Here is a quick review of [TablePlus](https://tableplus.io) which is a lightweight app that all Mac users should fell in love with when it comes to querying SQL databases.

<!--more-->

![Open dialog box](/img/2019-01-28-17-50-39.png "Open dialog box")

I discovered this app several months ago and I never used it for real, except for testing a Toy example before one of my latest course. TablePlus, in the spirit of [Postico](https://eggerapps.at/postico/) or [Induction](https://github.com/pothibo/Induction) (RIP), is a minimalist frontend to MySQL where you can vizualise and query your records in just a few clicks. Although I primarily use a terminal to interact with my local SQL server (yes, I know, OVH does not allow remote connection and I'm reduced to making dump of my databases to work on them remotely!), I found that TablePlus does things right. Compared to PHPMyAdmin, which I used on remote server, TablePlus is a native and quite responsive app, which helps to focus on the data tables rather than the UI.

TablePlus wroks with standard SQL databases (MySQL, POstgres and SQLite) but it also supports as NoSQL backends like Redis, Cassandra, or Vertica. I only tested it with SQLite and MySQL databases.

![Connectors](/img/2019-01-28-17-51-38.png "Connectors")

Below is a list of nice features (you can learn more by following the [online tutorial](https://tableplus.io/blog/2018/04/getting-started-with-tableplus.html)). It is possible to browse each table and edit records by double-clicking on the data cell and "comitting" the change. The SQL query editor allows to write specific SQL queries that can be sent to the database server. You can even save your query for later. There is a nice filtering option that allows to select and highlight only records that match a series of conditions. Lastly, it is as easy to import a CSV file into a given table or to export query results to CSV, JSON or SQL.

To give you an idea, here are a few screenshots that I took during my last session (on real data):

![Selection](/img/2019-01-28-13-39-25.png "Selection")
![SQL query](/img/2019-01-28-13-40-35.png "SQL query")

I recently noticed that their [business plan](https://tableplus.io/pricing) has slightly evolved, otherwise it looks like a solid application for database management. I do  ot know what is included in the full-featured (aka not free) version, but for ordinary use the free edition should be largely enouig to perform basic operations.

