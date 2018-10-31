---
title: "Palindrome List and Cycle Detection"
date: 2018-10-27T20:12:35+02:00
lastmod: 2018-10-27T20:12:35+02:00
draft: true
description: ""
tags: []
categories: []
---
Here is a little excursion into algorithms for cycle detection, with a particular emphasis on palindrome.
<!--more-->

The following comes from [Programming Praxis](https://programmingpraxis.com/2018/10/02/palindrome-list/), which I happen to read from time to time:

> Write a program that determines if a linked list of integers is palindromic — i.e., reads the same in both directions. Your solution must operate in O(1) space.

In the suggested solution, the author uses Floyd’s tortoise-and-hare algorithm, also known as [Floyd's cycle-finding algorithm](https://en.wikipedia.org/wiki/Cycle_detection), whose name is mentioned in Don Knuth's TAOCP (*Seminumerical Algorithms*) although it is not .[^1]


[^1]: Exercice 6 from DEK reads as follows (with minor edits): Suppose that we want to generate a sequence of integers $X_0, X_1, X_2, \dots$, in the range $0 \leq X_n < m$. Let $f(x)$ be any function such that $0 \leq x < m$ implies $0 \leq f(x) < m$. Consider a sequence formed by the rule $X\_{n+1} = f(X_n)$. Show that there exists an $n > 0$ such that $X_n = X\_{2n}$; and the smallest such value of $n$ lies in the range $\mu \leq n \leq \mu + \lambda$. Furthermore the value of $X_n$ is unique in the sense that if $X_n = X\_{2n}$ and $X_r = X\_{2r}$, then $X_r = X_n$.
