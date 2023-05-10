---
title: "April in review"
date: 2023-05-09T21:04:48+02:00
draft: false
tags: ["readings"]
categories: ["2023"]
---

Interesting things I found while browsing the internet.

- [Eli Bendersky](https://eli.thegreenplace.net/2023/twenty-years-of-blogging/)'s blog turned 20 recently. Last year it was the turn of [Simon Willison](https://simonwillison.net/2022/Jun/12/twenty-years/)'s one. So much nice stuff and things to learn on those weblogs.

- [Atuin](https://atuin.sh/) might be a handy replacement for fzf when it comes to manage my shell history. From what I've read, there are some interesting features like fuzzy search using [Skim](https://github.com/lotabout/skim), pattern-based deletion, activity log, custom filters and statistics, and many more.

- Reading [macOS Internals](https://gist.github.com/kconner/cff08fe3e0bb857ea33b47d965b3e19f) reminds me of my old days with macOS (I still prefer the old _Mac OS_ naming scheme), especially the good parts since I stopped upgrading all my machines after Mojave. If you still work on macOS, go read some of those items, which were published on Ars technica, you will surely learn useful stuff and understand macOS became the OS it is nowadays.

- I came across one of Rachel Kroll's post where she shared her [minimalistic setup](https://rachelbythebay.com/w/2018/12/21/env/), including interesting pieces of config for nano, her daily driver editor (but see her [related post](https://rachelbythebay.com/w/2011/09/24/editor/)). I find it fascinating that the same config has been used for so many years.

- I've used [polars](https://github.com/pola-rs/polars) in Python, yet I did not run any serious comparison or benchmark against pandas or [datatable](/post/python-datatable/). It would be nice to have something like that for Racket, as well as Apache [Arrow](https://github.com/apache/arrow) (I thought I saw a related package on GitHub, but I cant' get my hands on it anymore).

- [Let's Build a Simple Database](https://cstack.github.io/db_tutorial/). Not the first time I came across this kind of blog posts, but I wanted to mention it here, for the record.

> I'm not exaggerating when I say assertions are the greatest thing since sliced arrays, and have cut my debugging time by half.<br>
> Rule of thumb: Every time you think something is true about your data, and it's not ensured by the type system, add an assertion that checks it.<br>
> Don't just occasionally use them, drench your code in them. When your code so much as sneezes, they should shake off like sand after the beach. This is the way. --- [How To Survive Your Project's First 100,000 Lines](https://verdagon.dev/blog/first-100k-lines)

- John D. Cook once wrote about posits, and here is [another article](https://nhaehnle.blogspot.com/2017/09/posits.html?m=1) on this topic. Besides the cost-accuracy trade-off, the TL;DR seems to be: "Posits have an elegant design based on thinking about numbers projectively, but the lack of NaNs, the two's complement representation, and not having signed zeros and infinities may be alien to some floating point practicioners."

- Yet another X11-based terminal emulator which I never tried, but the benchmarks look impressive: [Measured: Typing latency of Zutty (compared to others)](https://tomscii.sig7.se/2021/01/Typing-latency-of-Zutty).

- I watched strager's YT video on [hashing](https://www.youtube.com/watch?v=DMQ_HcNSOAI) and I highly recommend it, much like any of his live streams on Twitch or blog posts. Incidentally, I found this interesting post (after landing on [Beautiful Branchless Binary Search](https://probablydance.com/2023/04/27/beautiful-branchless-binary-search/)) about another way of defining a hash function: [Fibonacci Hashing: The Optimization that the World Forgot (or: a Better Alternative to Integer Modulo)](https://probablydance.com/2018/06/16/fibonacci-hashing-the-optimization-that-the-world-forgot-or-a-better-alternative-to-integer-modulo/). See also [Modern perfect hashing for strings](http://0x80.pl/notesen/2023-04-30-lookup-in-strings.html).

- I keep getting some of the emails I send from this domain name to Gmail users rejected by Google. I find it a pity, but go read [Is Gmail killing independent email?](https://tutanota.com/blog/posts/gmail-independent-email) if you want to learn more. I may be wrong, since I'm not using a self-hosted email provider, but sadly I left Gmail to not live at the expense of a single supplier and I'm left with undelivered messages on the other end.

- [A visual book recommender](https://nathanrooy.github.io/posts/2023-04-12/visual-book-recommender/). Lovely.

{{% music %}}Michael Foster • _Resin Rain_{{% /music %}}
