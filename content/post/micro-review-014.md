---
title: "July in review"
date: 2020-07-14T11:38:46+02:00
draft: false
tags: ["readings"]
categories: ["2020"]
---

These days, most of my web excursions come from my RSS reader, random browsing and Hacker News. I no longer see any value in Twitter feeds and I'll probably simply stop using the Twitter app on my iPhone at some point. Anyway, here are a few links I found interesting lately.

- The LSP package and its satelite packages for Emacs provides an all-in-one solution for everything related to Python, Typescript, web dev and C/C++. This generally include linter, formatter, code completion and navigation, and peak functionalities when available. Regarding Python specifically, I don't think I miss any feature from VS Code. In any case, editing Python script is one thing, writing Python packages or longer programs is another. Hopefully, Claudio Jolowicz wrote a useful [series of posts](https://cjolowicz.github.io/posts/hypermodern-python-01-setup/) on how to devise a modern setup for writing Python code efficiently, which basically make use of [pyenv](https://github.com/pyenv/pyenv) and [poetry](https://python-poetry.org/) to manage Python version and virtual environments. I tried `pyenv` a while ago, and more recently `poetry`. I think I should give them another try even I prefer using built-in tools like `venv` or `unittest` (or `doctest`), and the Homebrew version of Python 3.

  ![poetry](/img/2020-07-14-20-00-19.png)

- [The web is obese](https://alistapart.com/article/webwaste/).

  > The causes of webpage bloat? Images and videos are mainly to blame. By 2022, it’s estimated that online videos will make up more than 82% of all consumer Internet traffic—15 times more than in 2017. However, from the code to the content, everything about Web design has become super-bloated and super-polluting.

  I already linked to this blog post on the [Micro](/micro/2020-07-09-17-43-04/) section some days ago, but I can't stop thinking about it. However, I'm not so much concerned with "pollution" than I am with identifying good content and finding interesting sites I visited once in a while. Because the web has become such a large industry, it's getting harder and harder to find your way around this pile of broken bonds.

- [A machine for peaceful computing](https://andregarzia.com/2020/07/a-machine-for-peaceful-computing.html). The only solution I found is to work on remote machines using my own computer: this way I benefit from a clean environment but I can switch to any Ubuntu servres available in my lab where I can install and run all the heavy stuff I don't necessarily want to cope with on my local laptop.

> Moreover, just as Twitter is the social network of choice within the tech ecosystem, the vast majority of Silicon Valley companies host their email with Google and use Google’s productivity software, or one of the myriad of offerings seeking to usurp documents or spreadsheets or presentations. And even when it comes to the cloud, the choice for startups is usually between AWS and Google Cloud Platform. Microsoft is out-of-sight and out-of-mind. --- [The Slack Social Network](https://stratechery.com/2020/the-slack-social-network/)

- [What if? Revision control systems did not have merge](https://nibblestew.blogspot.com/2020/07/what-if-revision-control-systems-did.html). An interesting discussion of Git merge feature and the typology of commits (logical changes and individual commits that make up the logical change).

- [Parallel computing with Racket on Chez Scheme](http://fmnt.info/blog/20200706_pmap-racket.html). I'm still on Racket 7.5, the "classic" version (i.e. not based on Chez Scheme). I was puzzled by this post, and I just thought I should give CS Racket a try when I'll be back to Scheme experimentation.

{{% music %}}Patti Smith • _Easter_{{% /music %}}
