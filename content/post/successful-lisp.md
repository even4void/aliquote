---
title: "Successful Lisp"
date: 2023-01-27T10:09:25+01:00
draft: false
tags: ["review", "lisp"]
categories: ["2023"]
---

Here are some words about _Successful Lisp_, by David Lamkins. I started reading it last Summer, then stopped, then get at it again before Christmas. Meanwhile, I haven't wrote a single line of CL... A short review appeared years ago on [Eli Bendersky][]'s website.

> In Lisp, the parenthesis is the punctuation.

This book is available on one of [Gilbert Strandh][]'s websites. It aims at describing what Lisp is, what it is good for, and how the language differs from other languages mostly derived from Algol. The above quote is just a joke, since many newcomers to Lisp-based languages seem to dislike those pesky parentheses that sit everywhere in Lisp or Scheme code blocks.[^1]

As stated above, this is a book about Lisp, the language, and not Lisp as used in scientific computing or AI applications. Chapter 3 provides a brief overview of essential Lisp concepts: syntax and evaluation of forms (atoms and lists) using prefix notation, special forms and macros, etc. It is organized as a set of 12 lessons, along with non-trivial illustrations sometimes (e.g., `setq` versus `set`). Most importantly, it covers data structures like vectors, arrays or structure and hash tables. Whenever I read about CL's array, I think of one of Tamas Papp's [older post][] but I think CL still provides workable solution for numerical applications, as can be seen from some of [Robert Smith][]'s projects. Chapters 4, 6, and 8 deal with local and global variable, namespace, lexical binding and the like. It is the "essentials" but I believe it is a disguised way to compare CL to other programming languages, with the exception of tail recursion and reader macros which are specific to functional languages. Chapter 5 discusses loops, and I'd learned to remember Stata's own looping procedure thanks to the distinction between `dotimes` and `dolist` in CL. Chapters 7 and 14 is all about CLOS, the object system in CL. Chapter 9 discusses error handling; see [The Common Lisp Condition System: Beyond Exception Handling with Control Flow Mechanisms][] for a modern approach to control flow in CL. Sequences and operations on sequences (map, filter, reduce) are described in chapters 12 and 13. Closures are discussed in chapter 15, while the infamous "equal" comparisons are summarized in chapter 17. Chpaterd 19 and 20 are about streams and macros:

> Lisp macros are Lisp programs that generate other Lisp programs.

Except for chapters 32 and following, the rest of the book is merely about how to program in CL and to manage a CL project.

People often recommend [Practical Common Lisp][] to get started with Lisp. I think this book is also worth a look. [Between two Lisps][] also provides a good discussion of CL versus Scheme, Clojure or whatever.

{{% music %}}Artic Monkeys • _R U Mine?_{{% /music %}}

[^1]: I do, on the contrary, like them from a purely syntactically viewpoint, at least much better than significant indentation like in Python or Haskell. If you think about it a little, there's not much of a difference between the following two statements: `print("Hello")` and `(pprint "Hello")`. By the way, John D. Cook already mentioned this on Twitter years ago. If your text editor supports bracket matching --- and you're not forced to use Emacs --- you will easily navigate between balanced parenthesis, and more generally the highly structured code that Lisp or Scheme provide. I also hope that [treesitter][] will be a great help in the future. After this brief parenthesis, let's return to the subject of this post.

[eli bendersky]: https://eli.thegreenplace.net/2004/09/20/book-review-successful-lisp-by-david-lamkins
[gilbert strandh]: https://dept-info.labri.fr/~strandh/Teaching/MTP/Common/David-Lamkins/contents.html
[treesitter]: https://tree-sitter.github.io/tree-sitter/
[older post]: https://www.tamaspapp.eu/post/common-lisp-to-julia/
[robert smith]: https://github.com/stylewarning
[the common lisp condition system: beyond exception handling with control flow mechanisms]: https://phoe.github.io/
[practical common lisp]: https://gigamonkeys.com/book/
[between two lisps]: https://ane.iki.fi/2020/10/05/between-two-lisps.html
