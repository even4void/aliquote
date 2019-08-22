---
title: "Tech Review / March 2018"
date: 2018-03-19T09:03:24+01:00
draft: false
tags: ["readings", "review"]
categories: []
---

Some fresh news from Twitter and the internet without further ado.

<!--more-->

[How to Design Programs, Second Edition](http://www.htdp.org/2018-01-06/Book/) (MIT Press) is available online, together with Racket code. If Lisp is your thing, then go fetch [some Lisp code](https://github.com/norvig/paip-lisp) for Peter Norvig's falmous textbook, _Paradigms of Artificial Intelligence Programming_, on GitHub.

If you are after good tutorials on bayesian analysis and mixed-effects models, stop by [Michael Clark's website](http://m-clark.github.io/documents/). Surely you will learn something, and appreciate beautiful typography on the web.

{{< tweet 969842250959159296 >}}

These days, everything turns around Deep Learning, or just anything that we can call AI-related stuff. One can find several O'Reilly Newsletters or books, online course on Coursera and elsewhere, and various library in Pyhton, Java or other languages. I just skimmed over [Practical Deep Learning For Coders](http://course.fast.ai), from [fast.ai](http://www.fast.ai), which features seven two-hour video lectures and detailed notebooks, and it looks really cool.[^1] In his article [Data Visualization for Artificial Intelligence, and Vice Versa](https://medium.com/@plotlygraphs/data-visualization-for-artificial-intelligence-and-vice-versa-a38869065d88), Nicolas Kruchten discusses AI software, like [TensorFlow Graph Vizualizer](https://www.tensorflow.org/programmers_guide/graph_viz) or this beautiful [handwritten pattern recognition engine](https://distill.pub/2016/handwriting/), and how such technology-driven data visualization process might complement or replace human decision in various fields.

It looks like VS Code might become a viable and [faster alternative to RStudio](https://milesmcbain.xyz/alt-r-with-vscode/), according to Miles McBain. I tried VS Code for a couple of days, and came back to Emacs soon after I realized that I was missing some really cool features from dired, ess, cider, magit, org, and other packages. Since I barely do any R coding these days, I haven't tried the R plugin, but apparently there are several such plugins that are under active development.

The 2018 edition of the [Ihaka Lectures Series](https://www.stat.auckland.ac.nz/en/about/our-department/ihaka-lectures.html) is now live at the University of Auckland. The last talk was by [Paul Murrell](https://www.stat.auckland.ac.nz/~paul/) who presented his new package `BrailleR`, which generates text descriptions of R plots, along with some cool programming tips: (1) if a decision is difficult, don't make it; (2) if your tummy does not feel all warm inside, you have not got it right yet; (3) build a fish rod, not a fish; (4) be lazy; (5) not everyone uses Linux, (6) computers can multitask.

![](/img/ihaka-lectures-2018.jpg)

[IDEA](https://idea-instructions.com) offers "an ongoing series of nonverbal algorithm assembly instructions." Briefly, they use IKEA-like pictograms to demonstrate specific algorithms in computer science, e.g. quick sort or graph scan.

John Skeet---remember that guy who accumulated [over 1,000,000 reputation points](https://stackoverflow.blog/2018/01/15/thanks-million-jon-skeet/) on Stack Overflow?! He just wrote a blog post regarding [Stack Overflow Culture](https://codeblog.jonskeet.uk/2018/03/17/stack-overflow-culture/). It is worth reading it, even if you never participated to the Stack Exchange move. Interestingly, this post is an indirect reply to Rob Conery who decided to give up on Stack Overflow---Rob Conery is the author of the [Imposter Handbook]{{< ref "/post/imposter-handbook.md" >}} that I reviewed last week. John Skeet suggests that the main problem with SO is mostly like real life :

> Like most things in life, Stack Overflow works best when everyone has the same goal. We can all take steps towards that goal together. Conversely, when people in a single situation have different goals, that’s when trouble often starts.
> On Stack Overflow, the most common disconnect is between these two goals:
> Asker: minimize the time before I’m unblocked on the problem I’m facing
> Answerer: maximize the value to the site of any given post, treating the site as a long-lasting resource

[According to this Shiny app](https://t.co/Ew35JwfeXH), I'm a bot with 95% probability. Someone is probably wrong on the internet.

{{< tweet 973579441111748608 >}}

If you like Allen Downey textbooks (i.e., the "How to Think..." series), you will probably be interested in Ben Lauwens' [translation for Julia](https://benlauwens.github.io/ThinkJulia.jl/latest/chap01.html). This provides a great introduction to the core features of the Julia language.

{{% music %}}Timber Timbre • _Hot Dreams_{{% /music %}}

[^1]: See [Cats and Dogs With Cortex Redux](http://gigasquidsoftware.com/blog/2017/11/07/cats-and-dogs-with-cortex-redux/), by Carin Meier, for a Clojure version.
