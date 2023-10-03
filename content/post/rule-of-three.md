---
title: "Rule of three and some variations on the Chebyshev inequality"
date: 2023-10-02T14:11:06+02:00
draft: false
tags: ["statistics"]
categories: ["2023"]
---

In medical statistics, especially studies on adverse events, there's a well-known rule of three (different from [other](<https://en.wikipedia.org/wiki/Rule_of_three_(writing)>) [rules](https://en.wikipedia.org/wiki/Cross-multiplication#Rule_of_three) of [three](https://pubmed.ncbi.nlm.nih.gov/34061563/)) which states that for binary outcomes, if no event has been observed on $n$ individuals a 95% confidence interval is constructed as $[0; 3/n]$. We can derive a confidence interval for the opposite (100% of events) by symmetry ($[1−3/n,1]$). Hence the name, because the chance of such an extreme event is at most three in $n$. The derivation is given in, e.g., [If Nothing Goes Wrong, Is Everything All Right? Interpreting Zero Numerators](http://www.med.mcgill.ca/epidemiology/hanley/tmp/Proportion/zero_numerator.pdf).

There's another handy (sort of) rule of thumb. If you remember what you learned from your intro course in statistics and probability density functions, you probably know that you can expect 95% of your data to lie within 2 standard deviations around the mean, and that there's close to 3‰ chance that data lies above 3 standard deviation from either side of the mean. This is sometimes referred to as the [68–95–99.7 rule](https://en.wikipedia.org/wiki/68%E2%80%9395%E2%80%9399.7_rule). [Chebyshev's inequality](https://en.wikipedia.org/wiki/Chebyshev%27s_inequality) is generally used to justify the fact that a certain fraction of values can be (no) more than a certain distance from the mean. Contrary to the rule discussed previously, it specifically states that: $$ \Pr(\mid X - \mu \mid \geq k\sigma) \leq \frac{1}{k^2}. $$ It applies to any continuous distribution that has a mean and a variance. When $k=2$, for example, 75% of the observations are found to lie in the range $\mu\pm 2\sigma$.

Now, assuming a unimodal distribution with mean $\mu$ and finite variance $\sigma^2$, for any $\lambda > \sqrt{8/3} \approx 1.633$, $$ \Pr(\mid X - \mu \mid \geq \lambda\sigma) \leq \frac{4}{9\lambda^2}. $$ This is known as the Vysochanskiï-Petunin inequality. When $\lambda = 3$, the upper probability bound equals $4/81 \approx 0.05$.[^1] To my knowledge, applications of this inequality mainly are in [control charts](https://www.wikidoc.org/index.php/Control_chart) or [financial](https://www.sciencedirect.com/science/article/abs/pii/S0377221721001545) statistics, but there may be some other interesting applications.

{{% music %}}Antony & The Johnsons • _Cripple and the Starfish_{{% /music %}}

[^1]: Chebyshev's inequality would yield about twice that value.
