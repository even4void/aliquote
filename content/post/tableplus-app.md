---
title: "TablePlus App"
date: 2019-01-28T13:41:00+01:00
draft: false
tags: ["apple", "database", "app"]
categories: ["2019"]
---

Here is a quick review of [TablePlus](https://tableplus.io) which is a lightweight app that all Mac users should fell in love with when it comes to querying SQL databases.

{{< figure src="/img/2019-01-28-17-50-39.png" caption="Open dialog box" >}}

I discovered this app several months ago and I never used it for real, except for testing a toy example before one of my latest course. TablePlus, in the spirit of [Postico](https://eggerapps.at/postico/) or [Induction](https://github.com/pothibo/Induction) (RIP), is a minimalist frontend to MySQL where you can visualize and query your records in just a few clicks. Although I primarily use a terminal to interact with my local SQL server (yes, I know, OVH does not allow remote connection and I'm reduced to making dump of my databases to work on them locally!), I found that TablePlus does things right. Compared to PHPMyAdmin, which I used on remote servers, TablePlus is a native and quite responsive app, which helps to focus on the data tables rather than the UI.

TablePlus works with standard SQL databases (MySQL, Postgres and SQLite) but it also supports NoSQL backends such as Redis, Cassandra, or Vertica. I only tested it with SQLite and MySQL databases.

{{< figure src="/img/2019-01-28-17-51-38.png" caption="Connectors" >}}

Below is a list of nice features, but you will probably learn more by following the [online tutorial](https://tableplus.io/blog/2018/04/getting-started-with-tableplus.html). It is possible to browse each table and edit records by double-clicking on the data cell and "comitting" the change. The SQL query editor allows to write specific SQL queries that can be sent to the database server. You can even save your query for later. There is a nice filtering option that allows to select and highlight only records that match a series of conditions. Lastly, it is as easy to import a CSV file into a given table or to export query results to CSV, JSON or SQL.

To give you an idea, here are a few screenshots that I took during my last session (on real data):

{{< fluid_imgs
  "pure-u-1-2|/img/2019-01-28-13-39-25.png"
  "pure-u-1-2|/img/2019-01-28-13-40-35.png" >}}

I recently noticed that their [business plan](https://tableplus.io/pricing) has slightly evolved, otherwise it looks like a solid application for database management. I do not know what is included in the full-featured (aka not free) version, but for ordinary use the free edition should be largely enough to perform basic operations.

{{% alert note %}}
<small>[2021-10-04]</small><br>
I've been using TablePlus for two years now, and I can confirm that it is a great application. I use it mostly for SQLite (it even includes an option to drop column) and Postgresql. Moreover, there's an alpha version for Linux at the time of this writing, which is almost on par with the classical version for Mac.
{{% /alert %}}
