---
title: "Python for quick statistical computing"
date: 2023-02-21T18:58:44+01:00
draft: false
tags: ["python"]
categories: ["2023"]
---

Python has a lot of base packages that can be used to perform most of our statistical computing tasks. There's a good review of what's available when you install Python in _Serious Python_, by Julien Danjou (No Starch Press, 2018), and often times you don't really need extra stuff.

Here are two small illustrations of my wanderings with Python for basic statistical stuff. For a project at work, I needed a quick implementation of bootstrapping. This was just to ensure that the statistic I was computing on the full dataset was reliable enough. I was not interested in drawing confidence intervals or anything more fancy from the bootstrapped statistics. Initially, I tried using the `asyncio` module, but finally I ended up using `multiprocessing` (see [Multi-blast and parallel processing](/post/multi-blast/) for another use of this module).

Here's my code:

```python
import multiprocessing

B = 500
boot = []
p = multiprocessing.Pool(processes=multiprocessing.cpu_count() - 2)
tic = time.time()
data = numpy.loadtxt(f)
n = data.shape[0]
idx = numpy.random.choice(n, (B, n))
boot.append(p.map({foo}, (data[i, :] for i in idx.tolist())))
toc = time.time()
print(f">>> Elapsed time: {toc - tic:.2f}s")
```

<small>Replace `{foo}` with the function that returns a statistic of interest.</small>

Of course, for serious work you would need to compute 95 or 99% percentiles as well as correct for bias and skewness of the bootstrap distribution (BCA correction).

Here is another case: a toy implementation of k-fold cross-validation. I know various libraries, including the [scikit-learn](https://scikit-learn.org/stable/index.html), offers much more elaborated solution to the design of cross-validated statistics, but this time I was in a hurry and I just needed a quick way to rely on training/test datasets. The basic idea was just to create a partition of my dataset using numpy and a reducing function to rearrange the train and test datasets. At a glance, it looks like this:

```python
from functools import reduce
from statistics import mean

import numpy as np

x = np.random.normal(0, 1, 100)
partition = np.array_split(x, 10)

for k in range(len(partition)):
    curr = partition[k]
    other = reduce(
        lambda x, y: np.concatenate((x, y)),
        [x for i, x in enumerate(partition) if i != k],
    )
    print(f"curr ({k}) = {mean(curr)}, other = {mean(other)}")
```

Again, there's room for improvement since usually we would first shuffle the data indices before partitioning the array in k sets.

{{% music %}}Cinderella • _Don't Know What You Got_{{% /music %}}
