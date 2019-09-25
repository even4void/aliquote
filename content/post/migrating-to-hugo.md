---
title: "Migrating to Hugo"
date: 2018-01-22T11:40:59+01:00
draft: false
tags: ["this"]
categories: ["2018"]
---

Last day, I decided to embrace modern web technologies by switching to Hugo in order to manage my website in a more elegant manner. Up to now, I have been using a mix of Markdown and HTML files with custom CSS and site structure.

This was also a good opportunity to revise some content and check internal links. Indeed, since Dropbox removed their support for sharing live link in our Public folder, I was left with tons of broken image links (in fact, all of them). Moreover, a lot of draft posts were still living in my post box and never get published, even in draft mode. Finally, some old post were still written in Textile and needed to be updated to Markdown.

Anyway, it was a funny experience to edit very old posts and re-read old setups, like a [Macbook Air](/post/welcome-to-the-macbook-air), [OS X Lion](/post/my-setup), a [Macbook Pro](/post/os-x-yosemite), or more recently [High Sierra](/post/setup-2018)

It took me some weeks of irregular work to get the updated website working again. I had to download and unfill pictures and images from my "Public" Dropbox which became useless (like Dropbox I would like to say). A dozens of posts needed to be converted from Textile to Markdown, or YAML header from old Markdown posts had to be cleaned up a bit.

I started to customize the default Academic theme using partials and layouts. It is worth noting that all I need to fully grasp the subtlety of Hugo was to "read the doc". I mean, no need to consult various blogs to understand how it really works, like in [this tutorial](http://www.mit.edu/~k2smith/post/getting-started/).

I keep writing in Markdown format although apparently Emacs users can benefit from [org-mode](https://github.com/chaseadamsio/goorgeous). The default settings for the Academic theme are quite satisfactory, except for the CSS template that I need to update at some point. I just added a page variable about last modification date, which can be set manually or through a general configuration option (`enableGitInfo = true`). [Highlight.js](https://highlightjs.org) support most of the computing language I use, including various Lisp flavors (Clojure, Clojure REPL, Lisp, Scheme), Mathematica, R, but not Stata.

The immediate benefits from this new setup are multiple: (1) I can now revise my posts on my local machine and synchronize the changes when needed, (2) I have a revision history thanks to Git, (3) I can use whatever nifty tools I want from Emacs, e.g., [Helm-bibtex](https://github.com/tmalsburg/helm-bibtex) to add bibliographic entries on the fly or [Deft](https://github.com/jrblevin/deft) to manage all my posts, (3) I can update the CSS or layout as I wish and see immediate changes in my browser. And it is just blazing fast...

```
% hugo
                   | EN
+------------------|-----+
  Pages            | 168
  Paginator pages  |  26
  Non-page files   |   0
  Static files     | 175
  Processed images |   0
  Aliases          |  23
  Sitemaps         |   1
  Cleaned          |   0

Total in 390 ms
```

{{% music %}}Two Door Cinema Club • *Beacon*{{% /music %}}
