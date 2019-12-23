---
title: "Micro review from December"
date: 2019-12-23T16:51:24+01:00
draft: false
tags: ["readings"]
categories: ["2019"]
---

Here is the monthly micro review of (not so) random links I found while browsing the interweb lately. Winter is here, I'm off for two weeks, so I shall be brief. Here are the tabs that are still opened on my iPhone, in reverse chronological order (most recent first).

[MacOS Design Review](http://macos-design-review.com) has some tips and opinionated notices on macOS design in its most recent incantations. I came across this site thanks to [@nikitonsky](https://twitter.com/nikitonsky/status/1209124927980355586?s=20). I do not use Dark Mode, even if my Terminal app and my Emacs current config are all white on dark. I tried it for a week or two, and then gave up, as I thought it was not a very polished thing --- and wtf, how can you read you mail in Mail app uisng Dark mode? Oh, simply use the mixed mode, so that you get a semi dark app?

> It’s not a disaster. But it falls short of the standard Apple used to hold themselves to.

Handling missing data is always a fuzz in statistical software. John Myles White wrote a nice [post](https://www.johnmyleswhite.com/notebook/2014/11/29/whats-wrong-with-statistics-in-julia/) on this topic with regard to [Julia](https://julialang.org/blog/2018/06/missing) a while back. Now, it looks like similar concerns were raised in the Python ecosystem, especially the Pandas package: [Towards consistent missing value handling in Pandas](https://jorisvandenbossche.github.io/blog/2019/11/30/pandas-consistent-missing-values/). According to this post, `pd.NA` is a new NA value for representing scalar missing value; this includes integers, bools and strings for [ExtensionArray-based](https://pandas.pydata.org/pandas-docs/stable/development/extending.html) data types. Evan Miller once suggested to rely on weighted statistics everywhere (on his Tumblr for Wizard, which is no longer available at the time of this writing --- this has been [discussed](https://github.com/JuliaLang/julia/pull/9363) on Github, though), in order to avoid extra loop to check for possible missing value. That's a clever idea, IMO, that I will implement in my tiny stats package for Racket.

I keep hearing of webmentions from many of my RSS feeds. People get tired of Disqus, of course, and the indieweb is is becoming more and more fashionable these days. Comments are disabled on this site, despite some raging ideas [here](https://blog.codinghorror.com/a-blog-without-comments-is-not-a-blog/) and [there](https://fizzle.co/sparkline/debate-should-you-allow-comments-on-your-blog-find-out-what-two-remarkably-popular-bloggers-think). Those who want to get in touch still have access to my mail and my Twitter, as [someone](https://eli.thegreenplace.net/2018/turning-off-blog-comments/) used to say. Thanks to those who have contacted me by mail about my posts, btw! Anyway, back to webmentions: if you are on micro.blog, you may be interested in reading this [post](https://shindakun.dev/posts/adding-webmentions-to-microblog/), while for Hugo Jan Lukas Else has a nice series of [posts](https://jlelse.blog/micro/2019/12/2019-12-12-znats/) on his website.

Today I was remembered of the "[numerical tower](https://en.wikipedia.org/wiki/Numerical_tower)": (via [Irreal](https://irreal.org/blog/?p=8535))

> In Scheme and in Lisp dialects inspired by it, a numerical tower is the set of data types that represent numbers in a given programming language.

Lately I came across Kristopher Micinski slides on [program analysis](https://github.com/kmicinski/program-analysis) (see the `assets/slides` directory for PDF keynotes). If you are interested in functional programming, there are many interesting things on Lambda calculus, continuations and Racket.

[Reflecting on Reflection](https://ajpierce.com/reflecting-on-reflection/), or how to speed up Clojure by a factor of 17 by avoiding [reflection](https://www.geeksforgeeks.org/reflection-in-java/) and using [type hinting](https://clojure.org/reference/java_interop#typehints).

I'm slowly trying out Rust, and I discovered that there's something like Clojure kata for Rust, namely [rustlings](https://github.com/rust-lang/rustlings), i.e., small exercises to get you used to reading and writing Rust code!

Finally, here we go with the [history of macOS/OS X releases](https://robservatory.com/a-full-history-of-macos-os-x-release-dates-and-rates/) over the years. I'm still on Mojave and don't really expect to upgrade anytime soon. This reminds me of all the [reviews](https://aliquote.org/tags/apple/) I did about the successive versions of OS X, then macOS. Time goes by. To date, my preferred setup is clearly running Mojave on the macbook 12".