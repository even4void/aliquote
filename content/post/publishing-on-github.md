+++
title = "Publishing on Github"
date = 2014-08-17T21:42:26+01:00
draft = false

tags = ["misc"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

GitHub is not only for source code.

## Publishing on GitHub

Github has long been the *de facto* platform to share and publish open-source code, notwithstanding the fact that it is becoming a dedicated host for [reproducible research](http://zmjones.com/git/); see, e.g., [The benefits of reproducible research: a public health example](http://git.io/TEMQ1w).

Now, there is also an increasing number of books or tutorials that are delivered through Github. For example, the source code for the beautiful [Smooth CoffeeScript](http://autotelicum.github.io/Smooth-CoffeeScript/) book is available on [GitHub](https://github.com/autotelicum/Smooth-CoffeeScript). The same applies for [Eloquent Javascript](http://eloquentjavascript.net), see the [source code](https://github.com/marijnh/Eloquent-JavaScript). Regarding the [R](http://r-project.org) statistical software, Hadley Wickham has long been developing and hosting his forthcoming book, [Advanced R](http://adv-r.had.co.nz) (Springer), on [GitHub](https://github.com/hadley/adv-r), and more recently he updated his [Github account](https://github.com/hadley/r-pkgs) with a new title, [Building R packages](http://r-pkgs.had.co.nz).

{{< tweet 497735400098918400 >}}

## Gitbook

Enter [Gitbook](https://www.gitbook.io), which offers a fast and elegant way to publish version-controlled ebooks online or as PDF/ePUB. Editing is done with the lightweight Markdown markup language. There is a dedicated [editor for the Desktop](https://www.gitbook.io/#write) and a pretty [Documentation Center](http://help.gitbook.io), which is itself a Gitbook, with associated [Github source repository](https://github.com/GitbookIO/gitbook).

On GitHub, we can find a [Gitbook port](https://github.com/TheThirdOne/llvm-tutorial-gitbook) of part of the [LLVM Tutorial](http://llvm.org/docs/tutorial/LangImpl1.html). The [Pro Git book](http://git-scm.com/book) was edited using Gitbook, with translation in 10 languages (see [code source](https://github.com/progit/progit)).

Interestingly, there is now an R package that allows to use inline bibliographic citations (with the [knitcitations](http://cran.r-project.org/web/packages/knitcitations/index.html) package) and the R Markdown language ([knitr](http://yihui.name/knitr/)): [Gitbook with R Markdown](http://jason.bryer.org/Rgitbook/).[^1] I should say that I came across this project some months ago (apparently, in April, if I refer to my Twitter feed, see below) but I hadn't time to look at it seriously.

```
% grep gitbook *bag-of-tweets*
2014-04-30-bag-of-tweets-040.md:* jbryer: Some updates to Rgitbook #Rstats package adding support for knitcitations and other fixes for the update to gitbook. <http://t.co/wuHnoo61nq> (24 Apr)
2014-04-30-bag-of-tweets-040.md:* jbryer: New Rgitbook #Rstats package
available <http://t.co/xLZw5fYgwr> @GitBookIO (22 Apr)
```



[^1]: For what is worth, the current master branch will not work on OS X with the latest node.js/npm programs. This is because in `checkForGitbook.R` there is an instruction that reads `if(system('npm', ignore.stdout=TRUE) != 0)`, which clearly doesn't work with node.js > 0.10 (`system()` will return 1 in this case). Several patches were proposed but none have been integrated in Jason Bryer's branch. So, I installed `renkun-ken/Rgitbook` version, which [fixed the issue](http://git.io/1zLC0A).
