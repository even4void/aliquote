+++
title = "Audit trails and statistical project management"
date = 2013-03-01T09:51:34+01:00
draft = false

tags = ["statistics", "rstats"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

In the context of a statistical project, "sanity checking" refers to the verification of raw data: whether they make sense, if there are any coding errors that are apparent from the range of data values, or if some data should be recoded or set as missing (Baum, CF, *An introduction to Stata programming*, Stata Press, 2009, p. 79).[^1]

This should be recorded in an [audit trail](http://en.wikipedia.org/wiki/Audit_trail). For a general overview in the IT domain, see Rajeev Gopalakrishna's [tutorial](http://homes.cerias.purdue.edu/~rgk/at.html). In short, any alteration of the raw data should be recorded in order to make data steps fully reproducible. Reproducible research has gained some popularity in recent years and is becoming part of minimum standards in the scientific literature, including the [Bioconductor project](http://biostats.bepress.com/bioconductor/paper2/) or [Biostatistics journal](http://biostatistics.oxfordjournals.org/content/10/3/405.full), or social science, e.g.:
Akkerman, S., Admiraal, W., Brekelmans, M., and Oost, H. (2008). [Auditing Quality of Research in Social Sciences](http://bit.ly/YvjVVj). *Quality & Quantity*, 42(2), 257-274.

About the R statistical software specifically, there is a dedicated [Task View](http://cran.r-project.org/web/views/ReproducibleResearch.html). We know that [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [knitr](http://yihui.name/knitr/), and many other reporting packages greatly simplify our lifes as statisticians: we can document our R code and provide our customers or colleagues with a reproducible data workflow. The same process is available for Python with the use of [notebooks](http://ipython.org/ipython-doc/dev/interactive/htmlnotebook.html). That is probably one very first step to keep track of changes and database management. It is really important to keep in mind that for auditing data alteration/recoding we need to capture any changes or data transformations. It seems there are some solutions [for SAS](http://bit.ly/13hbZwn), but see this NESUG paper: <i class="fa fa-file-pdf-o fa-1x"></i> [Audit Trails of SAS Data Set Changes An Overview](http://www.nesug.org/proceedings/nesug03/ph/ph006.pdf).

Of course, this has to do with FDA sponsored [21 CFR 11](http://www.21cfrpart11.com) compliance issues, which have been discussed in past UseR conference; see [Use of R in Clinical Trials and Industry-Sponsored Medical Research](http://bit.ly/13eiLmQ) or [R, the FDA, and clinical trials](http://bit.ly/ZxOXMU) on Revolutions blog, but especially these two sets of slides where the benefits of using R in clinical trials are discussed at length:[^2]

- Harrell, FE Jr, [R for Clinical Trial Reporting: Reproducible Research, Quality and Validation](http://bit.ly/Y3xb40), UseR 2007.
- Harrell, FE Jr, [Reproducible Research](http://bit.ly/YFlamI), 2011.

It appears that the reference remains <i class="fa fa-file-pdf-o fa-1x"></i> [R: Regulatory Compliance and Validation Issues](http://www.r-project.org/doc/R-FDA.pdf), where it is said that (§7.5):

> R is not intended to create, maintain, modify or delete Part 11 relevant records but to perform calculations and draw graphics. Where R’s use may be interpreted as creating records, however, R can support audit trail creation within the record.

Yes, there are many logging facilities under R, starting with simple log file using R base `sink()` function to more elaborated session management based on `log4r` or `futile.logger` packages (inspired by [log4j](http://logging.apache.org/log4j/1.2/)). If you happen to use Emacs + [ESS](http://ess.r-project.org), you probably know the `transcript-mode` (save a session as an `.{R|S}t` file and you get a live history file), see
Rossini et al. (2004). <i class="fa fa-file-pdf-o fa-1x"></i> [Emacs Speaks Statistics (ESS): A multi-platform, multi-package intelligent environment for statistical analysis](http://stat.ethz.ch/ESS/downloads/ess/doc/ess-intro.pdf). *Journal of Computational and Graphical Statistics*, 13(1), 247-261.

(See also, Rossini et al. (2001). [Emacs Speaks Statistics: A Universal Interface for Statistical Analysis](http://biostats.bepress.com/uwbiostat/paper173/), *UW Biostatistics Working Paper Series*. Working Paper 173; or Rossini, AJ (2001). [Literate Statistical Practice](http://bit.ly/15g3WOM). *DSC 2001 Proceedings of the 2nd International Workshop on Distributed Statistical Computing*, March 15-17, Vienna, Austria; [Statistical Reporting, Linking S Output with Report Documents, Literate Programming, Managing Analyses, and Documenting Programs and Data](http://bit.ly/X8tgEH).)

The take-away message is of course that we should [avoid using point-and-click method in statistical software packages](http://fmwww.bc.edu/GStat/docs/pointclick.html). In fact, some statistical packages like Systat or Stata will consider that syncing point-and-click and command line (which, I believe, is great for beginners because they can learn to use the command line starting from purely menu-driven actions) already provide a [complete audit trail](http://www.stata.com/capabilities/overview/data-editor/). I did not necessarily agree when I first read that, although now I realized that even manual updates in the data editor are echoed as Stata commands, contrary to SPSS or other packages.

R also offers facilities for package developement (and we can imagine that a statistical project might fall under this term if everything is organized in a package) and regression testing, with <i class="fa fa-file-pdf-o fa-1x"></i> [testthat](http://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf), for instance. Likewise, with Stata we have an `assert` command which can be used to validate raw data (e.g., `assert gender == 1 | gender == 2`) or variable transformations.

However, I just found another R package which looks really interesting: The [`trackObjs`](http://rwiki.sciviews.org/doku.php?id=packages:cran:trackobjs) package, now `track` on CRAN, by Tony Plate (who also authored the `scriptests` package,

> automatically stores objects in files on disk so that files are rewritten when objects are changed, and so that objects are accessible but do not occupy memory until they are accessed. Keeps track of times when objects are created and modified, andcaches some basic characteristics of objects to allow for fast summaries of objects. Also provides a command history mechanism that saves the last command to a history file after each command completes.

In short, it allows to record the state of an object, say a working data frame, and monitor changes or addition to the original data. These changes are stored on a local folder

```r
library(track)
unlink("tmp.0", recursive=TRUE)
library(foreign)
weights <- read.spss("data/weights.sav", to.data.frame=TRUE)
track.start("tmp.0")
## Tracking <env R_GlobalEnv> (writable) using new directory 'tmp.0'
track.summary(weights)
##              class mode    extent length  size            modified TA TW
## weights data.frame list [[550x7]]      7 57304 2013-02-28 09:21:40  0  1
names(weights)
## [1] "ID"       "WEIGHT"   "LENGTH"   "HEADC"    "GENDER"   "EDUCATIO" "PARITY"  
(names(weights) <- tolower(names(weights)))
## [1] "id"       "weight"   "length"   "headc"    "gender"   "educatio" "parity"  
track.summary(weights)
##              class mode    extent length  size            modified TA TW
## weights data.frame list [[550x7]]      7 57304 2013-02-28 09:23:17  4  3
table(weights$parity)
## 
##          Singleton        One sibling         2 siblings 3 or more siblings 
##                180                192                116                 62 
levels(weights$parity)[3:4] <- "2 siblings or more"
track.summary(weights)
##              class mode    extent length  size            modified TA TW
## weights data.frame list [[550x7]]      7 57248 2013-02-28 09:26:06  7  5
weights$new <- weights$weight/weights$length
track.summary(weights)
##              class mode    extent length  size            modified TA TW
## weights data.frame list [[550x8]]      8 61736 2013-02-28 09:27:28 13  7
track.stop()
```

If we look at local directory, we have

```
% ls tmp.0
_1.rda      _2.rda      _3.rda      _4.rda      filemap.txt weights.rda
```

and now back in R,

```r
ls()
## character(0)
load("tmp.0/weights.rda")
dim(weights)
## [1] 550   8
```

which means that our changes were recorded and saved on disk. There are many more options, like automatic recording of R history or synchronization of database during an R session. This approach is a bit like other file-hashing packages (e.g., <i class="fa fa-file-pdf-o fa-1x"></i> [SOAR](http://cran.r-project.org/web/packages/SOAR/vignettes/SOAR.pdf), `filehash`), however I find this package really convenient and easy to use. At the end of a session, you have a finalized database, with all track changes recorded on disk with time-stamps and intermediate results.

## Notes

[^1]: See also, from the same author: (1) <i class="fa fa-file-pdf-o fa-1x"></i> [Why should you become a Stata programmer?](http://fmwww.bc.edu/GStat/docs/StataProg.pdf), (2) <i class="fa fa-file-pdf-o fa-1x"></i> [Using Stata for data management and reproducible research](http://sites.uom.ac.mu/wtochair/attachments/article/3/MRUS1_BC29.slides.pdf).

[^2]: There is the `rreport` package, which was never released to CRAN but still contains useful stuff and compile fine with R 2.15.*, although there is no real documentation. The sample documents on the [website](http://biostat.mc.vanderbilt.edu/wiki/Main/Rreport) look really amazing, so it may be worth looking at the code more carefully.

