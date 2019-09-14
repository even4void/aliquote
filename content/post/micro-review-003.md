---
title: "Micro review from September (2)"
date: 2019-09-14T08:51:17+02:00
draft: false
tags: ["readings"]
categories: ["2019"]
---

Here is the monthly micro review of (not so) random links I found while browsing the interweb lately.

<!--more-->

- [Patch Workflow With Mutt - 2019](http://kroah.com/log/blog/2019/08/14/patch-workflow-with-mutt-2019/). Even if I am not using Mutt for reading/writing emails (and I no longer have that many emails to read/write these days), I always find interesting to read others' approach to email processing. This is a good read, full of interesting ideas (and not only re. GTD). In the same spirit, I like reading posts about Emacs and Org. Soon or later, they will end up on [Irreal blog](https://irreal.org/blog/), so I just have to check my RSS feeds from time to time. Or I may happen to find ones myself, e.g., [A Daily Journal in Org Mode](http://zerolib.com/journaling-procedure.html). John Jacobsen's website and Github repository is full of good ideas and tips that I like to read when I have some free time. And guess what? This site was done using Org mode (and [a bit of Clojure](https://github.com/eigenhombre/organa)). This site is not just about programming (e.g., [l.26-97](https://github.com/eigenhombre/rosalind/blob/master/src/rosalind/core.clj) if you ever try to solve [Rosalind](http://rosalind.info/) problems), though; see, e.g.: [Reflections on a Year of Daily Memory Drawings](http://zerolib.com/daily-composition-lessons-learned.html)---lovely, isn't it?

- [Thoughts on Racket2](https://beautifulracket.com/appendix/thoughts-on-racket2.html). A few weeks ago I mentioned some hot news from the latest Racket conf, namely the fact that the next-gen Racket (aka Racket2?) will probably be parenthesis-free. Matthew Butterick has a much more detailed overview of the points raised by Matthew Flatt, and he has some very on the point thoughts on the future of Lisp languages.

      > In the case of Lisp languages like Racket, Matthew Flatt is right: among a certain audience of potential users, parentheses are a deterrent. Who knows why? But in the last 60 years, simply grabbing these dissenters by the lapels and fumigating them with the stinky garlic breath of parenthesized S-expressions has not been a winning strategy. If Lisp partisans want different results in the next 60 years, we need to try something new.

- [DVC](https://dvc.org) is the new Git for Machine Learning projects. This sounds cool, and I will try it as soon as the opportunity arises. In the past, I have used various strategies for dealing with large files (mostly ending up in the `.gitgnore`), getting rid of IPython notebooks output (removed from Git versioning using [nbstripout](https://github.com/kynan/nbstripout)), or managing dependencies ([packrat](https://rstudio.github.io/packrat/) in R, virtual environments using [pyvenv](https://docs.python.org/3/library/venv.html) in Python). This project apparently brings an extra dose of control while putting the emphasis on sharing and reproducibility.

- Back when I was teaching applied biostatistics, I used to use some falied attempts by geneticians and/or bioinformaticians at using Excel to store their results (remember the DEC1 story or that paper where authors mistakenly deduplicated their data?). Now, I just found this: [One in five genetics papers contains errors thanks to Microsoft Excel](https://www.sciencemag.org/news/2016/08/one-five-genetics-papers-contains-errors-thanks-microsoft-excel).

- Today I learned about [Codeberg](https://codeberg.org), thanks to [Jan-Lukas Else](https://jlelse.blog/links/2019/09/codeberg/). This apparently is a serious alternative to Github or Gitlab, or even self-hosted Gitea instances. I do not want to switch to another Git platform---I've heard a lot about [sourcehut](https://sourcehut.org) recently, but it looks like people always complains about Github, and finally end up being there anyway. Next to this, Jan-Lukas had have several other interesting posts in the recent weeks, including one on [rwtxt](https://github.com/schollz/rwtxt), a CMS for absolute minimalists, or [webmentions](https://indieweb.org/Webmention), which I wish I used when I began this blog.

- Alexis King posted a new blog entry, and it is a beautiful piece of work on [Monad transformers](http://lexi-lambda.github.io/blog/2019/09/07/demystifying-monadbasecontrol/?utm_source=all&utm_medium=RSS) and Haskell. Even if I have some hard time to follow or understand everything, I would highly recommend this post to people interested in FP, and Haskell specifically. My experience with reading ALexis's posts, especially those that relate to Racket, is that you will always learn something, or discover new facets to questions you thought you had solved. [It's in the details](http://www.pragma-ade.com/general/manuals/details.pdf) (PDF), as [they](http://www.pragma-ade.com) used to say.

- [Generators from Scratch](https://defn.io/2019/09/05/racket-generators/) is all about Python and Racket generators, one of the powerful machinery of Python, together with list comprehensions and [itertools](https://docs.python.org/3/library/itertools.html) module. As you may have already guessed, Racket also comes equipped with generators, but also the [`call/cc`](https://stackoverflow.com/q/22888722), which stands for [call with current continuation](http://www.madore.org/~david/programs/unlambda/#callcc).[^1] There is a little video at the end of the post, where Bogdan Popa uses the Racket debugger under Emacs to illustrate all this. It is quite short, so don't be afraid to sit down and learn a bit more about Racket internals.

- [Plain Text Emails, Please](https://bradleytaunt.com/plain-text-emails/). I have always thought about plain text emails as a way to avoid malicious code lurking into HTML divs, or simply to avoid all the fuzz about mail readers---notwithsanding the fact that it was way harder to process HTML emails under Emacs or Mutt several years ago. Apparently, there are other reasons why HTML emails became so popular, as Bradley Taunt explained.

      > Plain text can certainly have a reputation for looking lazy or cheap, but I feel this is mostly perpetuated in the design and marketing communities. I can assure you that your average day-to-day users are much less opinionated about your email campaign design than you are. Look to satisfy your customers’ needs before your own.

**Blog rolling**:

- [How UTF-8 works](http://feedproxy.google.com/~r/TheEndeavour/~3/zpg4Q-hjzDo/), on John Cook's blog: Nice exposition of UTF-8 internals; see also the related post: [Excel, R and Unicode](http://feedproxy.google.com/~r/TheEndeavour/~3/RrngOUWdZoU/).
- Some useful tips and tricks on [brace expansion in Bash/Zsh](https://leancrew.com/all-this/2019/09/brace-yourself-im-in-an-expansive-mood/), by Dr. Drang.
- [Non-parametric survival function prediction](https://dataorigami.net/blogs/napkin-folding/non-parametric-survival-function-prediction), by Cameron Davidson-Pilon, or how to improve the use of neural networks to predict survival functions.
- [Interactive Maps in the DrRacket REPL](https://alex-hhh.github.io/2019/09/map-snip.html?utm_source=all&utm_medium=RSS). Another nice post by Alex Harsányi, again on Racket and how to foster the graphical capabilities of its IDE, [DrRacket](https://docs.racket-lang.org/drracket/).

[^1]: I realize that I have been following David Madore's weblog for years, but I never found a good occasion to cite one of his post or webpage on this site. Accomplishment unlocked!
