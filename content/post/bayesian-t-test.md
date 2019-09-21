---
title: "A bayesian t-test"
date: 2010-08-22T17:59:45+01:00
draft: false
tags: ["statistics", "bayesian"]
categories: ["2010"]
---

Classical inferential test statistics for two-group comparisons, like the t-test, often face the problem of small effect size or borderline significance. Moreover, the issue is not so clear when we cannot reject the null.

Here I would like to discuss the following paper: Wetzels et al. [How to quantify support for and against the null hypothesis: a flexible WinBUGS implementation of a default Bayesian t test](http://db.tt/fMuN3kk), Wetzels R, Raaijmakers JG, Jakab E, Wagenmakers EJ. *Psychonomic Bulletin & Review* (2009) 16 (4): 752-60.

> We propose a sampling-based Bayesian t test that allows researchers to quantify the statistical evidence in favor of the null hypothesis. This Savage-Dickey (SD) t test is inspired by the Jeffreys-Zellner-Siow (JZS) t test recently proposed by Rouder, Speckman, Sun, Morey, and Iverson (2009). The SD test retains the key concepts of the JZS test but is applicable to a wider range of statistical problems. The SD test allows researchers to test order restrictions and applies to two-sample situations in which the different groups do not share the same variance.

The paper from Rouder et al., [Bayesian t tests for accepting and rejecting the null hypothesis](http://db.tt/RAkLWQS), is also available as PDF.

{{% alert note %}}
Oups, it looks like this has yet to be written.
{{% /alert %}}

To my knowledge, no implementation of the SD test is available in R.
