---
title: "Postico App"
date: 2019-05-21T20:21:14+02:00
draft: false
tags: ["apple", "database", "app", "review"]
categories: ["2019"]
---

A few months ago, I discussed [TablePlus](/post/tableplus-app) which is a powerful application to manage your local databases. Here are a few words about [Postico](https://eggerapps.at/postico/), which I use with [Postgres App](https://postgresapp.com) (both applications are developed by the same guy) when I am not using `psql` in a Terminal.

<!--more-->

What I like about Postico is that it provides a minimalistic UI to manage your databases and to query any tables inside. From Postgres App, you get a launcher in the menu bar and a nice manager that allows to view all your local databases and to manage the version of the running server. Actually, I have version 9.5, 9.6, 10 and 11, and I am currently developping a small Python+Falsk app using Postgresql 11.

![](/img/2019-05-21-20-27-20.png)

Then comes Postico, which is the default app to open an existing database (if Postico is not available, a Terminal is launched and you must resort on `psql`).

![](/img/2019-05-21-20-33-09.png)

Again, the design is simple as it was probably designed to be user-friendly à la Excel or Numbers. What I mean is that once you open a given table, you can visualize its contents (up to 1000 rows), or even the table schema. The latter, also called "structure view", lets you add custom column by hand: Give it a name, specify its type and properties (e.g., primary or foreign key, unique, etc.) and then commit your changes.

![](/img/2019-05-21-20-34-15.png)
![](/img/2019-05-21-20-46-35.png)

You will soon find at home using this app since most macOS shortcuts are available, e.g. `⌘R` to refresh the view. The tables can be edited by hand or using SQL commands (`⇧⌘T` will bring an SQL console) directly (`⌘R` will execute the selection). Past commands are kept from one session to the other in the SQL console in case you want to reuse them. Otherwise, you can just delete them altogether.

![](/img/2019-05-21-20-45-41.png)

Compared to TablePlus, Postico only works with Postresql databases, but it provides an all-in-one app to manage and query your data. And as the authir states,

> You'll be delighted by all the thoughtful details.

Go take a look, it's really worth it.
