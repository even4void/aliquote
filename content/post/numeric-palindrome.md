---
title: "Palindrome number"
date: 2019-12-27T18:24:15+01:00
draft: false
tags: ["clang"]
categories: ["2019"]
---

Today, as I was checking my RSS feeds, I came across the latest [post](https://irreal.org/blog/?p=8543) on Irreal blog, which pointed to a [post](http://funcall.blogspot.com/2019/12/in.html) by Joe Marshall that I read few days ago. The post in question was about implementing a palindrome checker, and I liked the way Joe Marshall exposed the algorithm as a set of three equations, including the base case that is commonly used to terminate a recursive function.

Several problems on the Euler project involve palindromes. For instance, for [problem 36](https://projecteuler.net/problem=36), I wrote the following function in Python:

```python
def is_palindrome(n):
    n = str(n)
    if n == n[::-1]:
        return True
    return False
```

Note that this relies on an integer to string explicit conversion, but it allows array slicing (which is still better than `reversed()`, in the case of strings at least). [Problem 4](https://projecteuler.net/problem=4) also deals with palindromic number, and this time I used the folllowing Racket code, again with an integer to string conversion:[^1]

```racket
(define (rev-string str)
  (list->string (reverse (string->list str))))

(define (palindrome? x)
    (equal? (number->string x) (rev-string (number->string x))))
```

It is, however, not necessary to use such string representation to work with palindromic number, much like we don't necessarily needs to convert a number to a string in order to get a [list of its digits](/post/digit-sum/). Here's now some C code to detect if a given integer is a palindrome number or not:

```c
#include <stdbool.h>

bool is_palindrome(int x) {
    if (x < 0 || (x % 10 == 0 && x != 0)) return false;

    int reverse = 0;
    while (x > reverse) {
        reverse = reverse*10 + x % 10;
        x /= 10;
    }

    return x == reverse || x == reverse/10;
}
```

The clause `x == reverse/10` in the return statement is here to ensure that edge cases like 222 are detected as well.

[^1]: In the meantime I learned that it is possible to use `foldl` pattern to reverse a list: `(define (rev lst) (foldl cons '() lst))`.

