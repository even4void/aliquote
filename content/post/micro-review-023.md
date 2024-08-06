---
title: "February in review"
date: 2023-02-27T08:33:14+01:00
draft: false
tags: ["readings"]
categories: ["2023"]
---

- [Learn Vim (the Smart Way)](https://github.com/iggredible/Learn-Vim): Yet another tutorial on using Vim effectively. The author highlights the use of fzf as a fuzzy finder, which further motivates taking advantage of Vim inner features.

> Everyone programs differently. Upon introspection, you will find that there are one or two features from your favorite editor / IDE that you use all the time. Maybe it was fuzzy-search, jump-to-definition, or quick compilation. Whatever they may be, identify them quickly and learn how to implement those in Vim (chances are Vim can probably do them too). Your editing speed will receive a huge boost.

- It's been a long time since I last read some obfuscated code, and it was always [C code](https://www.ioccc.org/). This one does the job, and it is written in Haskell: [Squeezing a sokoban game into 10 lines of code](https://www.cole-k.com/2023/02/21/tiny-games-hs/). See also [How I would do FizzBuzz](https://bostick.github.io/blog/2022/05/fizz-buzz/), by the author of the LSP ecosystem in Mathematica.

- [poste.io](https://poste.io/) offers SMTP + IMAP + POP3 + Antispam + Antivirus Web administration + Web email. I know it's a hard job, and I won't host my own mail server, even if Gmail sucks with randomly blacklisting my own email address with error code 550 5.7.26. Anyway, in case someone is looking for a quick way to handle his/her emails from a local computer.

- In [Few lesser known tricks, quirks and features of C](https://blog.joren.ga/less-known-c), I learned about a fun way to use [named parameters](https://blog.joren.ga/less-known-c#named-function-parameters) in function call.

- [Programming Odds & Ends](https://m-clark.github.io/posts/2022-07-25-programming/#coalesceifelse): There's a lot to learn and keep in mind when using R and/or Python (sadly, there's no real benchmark with Pandas or [datatable](/post/python-datatable/)). And now I know there's something new called the [fastverse](https://fastverse.github.io/fastverse/), which includes the [data.table](https://github.com/Rdatatable/data.table) package. As the author suggests, "you may not [always] want an additional package dependency beyond what you’re using, and may need a base R approach.". Keeping it small and low on external dependencies is always good.

- [sqliteviz](https://sqliteviz.com/): Instant offline SQL-powered data visualisation in your browser. Looks great. Here's what I came up in a few clicks with our ToothGrowth dataset from previous posts:

{{< figure src="/img/2023-02-27-10-29-02.png" >}}

{{% music %}}Chip Wickham • _Sais_{{% /music %}}
