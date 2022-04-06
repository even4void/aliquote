---
title: "ArXiving on January 2022"
date: 2022-02-25T10:09:25+01:00
draft: false
tags: ["readings", "arxiv"]
categories: ["2022"]
---

Here are a few papers that I read over the past two months, in the CS and Stat category as usual.

At the time of this writing you can replace the x in ar*x*iv URL to get a pretty HTML rendering of the article. See below for the second article discussed above.

### Type Stability in Julia: Avoiding Performance Pathologies in JIT Compilation (https://arxiv.org/abs/2109.01950)

I still haven't really gotten into the Julia language. I follow the news here and there and I'm glad to know that there is now a native graphical backend, not just web output. The last time I tested Julia (v1.6), I found the runtime of a first script to be quite substantial, although I understand why that is the case. The language server is slow too, because of the initial indexing of the symbols contained in all the installed packages. Nevertheless, I think Julia has a future and I hope there will soon be a consolidated set of tools for statistical modeling, much like Frank Harrell's [rms][] package. As I said in a previous post, for the moment I want to investigate Racket and Lisp-like languages, or maybe Haskell, to see if they could provide a good fit for my own workflow (even if I rarely perform statistical analyses nowadays). Julia remains, however, an interesting approach to statistical computing nowadays.

### An Introduction to Quantum Computing for Statisticians (https://arxiv.org/abs/2112.06587)

Just out of curiosity, and because I was reading [Introduction to Classical and Quantum Computing][] (PDF) by Thomas G. Wong, I fetched this paper on quantum computing for statisticians. Well, I haven't read it actually, but this look interesting as far as I can tell.

### Aitchison's Compositional Data Analysis 40 Years On: A Reappraisal (https://arxiv.org/abs/2201.05197)

It's been a long time since I last read a paper written by Michael Greenacre. Last time was probably when I was working on multi-block methods back in 2016. This paper discusses the original approach to compositional data analysis, which is usually associated with lot of zeros in the dataset, and suggests that, contrary to the classical use of isometric logratios, soft constraints may yield correct and almost identical interpretation of the data in most cases. I have only skimmed the article but I will probably come back to it if I need to go deeper into the subject and the relationship between this type of approach and the techniques based on correspondence analysis.

### How ISO C became unusable for operating systems development (https://arxiv.org/abs/2201.07845)

The take-away message is that the primary reason why ISO C is poorly designed for OS development relates to a "design approach in the ISO standard that has given priority to certain kinds of optimization over both correctness and the 'high-level assembler' intentions of C, even while the latter remain enshrined in the rationale." Among other things, pointers (casting from and aliasing to) remain problematic in several edge cases.

I still use C because this is one of the first languages I learned when I was in grad school (after Turbo Pascal, you named it). I like it because of its syntax and its simplicity, but I usually only write toy programs so I don't have to bother with all its "pitfalls" regarding low-level and hard-core programming. I don't use C++, but I'm rather interested in learning Rust because I like the tooling as well as [rust-analyzer][]. Yet, I know it's a hard path.


{{% music %}}Laura-Mary Carter • _Town Called Nothing_{{% /music %}}

[Introduction to Classical and Quantum Computing]: https://www.thomaswong.net/introduction-to-classical-and-quantum-computing.pdf
[rms]: https://github.com/harrelfe/rms
[rust-analyzer]: https://rust-analyzer.github.io/
