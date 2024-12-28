---
title: "December in review"
date: 2024-12-23T19:07:58+01:00
draft: false
tags: ["readings"]
categories: ["2024"]
---

- [Dividing unsigned 8-bit numbers](http://0x80.pl/notesen/2024-12-21-uint8-division.html): Interesting technical articles with lot of benchmarks on SIMD-based floating point (long) division. The takeaway message is that AVX-512 implementation performs best over all other competitors.
- Besides lot of stuff to read from his [tech blog](https://code.dblock.org), I particularly like Daniel Doubrovkine's art gallery, e.g. the [Large Sanguine Drawings](https://art.dblock.org/2015/01/02/large-sanguine-drawings.html).
- [Should You Ditch Spark for DuckDb or Polars?](https://milescole.dev/data-engineering/2024/12/12/Should-You-Ditch-Spark-DuckDB-Polars.html): I've used DuckDB in the past, and I was impressed by its performance and how easy it was to install [extensions](https://duckdb.org/docs/extensions/overview.html). Spark, uh, it was a long time ago and I no longer have any calculations that require this type of distributed calculation. I'm sticking with the [datatable](https://datatable.readthedocs.io/en/latest/) module whenever I can, but I don't that much stuff in Python these days. From what I read, the author suggests that Polars offers very good performance when it comes to Small Result Aggregation but overall DuckDB is a winner in most benchmarks. This is not surprising, after all, since Polars primarily targets data structures that are best represented as data frames.
- [Plotting Prime Numbers](https://jaketae.github.io/study/prime-spirals/): Not something new to me since I already came across a post like this but this was refreshing.
- [Sandboxing on macOS](https://bdash.net.nz/posts/sandboxing-on-macos/): And to think I was reading this kind of article when my Linux laptop hadn't yet crashed! Anyway, I was just curious to understood how it all works under the hood. It is noteworthy that OpenBSD (pledge and unveil) and Qubes OS (domains and app qubes) offer equivalent gatekeeping strategies.
- [Derivative AT a Discontinuity](https://alok.github.io/2024/09/28/discontinuous-derivative/): Or how to differentiate the Heaviside function using actual functions rather than distributions.
- [Using Pandoc and Typst to Produce PDFs](https://imaginarytext.ca/posts/2024/pandoc-typst-tutorial/): I always enjoy learning how folks think about their workflow, and the tools they use. I learned about Typst one or two years ago maybe, but I never gave it a try. I'm stuck with my arcaned Markown or Org -> $\TeX$ workflows, usually processed via Emacs[^1] or Pandoc.
- [How Much Memory Do You Need in 2024 to Run 1 Million Concurrent Tasks?](https://hez2010.github.io/async-runtimes-benchmarks-2024/): A comparison of coroutine vs. multiple threads (older post).
- [Minecraft Enchantment Ordering Tool](https://www.iamcal.com/tags/minecraft/): Because why not.
- [A joke in approximating numbers raised to irrational powers](https://www.andreinc.net/2024/11/18/a-function-to-approximate-raising-small-numbers-to-small-irrational-powers): I let you dive into the "monster" function ;-)

> I was really excited to also find a document that I had created in 1991 or so listing the games and “creator codes” that I had used in these games. Creator codes were like a very crude “bundle identifier” back in the pre-OS-X era of the Macintosh. They were supposed to be unique from all other application creator codes. The document is interesting to me today because in it I had cataloged the projects that I had worked on up to that point. --- [Move Fast and Abandon Things](https://engineersneedart.com/blog/movefast/movefast.html)

- [Text based email workflow on macOS](https://macowners.club/posts/text-based-email-workflow-macos/): Neomutt with a Mu backend for finding contact and fast indexing/searching facilities is great, trust me.

[^1]: Okay, I gave up on Emacs, but I still have dozens of Makefile that rely on it.

{{% music %}}Arcade Fire • _Vampire/Forest Fire_{{% /music %}}
