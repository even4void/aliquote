---
title: "ArXiving on March 2020"
date: 2020-03-28T20:19:25+01:00
draft: true
tags: ["readings", "arxiv"]
categories: ["2020"]
---

Here are some papers that I read this week.

## The Book of Why: The New Science of Cause and Effect [arXiv:2003.11635v1](https://arxiv.org/abs/2003.11635v1)

This is a fair review of the _Book of Why_ that I started reading a while back before forgetting about it because I'm no longer involved in causal analysis, and not curious enough to keep up with everything that's going on around here. Anyway, graphical causal representation under the umbrella of direct acyclic graphs (DAGs) are supposed to be the new starting point for causal analysis. The reviewers remain, however, critical of the Judea Pearl's optimism since his approach mostly relies on the assumption that the underlying causal structure is known.

> We believe this optimism is unfounded. The central problem that scientists face, especially in the social sciences, is not how to express or analyze causal models but how to pick one that is valid or at least reasonable. The book does not claim to solve this problem.

I would say that the same criticism applies to all regression models insofar as the (frequentist) interpretation value is valid (and meaningful) conditional on the fact that the model is correctly specified. Another criticism, this time, aimed at denigrating the usefulness of the experimental approach, like randomized clinical trials or experimental design at large. Finally, DAGs are not the only appraoch to causal modeling, according to this review, for several alternative causal models, like nonparametric structural equation models or design-based approaches, exist and may be able to answer the specifics of causal discovery.

## An Introduction to Probabilistic Programming [arXiv:1809.10756](https://arxiv.org/abs/1809.10756)

I've read several papers or arXiv reviews on probabilistic programming (PP) lately. I mentioned [this one](/post/tech-review-october-2018/) already. Briefly, it provides an extensive review of the core ideas of PP, namely the importance of conditioning in probabilistic machine learing and the use of dynamic computation graphs. Interestingly, this uses the Clojure dialect as the main implementation. This should come as no surprise since some of the authors are actively involved in the [Anglican toolbox](https://probprog.github.io/anglican/index.html).

**Related threads:** [A tour of probabilistic programming language APIs](https://colcarroll.github.io/ppl-api/), [Probabilistic programming with Monad-Bayes](/micro/2019-09-23-10-41-10/).

## A Survey of Deep Learning for Scientific Discovery [arXiv:2003.11755v1](https://arxiv.org/abs/2003.11755v1)
