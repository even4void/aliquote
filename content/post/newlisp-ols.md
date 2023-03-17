---
title: "Newlisp Ols"
date: 2023-03-17T20:55:42+01:00
draft: true
tags: []
categories: ["2023"]
---

Yet a new post on Newlisp for statistical computing. This time we will try to fit a simple linear regression model using the GSL facilities offered by Newlisp modules. Unfortunately, the FFI bindings are far from complete, and only a few linear algebra functions are implemented. Since the QR decomposition is available, we will use it, as we did in an [another post](/post/lisp-qr-regression/). Recall that the vector of estimated parameters can be computed as $R^{-1}Q^Ty$, where $Rx = \bar y$, $y$ is rotated as $\bar y = Q^Ty$ and $R$ is triangular.

Same example [as before](/post/newlisp-plotting) (Hosmer & Lemeshow's birth weight dataset).

```lisp
(load (append (env "NEWLISPDIR") "/modules/gsl.lsp"))
(set 'data (read-file "/home/chl/tmp/birthwt.csv"))
(replace "," data " " 0)
(set 'values (map int (parse data)))
(set 'x (rest (select values (sequence 1 (length values) 10))))
(set 'y (rest (select values (sequence 9 (- (length values) 1) 10))))

(gsl:QRD x)
```

{{% music %}}XXX • _XXX_{{% /music %}}
