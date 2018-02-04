+++
title = "Tech Review"
date = 2017-12-31T10:34:32+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["readings", "review"]
categories = ["tech-review"]

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

Here are some interesting links I keep opened in my web browser for a while in December.

<i class="fa fa-external-link fa-1x"></i>  [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)  
This is a well-known article regarding the annotation of your current work or contribution in a version control system. As I tend to work mostly alone, I don't have a strong need for Git except that it helps me to keep a trace of my workflow and it is quite useful to archive different version or deliverable of my work. I guess I could simply rely on a separate Changelog file, which are so easy to manage under Emacs (`C-x 4 a`). So, how to write a great commit message? Here are the seven rules that re discussed at length in this article: 
    
1. Separate subject from body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters
7. Use the body to explain what and why vs. how

I believe the most important points are 1, 5 and 7. The remaining points are really formatting issues and probably relevant only for command-line users.

<i class="fa fa-external-link fa-1x"></i> [Exploring a Data Set in SQL](http://tapoueh.org/blog/2017/06/exploring-a-data-set-in-sql/)  
I found this article while looking for a database to illustrate [R's capabilities](http://db.rstudio.com/dplyr/) when working with remote or local database systems. Incidentally, I read one of the author's blog post few days ago, when he released his [book on PostgreSQL](http://tapoueh.org/blog/2017/12/mastering-postgresql-a-readers-interview/). I always felt that I should spend more time investigating PostgreSQL and try to carry out basic statistical data munging using SQL from [psql](https://www.postgresql.org/docs/current/static/app-psql.html) directly. The [dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/dplyr.html) package is interesting because it let the SQL system manage the operation whenever possible, and we just get back or "collect" the results as data tibble in R. However, I guess a more universal approach (i.e., independant of the statistical package) whould be to process data and output aggregated data using SQL only.

<i class="fa fa-external-link fa-1x"></i> [Introduction à R et au tidyverse](https://juba.github.io/tidyverse/)  
This is a French book(down) about the [tidyverse](https://www.tidyverse.org) ecosystem which seems to become the all-in-one approach to data processing in R these days--and I know this yielded very hot debate on Stack Overflow. Personally, I still use the not so old-fashioned base R, with some nifty additions from [data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html). Anyway, as someone who unfortunately had to spend a fair amount of time away from his computer, I appreciate that people write dedicated tutorial on the "tidyverse" so that I can educate myself quickly. Yet, this is still work in progress and I will probably have to check back later. The Datacamp team also offers an [introductory course to the "tidyverse"](https://www.datacamp.com/courses/introduction-to-the-tidyverse) by the way. And, finally, here is an [overview of tidy tools](https://peerj.com/preprints/3180/), pushed by [Zev Ross](https://www.zevross.com) and co-authors on PeerJ Preprints.

<i class="fa fa-external-link fa-1x"></i> [anthonyohare/SwiftScientificLibrary](https://github.com/anthonyohare/SwiftScientificLibrary)  
This looks like a handy library for numerical computing using the Swift language. Yet another port of the [GNU Scientific Library](https://www.gnu.org/software/gsl/) for a general language (e.g., C, Common Lisp, Scheme, Python), although one can generally find some good native counterpart. In fact, I decided to spend more time from now on using Swift, Python, Clojure & Scheme, and Mathematica. I plan to write some teaching material on those languages for data mining in the next months. I don't know how far I can go with each language, but time will tell.

<i class="fa fa-external-link fa-1x"></i> [arunsrinivasan/user2017-data.table-tutorial](https://github.com/arunsrinivasan/user2017-data.table-tutorial)  
A nicely illustrated keynote and several practicals on using R [data.table](http://r-datatable.com) with a strong emphasis on subset/select/group by operations on data tables. This is actually my preferred approach to data processing in R with moderate to large data files because it remains truly compatible with existing methods working on data frames exclusively and I never had to learn a lot new functions or change my own workflow, like is often the case with the "tidyverse" way of doing this or this, IMO.

<i class="fa fa-external-link fa-1x"></i> [Computational Linear Algebra for Coders](https://github.com/fastai/numerical-linear-algebra/blob/master/README.md)  
These are some lecture notes (with videos available on Youtube) on efficient matrix computations using Python. This covers a wide range of applications, including non-negative matrix factorization and stochastic gradient descent, robust PCA, lasso and ridge regression, Cholesky factorization, and many more. See also the blog annoucement here: [New fast.ai course: Computational Linear Algebra](http://www.fast.ai/2017/07/17/num-lin-alg/).

<i class="fa fa-external-link fa-1x"></i> [Python Itertools Recipes](https://docs.python.org/3/library/itertools.html#itertools-recipes)  
For those who seek a functional approach to dealing with [iterator building blocks](https://docs.python.org/3/library/itertools.html#module-itertools) in Python.

<i class="fa fa-external-link fa-1x"></i> [Programming, meh… Let’s Teach How to Write Computational Essays Instead](https://blog.ouseful.info/2017/11/15/programming-meh-lets-teach-how-to-write-computational-essays-instead/amp/)  
A followup post on Wolfram's latest article on [writing computational essay](http://blog.stephenwolfram.com/2017/11/what-is-a-computational-essay/), with emphasis on Jupyter notebooks for literate programming.

> A computational essay is in effect an intellectual story told through a collaboration between a human author and a computer. …  
> The ordinary text gives context and motivation. The computer input gives a precise specification of what’s being talked about. And then the computer output delivers facts and results, often in graphical form. It’s a powerful form of exposition that combines computational thinking on the part of the human author with computational knowledge and computational processing from the computer.

<i class="fa fa-external-link fa-1x"></i> [Articulate Common Lisp](http://articulate-lisp.com)  
A new website for getting started with Common Lisp. At the time of this writing, it merely consists of a series of links to external resources and some snippets of Lisp code to perform common tasks. I hope this will evolve toward more opiniated discussion around Lisp and, hopefully, numerical computing.

<i class="fa fa-external-link fa-1x"></i> [Introduction to Data Science](https://rafalab.github.io/dsbook/)  
Yet another book(down) on R for Data Science, a course originally taught on [HarvardX](https://www.edx.org/course/data-science-r-basics-harvardx-ph125-1x), by Rafael Irizarry who already published a [book on Leanpub](https://leanpub.com/dataanalysisforthelifesciences).

<i class="fa fa-external-link fa-1x"></i> [IBM Plex](https://ibm.github.io/type/)  
A nice looking OTF font, for desktop and web, which comes in Mono, Sans and Serif version.

![The IBM Plex font](/img/2018-01-02-18-56-46.png)

<i class="fa fa-external-link fa-1x"></i> [Learning probabilistic programming](http://www.robots.ox.ac.uk/~fwood/anglican/teaching/mlss2014/)  
I found this series of exercices while looking for probabilistic programming on Google. This is base on the [Anglican](https://probprog.github.io/anglican/index.html) package, which in turn relies on Clojure. It didn't explore it much at the moment but I hope to do so in the near future.

<i class="fa fa-external-link fa-1x"></i> [Natural Language Understanding](https://web.stanford.edu/class/cs224u/index.html)  
A Stanford course on NLP and language understanding, featuring topics like: sentiment analysis, relation extraction, language semantics and representations, language parsing, or pragmatic agents. Material is available as Jupyter notebooks, and the authors make extensive use of [NLTK](http://www.nltk.org) and [scikit-learn](http://scikit-learn.org/stable/).

<i class="fa fa-external-link fa-1x"></i> [One LEGO at a time: Explaining the Math of How Neural Networks Learn](https://omar-florez.github.io/scratch_mlp/?utm_campaign=buffer&utm_content=buffer0d54b&utm_medium=social&utm_source=linkedin.com)  
I really love visual explanation and this article offers a nice discussion of backpropagation in neural networks, which as everyone probably knows have become popular again. More than static pictures, the article also includes dynamic visualization--much like on <https://distill.pub>, and Python code is available on GitHub.

<i class="fa fa-external-link fa-1x"></i> [apple/turicreate](https://github.com/apple/turicreate)  
Some time ago, I followed an [ML course](https://www.coursera.org/account/accomplishments/specialization/certificate/XQ5YDA5JFUKD) on Coursera, which was really great even if it has been interrupted before the 5th course and final project. It was run by Emily Fox and Carlos Guestrin, from the University of Washington. They used Python and GraphLab to handle large datasets that were used to illustrate collaborative filtering or gradient descent algorithms. It looks like Turi Create also relies on GraphLab, and it aims at making easy to fit complex ML models and expose them to Core ML, making them available through iOS devices. More information on Core ML applications can be found on the following website: [Quantum Tunnel Website](http://jrogel.com/machine-learning-apple/).


**Interesting websites**: [Michael Betancourt](https://betanalpha.github.io) • [Robert Grant](http://robertgrantstats.co.uk) • [Audiograph](http://audiograph.xyz)
