---
title: "Tech Review / June 2018"
date: 2018-06-22T6:40:51+02:00
draft: false
tags: ["readings", "review"]
categories: ["2018"]
---

The monthly tech newsletter is finally out! This is probably just the first part and I will add more fresh news in a few days.

<!--more-->

Besides some [Essential cheat sheets for machine learning and deep learning engineers](https://www.sodavision.com/essential-cheat-sheets-for-machine-learning-and-deep-learning-engineers/), the second part of the very [visual introduction to Machine Learning](http://www.r2d3.us/visual-intro-to-machine-learning-part-2/) was released a few days ago. Check it out! In the same spirit, but without interactive display, there is <http://explained.ai>, maintained by Terence Parr who is currently working on [The Mechanics of Machine Learning](https://mlbook.explained.ai). With the advances of JS backend for [Tensorflow](https://js.tensorflow.org) and [ML](https://ml5js.org), I anticipate more online interactive tutorials coming soon.

Two new books on my viewfinder: Bernhard Schölkopf is probably well known for his many books on SVM and [kernel methods](http://agbs.kyb.tuebingen.mpg.de/lwk/), and there is now an open-access MIT book on causality: [Elements of Causal Inference, Foundations and Learning Algorithms](https://mitpress.mit.edu/books/elements-causal-inference); [Introduction to Theoretical Computer Science](http://introtcs.org/public/index.html), by Boaz Barak.

If you are looking for some datasets, here are the (supposed) "[50 Best Free Datasets for Machine Learning](https://gengo.ai/articles/the-50-best-free-datasets-for-machine-learning/)", although I remain circumspect as to the following assertions: a dataset shouldn’t be messy, because you don’t want to spend a lot of time cleaning data; a dataset shouldn’t have too many rows or columns, so it’s easy to work with. Aren't we spending almost 80% of our time cleaning data in the real life? So, why not start with a very dirty dataset and apply data cleansing techniques and feature engineering like a big boss?

{{< x user="TilingBot" id="1009254759075807237" >}}

[LISP: back to the future (a tribute to 60th anniversary)](https:/i/sigma.software/about/media/lisp-back-future-tribute-60th-anniversary). Because why not?

I learned about [Fathom](https://usefathom.com) and [Caddy](https://caddyserver.com) on Jack Baty's blog. Currently, I am using Matomo to monitor the stats of this website. Like Jack Baty, I don't really care about engagement and related analytics and I know that there are mostly "volatile" visitors on aliquote.org. Still, I find it interesting to know where people spend their free time, whether on this blog or on static pages. Most of the traffic has always been directed to my teaching materials

Recently I tried to update my TeX packages. I first learned that there was a French translation ready to install and then I ended up with a blank list in the TeX Live Utility app. Yes, I know, this is 2018 and it is probably time to update my Texlive distribution. One funny side note from the [MacTeX](https://www.tug.org/mactex/newfeatures.html) website is about the removal of the Preference pane. Just quoting, emphasis is mine:

> Previously, MacTeX installed a preference pane for Apple's System Preferences allowing users to select the active TeX distribution. Unfortunately, this Preference Pane was a plugin for System Preferences, and when Apple changed System Preferences, the Preference Pane needed to be recoded. **Apple often made changes.**

Anyway, one of the updates worth mentioning is the fact that LaTeX now considers UTF-8 as the default encoding, so there is no need to add `\usepackage[utf8]{inputenc}` in new files. Regarding Apple, yes they often change their mind and remove useful stuff (for the end user I mean) or protocols broadly speaking (USB3, Firewire port, ftp and telnet programs, Safari RSS reader, etc.). I remain, however, happy with my Macbook running High Sierra (OS X 10.13.5). Nothing bad happened in between the different updates and I think it has been my best productive environment since I hold a Mac (back in 2006)--for what "productive" can well mean when one has spent 8 weeks in hospital and not touched a computer for several months. I learned that there are some very good Apple native products (Mail App, Pages & Numbers, Safari are quite well optimized for the system, don't look elsewhere) and others for which good alternatives do exist, e.g. [Forklift](https://binarynights.com) has so many features built in that it just reminds us that Finder hasn't been updated in a while.

It's been a while since I was writing Awk and Sed scripts every two or three days to inspect and reshape data files or any sort of STDOUT. Hence, I was happy to find this [little intro on Awk](https://gregable.com/2010/09/why-you-should-know-just-little-awk.html) pop up in my Twitter timeline. On a related note, while I find myself comfortable with using Emacs all day long, I'm always fascinated by [those who build their work environment around](http://doc.rix.si/cce/cce.html).

> I honestly don’t know if Racket and Haskell are worth their costs in complexity. At the end of the day, maybe what really matters is writing simple, consistent things that other people can understand. --- Alexis King on [lexi-lambda](https://lexi-lambda.github.io/blog/2016/08/11/climbing-the-infinite-ladder-of-abstraction/)

MXNet is incubating as an Apache project and is yet another library for deep learning. Carin Meier is currently working on a [Clojure package](https://github.com/gigasquid/clojure-mxnet). See her [recent blog post](http://gigasquid.github.io/blog/2018/06/03/meet-clojure-mxnet-ndarray/) to learn more.

{{% music %}}The Veils • _The Runaway Found_{{% /music %}}
