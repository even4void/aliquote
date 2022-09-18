---
title: "Scheme Repeated Fn"
date: 2022-09-18T21:06:44+02:00
draft: true
tags: ["scheme"]
categories: ["2022"]
---

In my previous post I discuss the repeated application of a function to build a list of results. This was done using a named let form, but SICP has an interesting application of repeated call to a function in exercise 1.43.


Or, we could use the following helper function, defined in [Simply Scheme]:

```scheme
(define repeated
  (let ((= =) (- -))
    (lambda (fn number)
      (if (= number 0)
       (lambda (x) x)
       (lambda (x)
        ((repeated fn (- number 1)) (fn x)))))))
```

{{% music %}}XXX • _XXX_{{% /music %}}

[Simply Scheme]: /post/simply-scheme/

