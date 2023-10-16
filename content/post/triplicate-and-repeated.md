---
title: "Triplicate and repeated measures"
date: 2023-10-16T20:05:57+02:00
draft: true
tags: ["statistics"]
categories: ["2023"]
---

In behavioral quantitative measurement, we are used to repetition within and between condition, that is a given subject is exposed to all conditions, or a subset thereof, in a complete or incomplete factorial design, and for each condition a certain number of repetitions of the same measurement are done. This is the so-called repeated measure design. In biology, researchers rather talk about technical and biological replicates. They are not the same: technical replicates are readings collected from the same statistical unit, while biological replicates are independent statistical units. Usually, both type of replication are carried out. Note that this is different from repeated measurements since biological replicates which involve different samples are exposed to different experimental conditions. But technically, technical replicates are repeated measures within a subject $\times$ condition treatment.

Next, there are two questions that always puzzled me: (1) technical replication is often performed using triplicates; (2) mixed-effect models are rarely used in practice, rather technical replicates are averaged and the analysis is performed using statistical tests for independent group (ANOVA, t-test, etc.).

I don't think there's any statistical justification for the use of $k=3$ technical replicates rather than, say, $k=10$. Three observations are enough to gauge the precision of the measurement, and discard an outlying value if necessary, but larger sample size are better especially when we want to get a more precise averaged or pooled estimate and/or we are dealing with small effect sizes. My small Dr. Google literature review can be found below: (and these are DuckDuckGo results, not Google ones, but you already know that, right?)

{{% music %}}Joy Division • _Transmission_{{% /music %}}
