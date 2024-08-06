---
title: "Org-mode and blogging"
date: 2018-10-27T19:27:04+02:00
draft: false
tags: ["emacs"]
categories: ["2018"]
---

Blogging with Emacs and Org: One can find many posts on that specific topic, but here I just wanted to highlight how [ox-hugo](https://ox-hugo.scripter.co) makes it so simple that you only need to have a single file to manage all your posts.

Note that this only applies to my [micro posts](/micro). For standard posts like this one, I am still creating each new file via the command line using Hugo. This means that I will now have to write my posts using either Markdown (this post) or Org (micro posts), but that is not a big issue since I am quite comfortable with both markup language. Notice also that I published a [few](/post/notes-taking-workflow) [other](/post/migrating-to-hugo) [posts](/post/org-blogging) on how I do manage this blog, but as you may have guessed my writing workflow is subject to intermittent changes.

So for now, rather than creating new micro posts using Hugo from the command line, I just have one Org file which basically looks like the one shown in the screenshot below:

{{< figure src="/img/2018-10-27-19-05-22.png" >}}

Each post is written under a new level-2 heading, with basic `PROPERTIES` (actually, just the "slug"). The global settings are managed at the top of the file (see below), hence the fact that using a single file is much easier than one file per post, as discussed on the [ox-hugo](https://ox-hugo.scripter.co) website. Here is my basic template:

```
#+STARTUP: content
#+HUGO_BASE_DIR: ~/Sites/aliquote/
#+HUGO_SECTION: micro
#+HUGO_AUTO_SET_LASTMOD: nil
#+HUGO_FRONT_MATTER_FORMAT: yaml
#+HUGO_CUSTOM_FRONT_MATTER: type "tweet"
#+AUTHOR:
```

Once your draft post is over, you just have to mark it as DONE (`C-c C-t`) and it got automatically "undrafted". The published date will correspond to the timestamp created when switching the state of the post. Exporting as Markdown is managed via [ox-hugo](https://ox-hugo.scripter.co): in this case, `C-c C-e H H` anywhere in the post will export the post under the directory specified in the `HUGO_SECTION` option. Pretty simple for managing one-liner posts! A similar approach is used by Shane Sveller to [publish his whole website](https://www.shanesveller.com/blog/2018/02/13/blogging-with-org-mode-and-ox-hugo/).

On a related note, I initially came across one of the latest post by [Jack Baty](https://www.baty.net) on [Making org-journal more like Day One](https://www.baty.net/2018/making-org-journal-more-like-day-one/). There I learned about a nice feature for dragging and dropping external pictures right into an Org buffer, but more importantly this led me to learn about [org-journal](https://github.com/bastibe/org-journal), and its [dedicated layer](http://develop.spacemacs.org/layers/+emacs/org/README.html#org-journal-support) for Spacemacs. How come I didn't know that? Indeed, one could just use this approach to manage both a diary and micro posts since org-journal support entry tags. In addition, you can get an iCalendar version of your micro posts for free.
