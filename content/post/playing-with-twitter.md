+++
title = "Playing with TwitteR"
description = ""
date = 2011-06-25T12:41:24+01:00
draft = false
tags = ["rstats", "misc"]
categories = []
+++

[Some months ago]({{< ref "/post/playing-with-backupmytweets.md" >}}), I played with Un*x command-line tools to parse my tweets fetched from BackupMyTweets. Here is a more elegant to do so with R.

Well, the code is rather simple and most of what we need is already available through the [twitteR](http://cran.r-project.org/web/packages/twitteR/index.html) package.

```r
library(twitteR)
library(stringr)
my.tweets <- userTimeline("chlalanne", n=1000)
```

Suppose I want to display the frequency of tags I use in my messages:

```r
find.tag <- function(x) unlist(str_extract_all(x$getText(), "#[A-Za-z0-9]*"))

# a little test to see whether it works or not
# for (i in 1:20) cat(i, ":", find.tag(my.tweets[[i]]), "\n")
my.tags <- lapply(my.tweets, function(x) try(find.tag(x), silent=TRUE))
sort(table(unlist(my.tags)), decr=TRUE)
```

To get the number of records I have, 

```r
me <- getUser("@chlalanne")
me$statusesCount  # or statusesCount(me)
```

(It works without the `@` too.)

We can make a quick and dirty word cloud as follows:

```r
library(snippets)
wcl <- table(unlist(my.tags))
names(wcl) <- str_replace_all(names(wcl), "#", "")
cloud(wcl[wcl > 5])
```

Other random notes:

- There's also the possibility of using OAuth, see `help(registerTwitterOAuth)`, that I didn't explore much at the moment.
- The idea of using `twitteR` to update analysis status online was raised on [Stack Overflow](How to insert variables in R twitteR updates?). (Note that it uses the older R API so that commands like `initSession()` are no longer available).
- It would be even nicer to use the [tm](http://cran.r-project.org/web/packages/tm/index.html) package with public timeline or things like that.
