---
title: "The State of Clojure ML"
date: 2018-04-21T23:39:56+02:00
lastmod: 2018-04-21T23:39:56+02:00
draft: true
description: ""
tags: ["lisp", "statistics"]
categories: []
---

This post could have been headed "In which we learn how to embrace functional programing for statistical computing", or "how I stoped worrying about R and look for more lispy paradigm for data science." but let keep it simple for a while. Lately, I was looking for a nice way to perform numerical simulation in Clojure, I mean other than using lazy sequences with `(take 10 (repeatedly #(rand-int 10)))` where you can hardly fix any seed that will help reproduce your random numbers. I am aware of Clojure [data.generators](https://clojure.github.io/data.generators/) but I wanted a more integrated framework. Here are some extra libraries for numerical or statistical computing with Clojure that I found while crawling the web.

<!--More-->


- I heard about [Cortex](https://github.com/thinktopic/cortex) by reading [Carin Meier's blog post](http://gigasquidsoftware.com/blog/2017/11/07/cats-and-dogs-with-cortex-redux/) some time ago. 

- https://github.com/uncomplicate

Regarding Probabilistic Programming, you will find interesting discussion of Bayesian inference in this recent PhD thesis: [Probabilistic Programming: Automation of Inferences,  Learning and Design](https://t.co/xRc8mDUVw7) (PDF) 


It is quite easy to find good (non-cryptographic) PRNGs written in Clojure. You will likely came across one from L'Ecuyer and coll. or the Mersenne Twister algorithm, for instance. However, following [John D Cook suggestion](https://www.codeproject.com/Articles/25172/Simple-Random-Number-Generation), you can also easily write your own code, based on existing algorithm.
