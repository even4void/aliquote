---
title: "Category Theory"
date: 2018-03-24T18:58:38+01:00
draft: false
tags: ["readings", "math", "haskell"]
categories: ["2018"]
---

I recently came across [Categories and Haskell]( https://github.com/jwbuurlage/category-theory-programmers), written by Jan-Willem Buurlage. This is supposed to be "an introduction to the mathematics behind modern functional programming", although to be honest it covers much more advanced topics in mathematics than I expected. But we are here to learn after all.

<!--more-->

As I am playing a bit with Haskell these days, I thought it could be a useful book to add to my long reading list. Indeed, I am currently reading [Haskell programming from first principles](http://haskellbook.com), by Allen & Moronuki, and I planned to review this very nice book soon or later. For the moment, let's dive into the essence of categories.

I am particularly interested in Category Theory in relation to functional programming. Actually, Haskell and Scala are frequently discussed in the context of category theory, see, e.g., [An introduction to category theory and functional programming for scalable statistical modeling and computation](http://www.mas.ncl.ac.uk/~ndjw1/docs/djw-ctfp.pdf) (PDF), by Darren Wilkinson, in the case of Scala. By the way, these slides already provide a nice introduction to the topic at hand, notwithstanding the arguments made by the author against the use of the R software for statistical computing although I understand the idea --- anyway, take a look at [Darren Wilkinson's website](https://www.staff.ncl.ac.uk/d.j.wilkinson/): it is full of useful stuff for statistical programmers, and I always learn a lot by reading [his research blog](https://darrenjw.wordpress.com).

Back to the (partial) review. The first chapter provides some context and essential definitions: *categories*, consisting in the association of objects, arrows, composition of arrows and the identity arrow, with some examples like sets, vectors and topological spaces, or groups; *functors*, which can be viewed as type constructors in functional programming (any "type" in a given programming language can be viewed as a set in mathematics), and morphisms; and finally, *natural transformations* between functors. *Monads* are covered later in the book.

The author often shows side by side comparison of Haskell and C/C++ or Python snippets. For example, Python has [numpy](http://www.numpy.org) to manage efficiently lists as "arrays", but here is how we would formally define a list in Haskell (in a recursive manner):

```haskell
data List a = Nil | Cons a (List a)
```

It follows immediately that a list of `a` is either empty (`nil`) or is a concatenation of other `a`'s (with the familiar `cons`). And now, for the `List` functor:

```haskell
instance Functor List where
    fmap _ Nil = Nil
    fmap f (Cons x t) = Cons (f x) (fmap f t)
```

This yields either the empty set or a mapping between individual values and the given function `f`, which is roughly equivalent to the `map()` function in Python (or maybe, R), here using [unpacking](https://www.python.org/dev/peps/pep-0448/) facilities available in Python 3.5:

```python
[*map(lambda x: x**2, [1, 2, 3, 4])]
```

I also like the idea of the `Maybe` type in Haskell. This avoids lot of boring inline tests, so we could just write `data Maybe a = Nothing | Just a` in order to indicate that we want to return either no value or some type `a`.

The third chapter is on products and coproducts, and algebraic data types, where the product would correspond to a pair $(a,b)$ of objects in Haskell, e.g. `data Pair a b = Pair a b`, while coproducts are implemented as `Either` type: `data Either a b = Left a | Right b`. Here, this special type constructor hold either a value of type `a` or of type `b`, corresponding to the value constructors `Left` and `Right`. There are more maths in this chapter, like in the next one which deals with [Yoneda Lemma](https://en.wikipedia.org/wiki/Yoneda_lemma). In chapter 5, we have to deal with lambda calculus and its extension, typed $\lambda$-calculus, and chapter 6 is all the way pure maths. As there are no practical applications in those chapter, it was really hard to follow---and I am not sure I really grasped all details. At this point, I decided to take a break before rereading these chapters when I have more time.

Compared to [Category Theory for Programmers](https://github.com/hmemcpy/milewski-ctfp-pdf), I would say that this textbook is more oriented toward maths than computer code, which makes sense after all given the very precise title. However, the author frequently refers to Milewski's blog posts so that they remain close in essence. I started reading *Category Theory for Programmers*, and I find it easier to follow, notwithstanding the fact that it includes a lot more examples and exercises. And as Bartosz Milewski wrote himself in his preface, I can confirm he has a certain way of explaining things:

> For some time now I’ve been floating the idea of writing a book about category theory that would be targeted at programmers. Mind you, not computer scientists but programmers --- engineers rather than scientists. I know this sounds crazy and I am properly scared. I can’t deny that there is a huge gap between science and engineering because I have worked on both sides of the divide. But I’ve always felt a very strong compulsion to explain things.

Here are a few additional links on Category Theory:

1. [Seven Sketch in Compositionality](http://math.mit.edu/~dspivak/teaching/sp18/), also [published on arXiv](https://arxiv.org/pdf/1803.05316)
2. [Basic Category Theory](https://arxiv.org/abs/1612.09375)
3. [Category Theory in Context](http://www.math.jhu.edu/~eriehl/)
4. [Category Theory for Scientist](http://math.mit.edu/~dspivak/)
5. [Computational Category Theory](http://www.cs.man.ac.uk/~david/categories/book/book.pdf) (PDF)

Only freely available textbooks are listed above, and they are not sorted in any particular order: number of pages, math content, or computer applications.[^1]

{{% music %}}Suede • *Dog Man Star*{{% /music %}}

[^1]: As you will notice, all textbooks are typesetted using $\LaTeX$, and it is not hard to realize that all those shiny diagrams may otherwise be very hard to render. Some authors make use of [tikzcd](https://ctan.org/pkg/tikz-cd), but see [Commutative diagrams in Latex](http://cat.boffosocko.com/2015/05/commutative-diagrams-in-latex/) or this TUGboat article, by Gabriel Valiente Feruglio: [Typesetting Commutative Diagrams](https://www.tug.org/TUGboat/tb15-4/tb45vali.pdf) (PDF).
