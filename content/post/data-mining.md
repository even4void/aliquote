---
title: "What is Data Mining after all"
date: 2019-02-18T20:42:22+01:00
draft: false
tags: ["statistics"]
categories: ["2019"]
---

It seems that not everyone agrees on what data mining is. Even on [Stack Exchange](https://stats.stackexchange.com/q/5026). I saw various definitions here and there over the past years. I put them here for the record.

<!--more-->

Here are some definitions I found in books or course material from renowned authors:

> Statisticians were the first to use the term "data mining." Originally, "data mining" or "data dredging" was a derogatory term referring to attempts to extract information that was not supported by the data. (...) Today, "data mining" has taken on a positive meaning. Now, statisticians view data mining as the construction of a statistical model, that is, an underlying distribution from which the visible data is drawn. --- Leskovec, Rajaraman & Ullman. [Mining Massive Datasets](http://mmds.org)

Not sure I agree that data mining *per se* is that much concerned with finding a "good" statistical model. It seems to me that the above definition is just the logical reversal of how the authors defined [data dredging](https://en.wikipedia.org/wiki/Data_dredging), at least in those introductory sentences.

> The science of extracting useful information from large data sets or databases is known as data mining. It is a new discipline, lying at the intersection of statistics, machine learning, data management and databases, pattern recognition, artificial intelligence, and other areas.All of these are concerned with certain aspects of data analysis, so they have much in common--but each also has its own distinct flavor, emphasizing particular problems and types of solution. --- Hand, Mannila & Smyth. [Principles of Data Mining](https://mitpress.mit.edu/books/principles-data-mining)

This is probably the definition I prefer and whose I refer to off the top of my head. It clearly states that we need to put our hands to the task, using techniques coming from various fields, to mine data from varying data sources.

> Data mining is the extraction of implicit, previously unknown, and potentially useful information from data. The idea is to build computer programs that sift through databases automatically, seeking regularities or patterns. Strong patterns, if found, will likely generalize to make accurate predictions on future data. Of course, there will be problems. Many patterns will be banal and uninteresting. Others will be spurious, contingent on accidental coincidences in the particular dataset used. And real data is imperfect: Some parts will be garbled, some missing. Anything that is discovered will be inexact: There will be exceptions to every rule and cases not covered by any rule. Algorithms need to be robust enough to cope with imperfect data and to extract regularities that are inexact but useful. --- Witten, Frank & Hall. [Data Mining: Practical Machine Learning Tools and Techniques](https://www.cs.waikato.ac.nz/ml/weka/book.html)

This one put more emphasis on the algorithmic approach for spotting strong or reliable patterns in the data. Note that "regularities" may be responsible for the unlikely fame of deep learning techniques. I saw a tweet on this but I cannot find it anymore. It's just impossible to search for any reference in Twitter! Anyway, I like this definition too, and [Weka](https://www.cs.waikato.ac.nz/ml/weka/) is great, even if it's Java.

> "Data mining" is more often used for problems with very large amounts of data, where computational efficiency is more important than statistical sophistication — often business applications. "Machine learning" is more often used for problems with a flavor of artificial intelligence — such as recognition of objects in visual scenes, or robot navigation. The term "data mining" was previously used in a negative sense — to describe the misguided statistical procedure of looking for many, many relationships in the data until you finally find one, but one which is probably just due to chance. --- Radford Neale. [Statistical Methods for Machine Learning and Data Mining](http://www.utstat.utoronto.ca/~radford/sta414.S12/)

This is the reference I used when I was teaching in the past. I like it better than the one given by Leskovec et al. since it does not limits itself to a purely Likelihood-driven approach.
