---
title: "Functional Programming: A PragPub Anthology"
date: 2019-03-10T09:34:34+01:00
draft: false
tags: ["readings", "review", "lisp", "clojure"]
categories: []
---
Better late than never, here is a quick check of some of my technical readings from last Summer. Let's start with [Functional Programming: A PragPub Anthology](https://pragprog.com/book/ppanth/functional-programming-a-pragpub-anthology), by Michael Swaine and the PragPub writers.

<!--more-->

I did not read the full book, but only the chapters I was interested in. Among the 5 different functional PLs discussed in the book--Scala, Haskell, Clojure, Elixir, and Swift (pending a single chapter on Lua)--I mostly focused on Clojure, Elixir, and Swift, knowing that I would probably never have any use of Elixir. I only went through the chapters about Scala. I like the way the authors lay the subject basis for the functional approach to programming when they say that it is all about functions, immutability, and above all "it's a way of thinking." 

> The choice of syntax isn't arbitrary. It enables the most powerful metaprogramming system yet created. It's powerful enough that the majority of the language is implemented using it. Looking at it another way, a Clojure developer has the power of a compiler writer at their fingertips.

Regarding Clojure, there is a short interview with Rich Hickey. Clojure is a LISP, so the code is data, and there is a powerful macro system under the hood. The language also features an unique approach to the concepts of identity (an entity associated with a series of values over time), value (an immutable piece of data), and state (the value of an identity at point in time), as discussed in Chapter 8. See also this presentation on [identity, state and value](http://jaoo.dk/dl/jaoo-aarhus-2009/slides/RichHickey_TheClojureConcurrencyStory.pdf) (PDF). Persistent data structures (maps, vectors and sets) are very specific to Clojure and its way of managing concurrency<sup>[^1]</sup> since these entities are able to preserve their previous version where they are modified, thanks to [structural sharing](https://clojure.org/reference/data_structures) (provided, e.g., [vectors are large enough](https://stackoverflow.com/a/18776545)) and "managed reference types", which ensures that all of the references (atoms, agents, or refs) being managed point at the latest value for a given identity. For instance, when you de-reference some data from an atom, it won't change without you knowing it or being able to return to the previous state. Chapter 9 adds further refinements to the use of agents and refs in the context of concurrent programming, considering an example of a system that keeps track of television series and episodes. While many people seem to complain about Clojure error messages and stack trace (see, e.g., Reddit, SO, or the internet to name [a](https://www.reddit.com/r/Clojure/comments/778tc2/is_clojure_19_improving_error_messages/) [few](https://stackoverflow.com/questions/16901836/how-do-i-get-better-feedback-from-clojure-errors) [threads](https://www.reddit.com/r/Clojure/comments/2x1viz/why_are_clojure_error_messages_so_awful/)), it has quite improved [over the years](http://insideclojure.org/2018/12/17/errors/), and if you are using [Cider](https://metaredux.com/posts/2019/01/01/happy-new-cider.html) you are in good hands for a long time. In any case, Stuart Halloway describes the condition system `error-type` that was part of [clojure-contrib](https://github.com/clojure/clojure-contrib) and that happens to provide an way elegant logging solution.

I will probably have more to say on Clojure once I finish writing my review of [Getting Clojure](https://pragprog.com/book/roclojure/getting-clojure), by Russ Olsen.

> Programming is not about data. It's about transforming data.

I don't know anything about Elixir, except what I read here and there, especially on [Evan Miller's website](https://www.evanmiller.org/elixir-ram-and-the-template-of-doom.html). However, I learned a few things, especially about [pattern matching](https://en.wikipedia.org/wiki/Pattern_matching), which in Elixir is the only way to bind a value to a variable or parameter. Moreover, pattern matching can be applied to anonymous or named functions. There is a nice illustration based on the [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) in Chapter 11. And also that "dependently typed languages are an elegant combination of computation and reasoning." (That one was quite easy since it is part of the TL;DR)

> That's the driving force behind the new hybrid languages: we want to be able to minimize mutability, but it's a mutable world.

The chapters on Swift were interesting, especially the one on functions<sup>[^2]</sup> and methods (Chapter 25), but I think I learned more from other books, probably because they were more focused on problems I tackle at work (e.g., [Classic Computer Science Problems in Swift](https://www.manning.com/books/classic-computer-science-problems-in-swift); see also, [High Performance Numeric Programming with Swift: Explorations and Reflections](https://news.ycombinator.com/item?id=18876759)). Anyway, I believe Swift is a nice language and I'd like to have time to invest some time digging into it a bit more. Again, Evan Miller has an [interesting review](https://www.evanmiller.org/swift-impressions.html) on the language (see also the [update here](https://www.evanmiller.org/things-that-bother-me-about-swift.html)). And of course, there's all the nice stuff put by [Chris Eidhof](http://chris.eidhof.nl) and [Ole Begemann](https://oleb.net).





[^1]: [Concurreny](https://clojure.org/about/concurrent_programming) refers to programs that run multiples processes or threads. Eli Bendersky has a nice post on [Launching Linux threads and processes with clone](https://eli.thegreenplace.net/2018/launching-linux-threads-and-processes-with-clone/).

[^2]: Note that, [here too](https://twitter.com/dkvasnickajr/status/1103393216441782272), we have a much shorter version to define a function.
