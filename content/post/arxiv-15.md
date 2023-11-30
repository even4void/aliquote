---
title: "ArXiving on November 2023"
date: 2023-11-30T12:24:09+02:00
draft: true
tags: ["readings", "arxiv"]
categories: ["2023"]
---

### The 4+1 Model of Data Science (https://arxiv.org/abs/2311.07631)

I'm still not a big fan of the term [data science](/post/50-years-data-science) (as a discipline), and I much prefer statistician or data engineer, but let's forget about that for a moment. In this article, Rafael Alvarado offers to extend the consensual view according to which data science lies at the intersection between three main domains of expertise: computer science and technology, mathematics and statistics, and domain knowledge, which I found even more confusing. Specifically, he considers the following four main domains: value, design, systems, and analytics, to which a fifth domain may be added, namely practice. In a [related article](https://arxiv.org/abs/2311.03292), his review led him to conclude that the three driving factors of all the buzz around the sexiest job the 21st century are "(1) the long-standing opposition between data analysts and data miners that continues to animate the field, (2) an established definition of the term as the practice of managing and processing scientific data that has been occluded by recent usage, and (3) the phenomenon of data impedance." Much ado about nothing in my opinion, unless you consider that the volume and nature of data being processed these days implies a major change in terminology. But is it really that important if it's just a question of terminology? Because the job remains fundamentally the same, after all.

### Resampling-free bootstrap inference for quantiles (https://arxiv.org/abs/2202.10992)

A paper I read last year, thanks to Evan Miller, but go read his own [blog post](https://www.evanmiller.org/bootstrapping-sample-medians.html) which covers pretty all the math. While the authors originally proposed a Poisson model for bootstrapping differences in quantiles, whereby each observation in the original sample is included in each bootstrap sample according to a Poisson distribution with parameter 1, Evan Miller suggested an approximation which involves a Bessel function.

### Frame to frame interpolation for high-dimensional data visualisation using the woylier package (ehttps://arxiv.org/abs/2311.08181)

A new paper by Dianne Cook, whose contributions I have always greatly appreciated since I discovered [ggobi](http://ggobi.org/) (the website is still alive apparently). The "grand tour" (and other derivatives) is a method that allows to view data in more than three dimensions using linear projection, essentially by using rotations of a lower-dimensional projection in high-dimensional space. I've only seen this implemented efficiently in ggobi, but there may have been other attempts. Frames are stacked together with small interpolation to create a smooth motion. However, projection are usually rotationally invariant (when using geodesic interpolation algorithm) which may not be a desirable property when, e.g., we are looking for non-linear association in a high-dimensional dataset. The present package works along the [tourr](https://cran.r-project.org/web/packages/tourr/index.html) package.

![img](/img/2023-11-30-18-54-51.png)

### Visualizing adverse events in clinical trials using correspondence analysis with R-package visae (https://arxiv.org/abs/2101.03454)

Although I'm no longer involved in medical statistics, I keep an eye open on data visualization and applied methodology in the field. This article drew my attention a few weeks ago

### https://arxiv.org/abs/2311.08254

### https://arxiv.org/abs/2311.06974

{{% music %}}Mini Trees • _Cracks in the Pavement_{{% /music %}}
