+++
title = "Think Bayes"
description = ""
date = 2018-02-13T09:34:55+01:00
draft = true
tags = ["review", "bayesian", "python"]
categories = []
+++

This time, I am (quickly) reviewing *Think Bayes*, one of Allen Downey's book from the "Think X" series. A [PDF version](http://greenteapress.com/wp/think-bayes/) is available on Green Tea Press. The accompanying code can be downloaded from Github ([ThinkBayes](https://github.com/AllenDowney/ThinkBayes) is for Python 2, [ThinkBayes2](https://github.com/AllenDowney/ThinkBayes2) targets Python 3 but the book has not yet been updated to reflect the changes).

<!--more-->

I first read *How to think like a computer scientist* (probably the Python version) back in the 2000s. I really liked Allen's approach to exposing soft and hard concepts related to computer science. This time, the author choose to use Python and discrete mathematics to expose the reader to Bayesian statistics:

> Most books on Bayesian statistics use mathematical notation and present ideas in terms of mathematical concepts like calculus. This book uses Python code instead of math, and discrete approximations instead of continuous mathematics. As a result, what would be an integral in a math book becomes a summation, and most operations on probability distributions are simple loops.

But note that even if the author offers to tackle such problems from the perspective of computer science, statistical considerations remain an important part of the process, even if this yields "an approximate solution to a good model":[^1]

> I think it is important to include modeling as an explicit part of problem solving because it reminds us to think about modeling errors (that is, errors due to simplifications and assumptions of the model).

Chapter 1 provides a quick exposition to Bayes theorem, described as a way to get from P(B|A) to P(A|B), especially in cases where P(A|B) is not easy to compute. I find that the M&M problem (§1.6) is a very nice way to introduce bayesian inference, in the spirit of Philip Good's introduction to permutation testing (*Permutation, Parametric, and Bootstrap Tests of Hypotheses*, Springer, 2005): define the problem, set up the hypotheses and a test statistic, and finally assess the likelihood of the observed result; or, as the author suggests in Chapter 3: (1) choose a representation for the hypotheses, (2) choose a representation for the data, and (3) write the likelihood function. The next one is about the Monty Hall dilemma and it is really trickier.[^2] It is, however, easy to run a little simulation of the expected proportion of wins in case we choose to switch or stick to our initial choice. Here are the results I get using Mathematica:

![Monty Hall simulation](/Users/chl/Sites/aliquote/static/img/monty-hall.png)

Of note, a collection of related problems (with solutions) can be found on the author's blog: [All your Bayes are belong to us!](http://allendowney.blogspot.fr/2011/10/all-your-bayes-are-belong-to-us.html).

In Chapter 2, the author provides reminders about the basics of probability distributions in Python (using a custom Python module, `thinkbayes.py`, that can be found on the Github repository), followed by two numerical applications on the aforementioned problems. It is mostly Python code drawing from the so-called [template method pattern](https://en.wikipedia.org/wiki/Template_method_pattern).

Chapters 3 and 4 are all about estimating 


{{% music %}}Robert Wyatt • *Rock Bottom*{{% /music %}}

[^1]: This reminds me of John Tukey's famous quote: "Far better an approximate answer to the right question, which is often vague, than an exact answer to the wrong question, which can always be made precise." ([The future of data analysis](https://projecteuclid.org/euclid.aoms/1177704711), *Ann Math Statist* 1962, 33(1): 1–67)

[^2]: It seems that unlike humans birds might be able to adapt their behavior in order to maximise their expected winnings ([Are birds smarter than mathematicians? Pigeons (Columba livia) perform optimally on a version of the Monty Hall Dilemma](https://www.ncbi.nlm.nih.gov/pubmed/20175592), *J Comp Psychol* 2010, 124(1): 1-13)