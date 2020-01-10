---
title: "Finding the majority element in a list"
date: 2020-01-09T10:28:02+01:00
draft: false
tags: ["racket"]
categories: ["2020"]
---

One of [Rosalind](http://rosalind.info/problems/maj/) problems deals with finding the "majority element" of a vector, which is defined a the value that appears in more than half of the entries. Note that this is a little different from what we usually call the mode in statistics. This is a pretty simple task to run using, e.g., Python or R. 

Here is a solution in Python: 

```python
from collections import Counter

def maj(lst):
    """"
    >>> items = [8, 7, 7, 7, 1, 7, 3, 7]
    >>> print(maj(items))
    7
    """
    c = Counter(lst)
    val, cnt = c.most_common()[0]
    if cnt > len(lst)/2:
        return int(val)
    else:
        return -1
```

We could probably use numpy and/or scipy as well, but let's keep it simple, but I really like the `Counter` idiom in Python, which allows to keep a record of the item index that is being processed much like `enumerate` does. I missed this in Racket. It is quite easy to tabulate a list of values using a `for/list` pattern, e.g. as in the following code:

```racket
(define (counter x lst)
  (if (null? lst) 0
      (if (= x (car lst))
          (+ 1 (counter x (cdr lst)))
          (counter x (cdr lst)))))

(define items (list 8 7 7 7 1 7 3 7))
(apply max (for/list ([i (remove-duplicates items)]) (counter i items)))
```

If we want to return both the item value and the associated counts, there are two options: either we rely on a hash table, or we need to carry out values and counts together, like Python's `enumerate`; this could be something like replacing `(counter i items)` with `(list i (counter i items))`, but we will need to update the function used when calling `apply` because `max` will not accept a tuple of values. Here is a little example of using a hash instead of plain lists:

```racket
;; Credit: https://stackoverflow.com/a/5741004
;; See also math/statistics::samples->hash
(define (bagify xs)
  (for/fold ((ht #hash()))
            ((key (in-list xs)))
    (hash-update ht key add1 0)))

(define (which-max ht)
    (car (argmax cdr (hash->list ht))))

(define table (bagify items))
(which-max table)
```

This also (sort of) solves the problem of the joint use of `apply` and `max` described above:

```racket
(argmax cadr (for/list ([i (remove-duplicates items)]) (list i (counter i items))))
```

 The same approach could obviously serve the purpose of finding the mode in a list of values, e.g.:

```racket
(define (mode xs)
  (cond [(empty? xs) '()]
        [else (car (argmax cdr
          (hash->list (bagify xs))))]))
```

Note that the above procedure will not handle the case of multiple modes.

Finally, what about `enumerate` like idiom in Racket? Here's one solution:

```racket
(define zip (lambda (x y) (map list x y)))

(define (enumerate xs)
  (zip (range (length xs)) xs))
```