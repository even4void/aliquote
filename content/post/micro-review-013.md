---
title: "June in review"
date: 2020-06-15T16:36:15+02:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

I still have a lot of bookmarks lurking around in Safari, since I overlooked some of them for a while. Anyway, here it goes. Note that quick links have been posted on the [Micro](/micro) section instead.

- I'm no longer an active reviewer for scientific journals, but this little tool, [pdfcomments](https://github.com/hoffmangroup/pdfcomments/blob/master/README.md), would certainly have been helpful when I was.

- Statically [sized arrays](https://github.com/JuliaArrays/StaticArrays.jl) for Julia looks like an interesting projects. I've read some Rust code about immutable and sized vectors or matrices, but of course this is all about Julia. According to the benchmark, they got a 65x speedup for QR decomposition, which is very nice for OLS problems. While we're on numerical computing, I recently came across [SLEEF](https://sleef.org), a vectorized math library.

- [Transforming Python ASTs to Optimize Comprehensions](https://cypher.codes/writing/transforming-python-asts-to-optimize-comprehensions-at-runtime). A very nice discussion of AST in Python, and an in-depth look at list comprehensions and how to optimize them.

- TIL about [SBLint](https://github.com/cxxxr/sblint), which is a linter for Common Lisp source code using SBCL.

- This has been a recuring theme in biomedical statistics: should we optimize the sample for statistical power or precision. Here's an [R package](https://malco.io/2020/05/26/estimating-sample-size-for-precision-precisely-0-1-0/) which is based on the work of [Rothman and Greenlad](https://pubmed.ncbi.nlm.nih.gov/29912015/).

- [How to pick a random number from 1-10](https://torvaney.github.io/projects/human-rng). I like this kind of posts, which I always find very entertaining (both for the math and the R code). This reminds me of David Robinson's [posts on puzzles](http://varianceexplained.org/r/riddler-prisoner-flip/).

- [Applying mypy to real world projects](http://calpaterson.com/mypy-hints.html). I rarely use typed Python, if there's such a word for when you supply yourself types to function parameters and return values. I followed some of [Joel Grus](https://joelgrus.com)' coding session last for the Advent of code, and he was using optional static typing along along. Maybe I should give it a try, providing Emacs allows for running [mypy](http://mypy-lang.org) automagically on save. Unrelated to this, I recently came across another nice post on Python: [Python Caches Integers](https://arpitbhayani.me/blogs/python-caches-integers).

- Last but not least, [Prediction, Estimation, and Attribution](https://www.tandfonline.com/doi/full/10.1080/01621459.2020.1762613) by Brad Efron was recently published online. If you are looking for a solid account of the performance common ML techniques against traditional statistical models, this is the article to read, together with some of Frank Harrell's blog posts from [2018](https://www.fharrell.com/post/stat-ml/) and [2019](https://www.fharrell.com/post/addvalue/).

> The twenty-first century2 has seen the rise of an extraordinary collection of prediction algorithms: random forests, gradient boosting, support vector machines, neural nets (including deep learning), and others. I will refer to these collectively as the “pure prediction algorithms” to differentiate them from the traditional prediction methods illustrated in the previous section. Some spectacular successes—machine translation, iPhone’s Siri, facial recognition, championship chess, and Go programs—have elicited a tsunami of public interest. If media attention is the appropriate metric, then the pure prediction algorithms are our era’s statistical stars.<br>The adjective "pure" is justified by the algorithms’ focus on prediction, to the neglect of estimation and attribution. Their basic strategy is simple: to go directly for high predictive accuracy and not worry about surface plus noise models. This has some striking advantages and some drawbacks, too.

{{% music %}}PJ Harvey • _The Peel Sessions_{{% /music %}}
