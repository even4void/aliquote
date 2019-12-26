---
title: "Some useful Mac apps for data scientists"
date: 2014-11-02T10:44:12+01:00
draft: false
tags: ["apple", "app"]
categories: ["2014"]
---

Here are some Mac Apps that I found using more and more often.

Although I'm still keeping a [text-based workflow](/post/my-setup), where I spend most of the days using Emacs and a terminal, I recently installed or reinstalled some nice Apps when I got my new Macbook Pro in July. These are mostly small packages that do one thing well and allows text-based approaches for many of them, as in [Unix philosophy](http://www.faqs.org/docs/artu/ch01s06.html).

- [clarify](http://www.clarify-it.com): I prepared a very basic [tutorial on RStudio](http://www.aliquote.org/articles/tech/RStudio.pdf) with it (this is still work in progress at the time of this writing), shortly after I came across this software on [Brett Perpstra](http://brettterpstra.com/2014/08/11/clarify-for-markdown-blogging/)'s weblog. Basically, it is a way to organize and annotate screenshots using a simple UI.

  ![clarify](/img/2014-11-02-18-55-31.png)

- [Wizard](http://www.wizardmac.com): I reviewed this statistical package [some time ago](/post/user-friendly-statistical-packages), and although I felt like it has a good design it wouldn't of much help for my daily work. I was wrong since I now purchased the latest version on the App Store and used it extensively in parallel with R or Stata to process and clean messy databases. I really recommend this software to perform basic exploratory data analysis or to assess data quality. It is pretty fast to display univariate distribution, apply filters and build pivot Tables. It supports many data formats, including proprietary ones like MS Excel/Apple Numbers, SPSS, Stata, or SAS (see [this repository](https://github.com/WizardMac/ReadStat) on GitHub). Although it is just a point-and-click software, it is definitively worth a try (and if you have R or StatTransfer, no need to buy the Pro version).

  ![wizard](/img/2014-11-02-19-05-50.png)

- [Dash](http://kapeli.com/dash): I installed it as soon as I got my new Macbook, and even if I'm not using it as probably a programmer does I find it very useful to replace man pages and Google. Here is what I currently have in my navigation toolbar:

- [Deckset](http://www.decksetapp.com): I already talked about this new App, and I found myself using it two times to prepare some slideshow in recent months. The latest version features MathJax equations, custom footer, and footnotes. The themes are gorgeous, of course, but what is really worth a feature is the possibility to use it as a 'slide sorter' while writing in your favorite text editor (this is its best definition, IMHO). But see my [recent review](/post/from-beamer-to-deckset).

- [PDF to Word +](http://www.lightenpdf.com/pdf-to-word-converter-mac.html): This is a small App (with a small price too) that I found useful to convert a whole LaTeX document (converted to PDF) to a Word version for proof-reading by some of my co-authors. Although the final page layout is sometimes not so satisfactory, all text and Tables get properly rendered. For PDF to text conversion, I have used [pdftotext](http://en.wikipedia.org/wiki/Pdftotext) in the past, but it is not really useful when it comes to extract data from Tables with complex layout. (There may be [other options](http://askubuntu.com/q/52040) that I haven't tried yet.)

  ![pdftoword](/img/2014-11-02-19-38-44.png)

- [GraphSketcher](https://github.com/graphsketcher/GraphSketcher): It is a lightweight and certainly less powerful application than [DataGraph](http://www.visualdatatools.com/DataGraph/) (see this [review in the JSS](http://www.jstatsoft.org/v47/s02/)), but it allows to quickly generate basic graphical displays. We just have to copy/paste (from a Spreadsheet or through `pbpaste`) a series of data points and voilà! Here is a simple illustration with a basic scatterplot created when I pasted some data generated using R:

  ```
  $ Rscript -e 'write(rnorm(1e3), file = "", ncolumns = 2, sep = "\\t")' | sed "s/\./,/g" | pbcopy
  ```

  ![graphsketcher](/img/2014-11-02-19-34-04.png)
