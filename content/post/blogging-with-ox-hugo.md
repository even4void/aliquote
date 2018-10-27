---
title: "Org-mode and blogging"
date: 2018-10-27T18:42:04+02:00
lastmod: 2018-10-27T18:42:04+02:00
draft: true
description: ""
tags: ["emacs"]
categories: []
---

One can find many posts on that specific topic, blogging with Emacs and org-mode, but here I just wanted to highlight how ox-hugo makes it so simple that you only need to have a single file to manage all your posts.

<!--more-->

Here is what my Org file looks like:

```{org}
#+STARTUP: content
#+HUGO_BASE_DIR: ~/Sites/aliquote/
#+HUGO_SECTION: micro
#+HUGO_AUTO_SET_LASTMOD: nil
#+HUGO_FRONT_MATTER_FORMAT: yaml
#+HUGO_CUSTOM_FRONT_MATTER: type "tweet"
#+AUTHOR:

* Micro                                                  

** DONE Writing Hugo blog in Org
   CLOSED: [2018-10-27 Sat 18:24]
:PROPERTIES:
:EXPORT_FILE_NAME: writing-hugo-blog-in-org-subtree-export
:END:
If this post appears on the micro section, then my configuration for =ox-hugo= should be ok. =#emacs=

** TODO Blogging with org-mode and ox-hugo
:PROPERTIES:
:EXPORT_FILE_NAME: blogging-with-org-mode-and-ox-hugo
:END:
Yet another alternative to mangaging Hugo posts via Org: [[https://www.shanesveller.com/blog/2018/02/13/blogging-with-org-mode-and-ox-hugo/][Blogging with org-mode and ox-hugo]]. =#emacs=
```
