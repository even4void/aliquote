---
title: "So many programming languages"
date: 2011-01-11T10:17:08+01:00
draft: false
tags: ["misc"]
categories: ["2011"]
---

This is a short overview of several programming languages that I play with when I have some time.

I can remember that my very first programming language was Turbo Pascal; it was an introductory course taught to students enrolled in experimental psychology and the design of psychophysical experiments. Then, I used Matlab a lot during 3 to 4 years. It serves as a statistical package to analyze my data, but it was also a tool to construct visual stimuli and learn basic principles of image and signal processing. I even build a GUI for signal processing and data analysis. During my PhD, I started learning C and Java, while attending a lot of statistical courses. It was also the time I definitively switched to the R statistical package. I learned a little bit of Perl, and then discovered Python, which I mostly used like Bash until recently where I started to use it for some heavy computational statistical tasks.

Now, a lot of more or less "esoteric" languages has emerged, not that they are necessarily very new but since I'm not a true computer scientist I'm not always up to date. Among those languages that I wish I had time to learn more, there are: [Ruby](http://ruby-lang.org/), [Scala](http://www.scala-lang.org/), [Haskell](http://www.haskell.org/haskellwiki/Haskell), [Lua](http://www.lua.org/), [Clojure](http://clojure.org/), and a lot of stuff around Lisp ([clisp](http://www.gnu.org/software/clisp/), [Chicken](http://www.call-cc.org/), [CMUCL](http://www.cons.org/cmucl/), [SBCL](http://sbcl.sourceforge.net/), [Clozure CL](http://www.clozure.com/clozurecl.html), [Lush](http://lush.sourceforge.net/)).


## Scala

The [Scala](http://stackoverflow.com/questions/tagged/clojure) programming language is "a general purpose programming language designed to express common programming patterns in a concise, elegant, and type-safe way. It smoothly integrates features of object-oriented and functional languages, enabling Java and other programmers to be more productive."

Something that I like is that there is a package manager, [sbaz](http://www.scala-lang.org/node/93), which allows to install additional packages and update the current version of Scala. Also, the [documentation](http://www.scala-lang.org/node/197) sets is impressive. Look for instance at <i class="fa fa-file-pdf-o fa-1x"></i> [A Scala Tutorial for Java programmers](http://www.scala-lang.org/docu/files/ScalaTutorial.pdf) to get a feel of it.

Here is a concise [Cheat sheet](http://anyall.org/scalacheat/), and here is a discussion of Scala vs. Clojure: [Scala vs Clojure - Round 2: Concurrency!](http://www.bestinclass.dk/index.clj/2009/09/scala-vs-clojure-round-2-concurrency.html).

## Haskell

I discovered [Haskell](http://www.haskell.org/) three or four years ago when reading [Vincent Zoonekynd](http://zoonek.free.fr)'s blog ([here](http://zoonek.free.fr/blosxom/Linux/2007-01-01_Haskell.html)). I initially thought it was something to do fun things in mathematics, and never came back to it until recently when I came across this interesting paper on functional programming for information visualization and visual analytics: <i class="fa fa-file-pdf-o fa-1x"></i> [Beautiful Code, Compelling Evidence](http://www.renci.org/wp-content/pub/tutorials/BeautifulCode.pdf), by J. R. Heard. There is a nice illustration with annotated code on the use of circular displays based on OpenGL (that I also discussed in a [preceding post](/post/dwelling-upon-circular-displays)).

![](/img/20110213110747.png)

Since then, I also started using [Pandoc](http://johnmacfarlane.net/pandoc/), which has now replaced [AsciiDoc](http://www.methods.co.nz/asciidoc/) for writing my notes and tutorials.

Like for Ruby and its [Rubiz Quiz](http://www.rubyquiz.com/), there is an Haskell Quiz for the interested hackers.

## Clojure

I've started to learn Clojure, because of the rise of [Incanter](http://incanter.org/) in (part of) the statistical community.

[R. Mark Volkmann](http://java.ociweb.com/mark/clojure/) did a good job at exposing the main ideas of Clojure in [Clojure - Functional Programming for the JVM](http://java.ociweb.com/mark/clojure/article.html). On a related point, I also like <i class="fa fa-file-pdf-o fa-1x"></i> [From Lisp to Clojure/Incanter and R](http://files.meetup.com/1406240/From%20Lisp%20to%20Clojure-Incanter%20and%20R.pdf), by [Shane Conway](http://www.statalgo.com), because it offers a comparative view of Clojure and R approaches. A lot of other discussions may be found on [Stack Overflow](http://stackoverflow.com/questions/tagged/clojure). Actually, I'm still in the process of learning the language.

A bunch of free resources on Clojure:

- <http://clojure.org/>
- [ClojureDocs](http://clojuredocs.org/)
- [Data Sorcery with Clojure](http://data-sorcery.org/)
- [Clojure Labs](http://foognostic.net/labrepl-summary/)

There are actually two books that are worth to look at:

- Stuart Halloway, [*Programming Clojure*](http://pragprog.com/titles/shcloj/programming-clojure), The Pragmatic Bookshelf, 2009 -- with [code available](http://bit.ly/ea4Wh6) on Github
- Luke VanderHart and [Stuart Sierra](http://stuartsierra.com/), [*Practical Clojure*](http://apress.com/book/view/1430272317), Apress, 2010

For a quick try, you can jump at [Try Clojure](http://www.try-clojure.org/). A comparison of [Erlang vs Clojure](http://groups.google.com/group/clojure/browse_thread/thread/2a2b24ffef5d1631) is available on Google Groups. Likewise, there were some [Scala vs Clojure](http://www.bestinclass.dk/index.clj/2009/09/scala-vs-clojure-round-2-concurrency.html) discussions.

As for dedicated libraries, I'd like mention the following ones for Machine Learning and data processing:

- [Infer](https://github.com/bradford/infer), by [Bradford Cross](http://measuringmeasures.com/)
- [Injuce](https://github.com/mreid/injuce/), by [Mark Reid](http://mark.reid.name/) (don't know how this project will evolve, though)
- [clojure-hadoop](https://github.com/stuartsierra/clojure-hadoop)


## Groovy

Yet another dynamic programming language that targets the Java Virtual Machine. Following the online description, it is an agile and dynamic language for the Java Virtual Machine; it builds upon the strengths of Java but has additional power features inspired by languages like Python, Ruby and Smalltalk; it seamlessly integrates with all existing Java classes and libraries; and it compiles straight to Java bytecode so you can use it anywhere you can use Java. I have no experience with it, though.

The famous "Hello World" example with groovy reads:

```
groovy -e "println 'Hello ' + args[0]" World
```

![h/t @yokofakun](/img/20110213111034.png)


## Lua

Well, [Lua](http://www.lua.org/) is a lightweight programming language very useful for automating tasks and interacting with the operating system. According to the documentation, it is robust, fast, portable, embeddable, and powerful yet remaining simple when implementing classes and inheritance. I initially came across this language through Context because the MkIV implementation relies on it, and more generally the [LuaTeX](http://www.luatex.org/) engine (but see, e.g, [ConTEXt MkIV: Going UTF](http://www.tug.org/TUGboat/Articles/tb28-3/tb90hagen.pdf), by Hans Hagen).

In [another post](/post/yet-another-interactive-prompt-for-calculus/), I described how to install [Numeric Lua](http://numlua.luaforge.net/), which offers some convenient numerical functions, on the Mac.

Some good tutorials to get started with Lua are listed below:

- [The Lua Tutorial](http://luatut.com/), which features an introduction to Lua scripting and a crash course in Lua programming
- [Lua: for beginner](http://lua.gts-stolberg.de/en/index.php?uml=1), which offers a gentle introduction to programming with Lua

There is also an extensive [documentation](http://www.lua.org/docs.html) on Lua website, don't miss it.


## Pure

[Pure](http://code.google.com/p/pure-lang/) is "a modern-style functional programming language based on term rewriting. It offers equational definitions with pattern matching, full symbolic rewriting capabilities, dynamic typing, eager and lazy evaluation, lexical closures, built-in list and matrix support and an easy-to-use C interface. The interpreter uses LLVM as a backend to JIT-compile Pure programs to fast native code."

I didn't success in compiling and installing Pure. It needs a recent version of LLVM compiler and it seems that the one that ships with OS X doesn't do the job.
