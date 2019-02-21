---
title: "An application of Continuous Markov Random Process"
date: 2019-02-21T19:16:05+01:00
draft: true
tags: ["statistics","bioinformatics"]
categories: []
---

<!--more-->

Here is how I setup the basic parameters for the DNA substitution model proposed by Jukes and Cantor:


The distribution of nucleotide frequencies is close to the expected ones (1/4), and multiplying the transition matrix `tm` by the vector of observed frequencies `fb` yields an updated vector of frequencies. 
Finally, we can repeat the same process, say 10 times using `Nest`, and also plot how the frequency of As evolves over time:


The distribution of nucleotide frequencies is close to the expected ones (1/4), and multiplying the transition matrix `tm` by the vector of observed frequencies `fb` yields an updated vector of frequencies. 
Finally, we can repeat the same process, say 10 times using `Nest`, and also plot how the frequency of As evolves over time:

If you are interested in other applications using Mathematica, the following article might be a good start: http://www.montis.pmf.ac.me/vol28/28_7.pdf
