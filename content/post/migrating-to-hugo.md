+++
title = "Migrating to Hugo"
date = 2018-01-21T11:40:59+01:00
draft = true

tags = ["misc"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Last day, I decided to embrace modern web technologies by switching to Hugo in order to manage my website in a more elegant manner. Up to now, I have been using a mix of Markdown and HTML files

This was also a good opportunity to revise some content and check internal links.
Anyway, it has been a funny experience to edit very old posts and re-read old setups, like a [Macbook Air]({{< ref "post/welcome-to-the-macbook-air.md" >}}), [OS X Lion]({{< ref "post/my-setup.md" >}}), a [Macbook Pro]({{< ref "/post/os-x-yosemite.md" >}}), or more recently [High Sierra]({{< ref "post/setup-2018.md" >}})

- I had to download and unfill pictures and images from my "Public" Dropbox which became useless as soon as Dropbox decided to switch to an all-sharing option
- Several posts needed to be converted from Textile to Markdown, or old Markdown posts had to be cleaned up a bit

The immediate benefits from this new setup are multiple: (1) I can now revise my posts on my local machine and synchronize the changes when needied, (2) I have a revision history thanks to Git, (3) I can use whatever nifty tools I want from Emacs, e.g., [Helm-bibtex](https://github.com/tmalsburg/helm-bibtex) to add bibliographic entries on the fly or [Deft](https://github.com/jrblevin/deft) to manage all my posts, (3) I can update the CSS or layout as I wish and see immediate changes in my browser. And it is just blazing fast...

```
% hugo

                   | EN  
+------------------|----+
  Pages            | 94  
  Paginator pages  | 13  
  Non-page files   |  0  
  Static files     | 93  
  Processed images |  0  
  Aliases          | 19  
  Sitemaps         |  1  
  Cleaned          |  0  

Total in 337 ms
```

<i class="fa fa-file-pdf-o fa-1x"></i> indicates a link pointing to a PDF file while <i class="fa fa-file-code-o fa-1x"></i> means a text file with some code

As you may expect, the symbol <i class="fa fa-chain-broken fa-1x"></i> means a broken link or lost ressources. I didn't check all links, but when I happen to find one that is broken, I simply add tag it as such.

I usually put <i class="fa fa-external-link fa-1x"></i> at the beginning of an item in a long list of ressources, as in my monthly "tech review".

[Highlight.js](https://highlightjs.org) support most of the computing language I use, including various Lisp flavours (Clojure, Clojure REPL, Lisp, Scheme), Mathematica, R, Stata
