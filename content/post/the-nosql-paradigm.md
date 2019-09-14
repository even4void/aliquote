+++
title = "Overview of next gen database"
date = 2011-01-18T09:23:58+01:00
draft = false
tags = ["database"]
categories = ["2011"]
+++

The NoSQL paradigm isn't a way to work with a database without havinf to connect to a server. It is merely a term coined to reflect new "non-relational" models for organizing data, through a distributed architecture (it is not mandatory, though), and it should not be confoudend with the existing software [NoSQL](http://www.strozzi.it/cgi-bin/CSA/tw7/I/en_US/nosql/).

<!--more-->

According to [http://nosql-database.org/](http://nosql-database.org/), NoSQL is

> Next Generation Databases mostly addressing some of the points: being non-relational, distributed, open-source and horizontal scalable. The original intention has been modern web-scale databases. The movement began early 2009 and is growing rapidly. Often more characteristics apply as: schema-free, easy replication support, simple API, eventually consistent / BASE (not ACID), a huge data amount, and more. So the misleading term "nosql" (the community now translates it mostly with "not only sql") should be seen as an alias to something like the definition above.

The key concepts are *high availability* and *data partitioning*, which goes at the expense of *consistency*. Standard RDBMs rely on the ACID principle: Atomicity, Consistency, Isolation, and Durability. From the [CAP theorem](http://en.wikipedia.org/wiki/CAP_theorem), we know that only two of the following three characteristics can be satisfied at the same time: consistency, partition tolerance, availability. Classical RDBMs (e.g., MySQL, Oracle) satisfy the first two. NoSQL relaxes the requirement on the consistency, and instead provide availability and partition tolerance. In contrast to ACID, we speak of BASE, which stands for Basically Available, Soft state, and Eventual consistency.

They often achieve performance by having far fewer features than SQL databases, but are useable with massive data sets like the ones found on Internet (e.g., Facebook).

Some current projects that reflect this philosophy of data management: [Voldemort](http://project-voldemort.com/) (LinkedIn); [BigTable](http://labs.google.com/papers/bigtable.html) (Google); [CouchDB](http://couchdb.apache.org/); [Redis](http://redis.io/); [HBase](http://hbase.apache.org/) (Java) provides BigTable-like support for [Hadoop](http://hadoop.apache.org/); [Neptune](http://www.jaso.co.kr/neptune/index.html) based on [ZooKeeper](http://hadoop.apache.org/zookeeper/) (Hadoop HDFS); Apache [Cassandra](http://cassandra.apache.org/) (Facebook); [MongoDB](http://www.mongodb.org/) (see [Opricot](http://www.icmfinland.fi/oss/opricot/) for an HTML-based GUI).

The [Wikipedia entry](http://en.wikipedia.org/wiki/NoSQL) is full of other interesting links, but see also [NoSQL In The Cloud](http://cloudarchitect.posterous.com/nosql-in-the-cloud). I also found very interesting handouts on these various technologies on [NOSQL debrief](http://blog.oskarsson.nu/2009/06/nosql-debrief.html). Finally, a lot of [papers](http://nosqlsummer.org/papers) can be found on [http://nosqlsummer.org/](http://nosqlsummer.org/).


