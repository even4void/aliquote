+++
title = "Leanpub: a new way to publish your textbook"
date = 2015-04-30T23:05:41+01:00
draft = false
tags = ["misc"]
categories = ["2015"]
+++

[Leanpub](https://leanpub.com) appears to be a great way to share or sell in-progress or final version of a textbook.

<!--more-->

The principle is quite simple: You write a book using Markdown, which you can store on Dropbox or GitHub, and it get formatted as PDF/EPUB on Leanpub website; you then propose a minimal price, and get your money each month via PayPal. Of course, you can offer your book for free. Regarding royalties, here is what we find on the [FAQ](https://leanpub.com/help/author_faq):

> We pay a royalty of 90%, minus 50 cents, on your paid purchases. Royalties are paid at the beginning of each month via PayPal, once a minimum amount of $40 is reached. Our 10% covers all the PayPal fees, both on the sale of the book, and on the payment of royalties to you.

Interestingly, Leanpub relies on a superset of Markdown: [Markua](http://markua.com). [Markua Specification](https://leanpub.com/markua) can be read online, and other information on the editing/publishing process can be found in [Leanpub manual](https://leanpub.com/help/manual). At the time of this writing, I was not able to find any implementation that could replace Markdown or [MultiMarkdown](http://fletcherpenney.net/multimarkdown/).

Some folks from the Johns Hopkins University are currently Leanpub to publish very nice textbooks on the use of R for data science, inspired by their nice tutorial from the corresponding [Coursera specialization](https://www.coursera.org/specialization/jhudatascience/1). Here are the gems: [The Elements of Data Analytic Style](https://leanpub.com/datastyle), [Statistical inference for data science](https://leanpub.com/LittleInferenceBook), [R Programming for Data Science](https://leanpub.com/rprogramming), and [Exploratory Data Analysis with R](https://leanpub.com/exdata) (in progress). The book on R programming is really a great one.

As someone who spend a great part of his time writing tutorials, blog posts, or statistical report, a [text-based workflow]({{< ref "/post/my-setup.md" >}}) is essential to me, and Markdown soon became my markup language of choice. I generally write text in Emacs and preview Markdown output using [Marked 2](http://marked2app.com) which is one of those wonderful applications that you don't want to miss if you are working on a Mac. If I want more fancy outputs (i.e., other than PDF/HTML), I can use [Pandoc](http://pandoc.org), of course, but Marked.app already offers Pandoc integration (see also [Plain Text, Papers, Pandoc](http://kieranhealy.org/blog/archives/2014/01/23/plain-text/)). I wonder why the Python community keep using [rst](http://docutils.sourceforge.net/rst.html) with Sphinx.[^1] I should note that there are some great alternative to [Sphinx](http://sphinx-doc.org), e.g. [MkDocs](http://www.mkdocs.org).

On a related note, some time ago I started writing a [GitBook](https://www.gitbook.com) using the dedicated editor that was provided on the website, and even started to hack the [Rgitbook](https://leanpub.com/LittleInferenceBook) package to make it works. Now both projects seem to be dead and GitBook offers an in-browser editor, which I do not find very convenient for working off-line as is often the cases for me. I noticed that Jan de Leeuw was also offering a series of textbook on [Block relaxation algorithms in statistics](https://www.gitbook.com/@jandeleeuw), and is now only using the editor to upload his books to GitBook..

[^1]: I should note that there are great websites, like [The Hitchhiker’s Guide to Python!](http://docs.python-guide.org/en/latest/) or <https://readthedocs.org>, that are written entirely using rst.
