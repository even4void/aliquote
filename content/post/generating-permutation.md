---
title: "Generating all or next permutation"
date: 2024-01-12T09:26:56+01:00
draft: true
tags: ["scheme"]
categories: ["2024"]
---



A recursive solution to the problem of generating all permutation of a given list or array is as follows:

If the length of Permutation equals the length of Array
    Permutation Found.
Else
    For each position ‘p’ from 0 till the length of Array
        If element at position ‘p’ has been taken
            Continue to check for next position.
        Mark position ‘p’ as Taken.
        Append the element at position ‘p’ to the Permutation.
        Generate_Permutation ( Permutation, Array, Positions )
        Remove the element at position ‘p’ from the Permutation.
        Mark position ‘p’ as Available.

other algorithms
heap

domain-specific applications
https://rdrr.io/cran/permute/

Sedgewick and Wayne's algorithm
https://introcs.cs.princeton.edu/java/23recursion/Permutations.java.html

https://en.wikipedia.org/wiki/Steinhaus%E2%80%93Johnson%E2%80%93Trotter_algorithm

base case
Racket
cl-permutation
Rosetta code

numpy and itertools.permutations()
https://numpy.org/doc/stable/reference/random/generated/numpy.random.Generator.permutation.html#numpy.random.Generator.permutation

next permutation
https://www.nayuki.io/page/next-lexicographical-permutation-algorithm


stream, generator
