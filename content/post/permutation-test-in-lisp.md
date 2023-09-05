---
title: "Permutation test in Lisp"
date: 2023-03-08T09:26:56+01:00
draft: true
tags: ["lisp", "statistics"]
categories: ["2023"]
---

I drafted this post in March, along [Wilcoxon test in Lisp](/post/wilcoxon-test-in-lisp/), then forgot about it. How about using a permutation test? We'll be using the same dataset than in the previous post (permeability constants of the human chorioamnion from Hollander & Wolfe, 1973). With such a small sample size, we can compute an exact permutation test.

```lisp
(setf xs '(0.80 0.83 1.89 1.04 1.45 1.38 1.91 1.64 0.73 1.46))
(setf ys '(1.15 0.88 0.90 0.74 1.21))
```

{{% music %}}AlinaHipHarp • _Meditation_{{% /music %}}
