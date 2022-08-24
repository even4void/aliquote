---
title: "Lost+found 2019"
date: 2019-12-24T15:36:12+02:00
draft: false
tags: ["this"]
categories: ["2019"]
---

Cleaning some old Org notes from nowhere.

## Agile Data Science

After reading a lot of papers and books on Agile methodology, and in particular Agile principles applied to data science, I came to the conclusion that I was not that far from the principled ways when I was working as a medical statistician. As far as I am concerned, I always felt like the guys with whom I was working on a project must be kept informed of the progress of my report in real time, even if it was only a rough draft or when little has changed since the previsous version. "Researchers and data scientists, who work on longer timelines than agile sprints typically allow, generate data daily—albeit not in a “publishable” state. In Agile Big Data, there is no unpublishable state. The rest of the team must see weekly, if not daily (or more often), updates in the state of the data. This kind of engagement with researchers is essential to unifying the team and enabling product management. That means publishing intermediate results—incomplete data, the scraps of analysis". (cite:jurney-2014-agile-data-scien)

As a matter of fact, data scientists and decision makers or business men do not work on the same time frame. As someone used to say for programmers, data scientists will generally need to three to four hours on a project, without being interrupted by short or longer last minute meetings.

- FIXME: check for the reference about programmers
- TODO: Jurney exposes similar concerns in § "Agile Environments: Engineering Productivity".

**References:**

- [Taking an Agile Approach to Data Science](https://www.datascience.com/blog/agile-data-science)
- [Is the agile approach applicable in data science projects?](https://www.quora.com/Is-the-agile-approach-applicable-in-data-science-projects)
- [Agile Data Science](http://2016.agileturas.lt/vilnius/wp-content/uploads/2016/10/5.3-2-Waclaw-Kusnierszyk-Agile-Data-Science.pdf)

## OCaml

I played with OCaml during the last two weeks or so. I used the following online courses which I must admit are really well organized: [Functional Data Structures](https://cs.uwaterloo.ca/~plragde/flaneries/FDS/) (FDS) and [Data Structures and Functional Programming](https://www.cs.cornell.edu/courses/cs3110/2017fa/) (DSFP).

In DSFP, the author suggests that to learn a new programming language (PL), there are a couple of aspects that we need to focus on, including: syntax, semantics, idioms, libraries, and tools. Concentrating on sema ntics and idioms is the most important aspect to learning a new PL since it amounts to understand what the program really does and what are good design patterns for using that particular language. OCaml is a statically-typed and type-safe programming language, featuring algebric datatypes, type inference, parametric polymorphism, garbage collection, and modules. It is one of the successor of ML, which was d evised after Lisp itself in the 60's. It is interesting to study the design of this language especially for those that are into Scala these days, and more generally to get a deep understanding of what we might call a principled approach to functional programming.

Note that the following expression does not evaluate to 2 as it simply doesn't type check: (However, the compiler is able to perform type inference.)

```ocaml
if 22=0 then "bear" else 2
```

Importantly, a function is a value which is clearly apparent when using anonymous functions, also called lambda expressions: (mostly like in Clojure but with a simpler syntax)

```ocaml
let inc = fun x -> x+1
let inc x = x+1
```

Ironically, while I hate the piping approach that is being popularized in R, OCaml also has a pipeline operator. Instead of `f e`, we can write `e |> f`, so that `5 |> inc |> square` computes the square of 5+1 (36, as in `square(inc 5)`, provided `inc` and `square` are implemented beforehand.

Type inference is performed automagically by the compiler. So, instead of specifying the type of each variable, it would be possible to omit all type annotations in the following example:

```ocaml
(* requires: y>=0 *)
(* returns: x to the power of y *)
let rec pow (x:int) (y:int) : int =
  if y=0 then 1
  else x * pow x (y-1)
```

OCaml also allows to define mutually recursive functions, e.g.:

```ocaml
let rec even n =
  n=0 || odd (n-1)
and odd n =
  n<>0 && even (n-1);;
```

It is worth noting that it is safer to always exit the "toplevel" (`utop`) when testing or debugging.
