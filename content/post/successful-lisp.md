---
title: "Successful Lisp"
date: 2022-08-10T10:09:25+01:00
draft: true
tags: ["review", "lisp"]
categories: ["2022"]
---

Here are some words about _Successful Lisp_, by David Lamkins.

> In Lisp, the parenthesis is the ponctuation.

This book is available on one of [Gilbert Strandh]'s websites. It aims at describing what Lisp is, what it is good for, and how the language differs from other languages mostly derived from Algol. The above quote is just a joke, since many newcomers to Lisp-based languages seem to dislike those pesty parentheses that sit everywhere in Lisp or Scheme code blocks. I do, on the contrary, like them from a purely syntactically viewpoint, at least much better than significant indentation like in Python or Haskell. If you think about it a little, there's not much of a difference between the following two statements: `print("Hello")` and `(pprint "Hello")`. If your text editor supports bracket matching --- and you're not forced to use Emacs --- you will easily navigate between balanced parenthesis, and more generally the highly structured code that Lisp or Scheme provide. After this brief parenthesis, let's return to the subject of this post.

As stated above, this is a book about Lisp, the language, and not Lisp as used in scientific computing or AI applications. Chapter 3 provides a brief overview of essential Lisp concepts: syntax and evaluation of forms (atoms and lists) using prefix notation, special forms and macros, etc. It is organized as a set of 12 lessons, along with non-trivial illustrations sometimes (e.g., `setq` versus `set`).

[gilbert strandh]: https://dept-info.labri.fr/~strandh/Teaching/MTP/Common/David-Lamkins/contents.html
