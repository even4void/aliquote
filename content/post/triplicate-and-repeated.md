---
title: "On the use of triplicate in biology"
date: 2023-10-16T20:05:57+02:00
draft: false
tags: ["bioinformatics"]
categories: ["2023"]
---

In behavioral quantitative measurement, we are used to repetition within and between condition, that is a given subject is exposed to all conditions, or a subset thereof, in a complete or incomplete factorial design, and for each condition a certain number of repetitions of the same measurement are done. This is the so-called repeated measure design. In biology, researchers rather talk about technical and biological replicates. They are not the same: technical replicates are readings collected from the same statistical unit, while biological replicates are independent statistical units. Usually, both type of replication are carried out. Note that this is different from repeated measurements since biological replicates which involve different samples are exposed to different experimental conditions. But technically, technical replicates are repeated measures within a subject $\times$ condition treatment.

Next, there are two questions that always puzzled me: (1) technical replication is often performed using triplicates; (2) mixed-effect models are rarely used in practice, rather technical replicates are averaged and the analysis is performed using statistical tests for independent group (ANOVA, t-test, etc.).

I don't think there's any statistical justification for the use of $k=3$ technical replicates rather than, say, $k=10$. Three observations are enough to gauge the precision of the measurement, and discard an outlying value if necessary, but larger sample sizes for [biological replicates](https://www.walesgenepark.cardiff.ac.uk/wp-content/uploads/2020/10/WGPtech_replicates.pdf) (PDF) are better especially when we want to get a more precise averaged or pooled estimate and/or we are dealing with small effect sizes. It is common in RNA-Seq experiments to consider only 3 biological replicates, although it would be considered as the absolute minimum.[^1]

My small Dr. DuckDuckGo literature review yielded the following articles or tech notes:

- [Replicates and repeats—what is the difference and is it significant?](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3321166/)
- [Empowering statistical methods for cellular and molecular biologists](https://www.molbiolcell.org/doi/10.1091/mbc.E15-02-0076)
- [Replication](https://www.nature.com/articles/nmeth.3091)
- [Bioanalytical method validation: An updated review](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3658022/)

In [To triplicate or not to triplicate?](https://www.sciencedirect.com/science/article/pii/S0169743906001687): The authors used mixed-effect models to assess the contribution of the between variance to the total variance and they showed that (it can be shown that the intraclass correlation coefficient $\rho < 1$ ($\rho = 0$ only in the case where the within sample units are independent), when the numbr of replicates $m \geq 2$, the width of the 95% CI for the average of the $m$ within sample units is reduced by a factor $\sqrt{\hat\rho + (1 - \hat\rho)/m}$. For $m=1$ the maximum reduction of the CI width equals $1 - \sqrt{1/m}$ when $\rho = 0$. With triplicates, we can achieve about 20% reduction for $\rho = 0.5$.

Cell lines remain problematic anyway: Imagine the case where a cell line is split into different colonies which are then left to grow either as control (untreated) vs. experimental (treated) condition; since all cells were extracted from the same tube. In this case, these are not biological replicates. See also [Cell culture experiments, technical or biological replicates?](https://biology.stackexchange.com/questions/111030/cell-culture-experiments-technical-or-biological-replicates).

{{% music %}}Joy Division • _Transmission_{{% /music %}}

[^1]: Schurch, N. J. et al. 2016. How many biological replicates are needed in an RNA-seq experiment and which differential expression tool should you use? _RNA_ 22(6): 839-851. The authors show that with only three biological replicates, "nine of the 11 tools evaluated found only 20%–40% of the significantly differentially expressed (SDE) genes identified with the full set of 42 clean replicates," and that 20 replciates are reuquired to achieve >85% accuracy.
