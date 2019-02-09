---
title: "Stata vs R"
date: 2019-02-07T18:15:00+01:00
draft: false
type: "tweet"
---

After attending months of Twitter discussion about what could be the best
software--R or Python--for data science several months ago, this is now the time
of the R vs. Stata debate, [here](https://twitter.com/jepusto/status/1092255032500764673) and [there](https://twitter.com/jeremyfreese/status/1093209317317038081). Arguably, Stata is a paid software
and does not offer the same scripting facilities than R for some tasks, mainly
non-statistical tasks. However, what's the point? Did anyone ever mentioned the
fact that Stata has a GUI which completely mimics the command-line operations,
so that people afraid of typing commands or just interested in running a
logistic regression on a well-formed dataset can just do it in under a minute?
It is slow with some estimators or optimization approaches (e.g., `gglamm`), and
we had to wait a bit long to get full support for unicode and XLS, better
graphical rendering, etc. But the versioning system allows to repoduce any
result prior to the current version of Stata. And it does interact very well
with Stan and R, too. The question is not which software is better, the real
question is who's the end user? `#rstats` `#stata`
