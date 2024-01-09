---
title: "Permutation test in Lisp (con't)"
date: 2024-01-11T09:26:56+01:00
draft: true
tags: ["scheme", "statistics"]
categories: ["2024"]
---


```scheme
(define (take n xs)
  (let loop ((n n) (xs xs) (ys '()))
    (if (or (zero? n) (null? xs))
        (reverse ys)
        (loop (- n 1) (cdr xs)
              (cons (car xs) ys)))))

(define (permutations xs)
  (define (rev xs n ys)
    (if (zero? n) ys
      (rev (cdr xs) (- n 1) (cons (car xs) ys))))
  (let ((xs xs) (perms (list xs)))
    (define (perm n)
      (if (> n 1)
          (do ((j (- n 1) (- j 1)))
              ((zero? j) (perm (- n 1)))
            (perm (- n 1))
            (set! xs (rev xs n (list-tail xs n)))
            (set! perms (cons xs perms)))))
    (perm (length xs))
    perms))
```


```scheme
(define xs '(12.9 13.5 12.8 15.6 17.2 19.2 12.6 15.3 14.4 11.3))
(define ys '(12.7 13.6 12.0 15.2 16.8 20.0 12.0 15.9 16.0 11.1))
(define n (length xs))
(define xy (append xs ys))
(define perms (permutations xy))
(map (lambda (x) (apply + x)) perms)
```
