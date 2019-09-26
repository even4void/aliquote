---
title: "Spacemacs and Hugo made easy"
date: 2018-03-06T13:10:23+01:00
draft: false
tags: ["emacs", "this"]
categories: ["2018"]
---

I am almost done with my new setup. This all starts with [refactoring my web site](/post/setup-2018) (Hugo backend), archiving and reorganizing my [text-based workflow](/post/notes-taking-workflow), and finally blogging again after several months IDLE. 

The only pieces missing are: I need a more efficient way to interact with Hugo from Emacs (I mean without having to go to a terminal to create new post or preview my site); I also need to change the CSS a bit and add an Archive page to see all the posts.

In this post, I will talk about the first part: writing and publishing directly using Emacs. There are a couple of blog posts that deal with this, with people suggesting a publishing workflow entirely based on org-mode, for example [org mode for blogging](http://whyarethingsthewaytheyare.com/setting-up-the-blog/#workflow) (h/t [Irreal](http://irreal.org/blog/?p=5976)). This approach relies on a single file "where each heading corresponds to one post, and headings could then be exported to individual markdown files", and I am not very happy with this idea.

I know that one can write in org-mode instead of Markdown. Indeed, "[Hugo 0.19](https://github.com/gohugoio/hugo/releases/tag/v0.19) brings native Emacs Org-mode content support ([\#1483](https://github.com/spf13/hugo/issues/1483))." I also found that there exists an Org exporter backend, [ox-hugo](https://ox-hugo.scripter.co). The installation appears quite easy, especially for Spacemacs users. Compared to the preceding solution, it allows us to work with one org file for each post.

Then I discovered that there is an Emacs major mode for managing Hugo blogs, namely [emacs-easy-hugo](https://github.com/masasam/emacs-easy-hugo) (available on MELPA). It allows to write in Markdown or with org-mode directly. The corresponding format is chosen based on file extension. At first glance, it looks like it [does not play well with Spacemacs](https://github.com/masasam/emacs-easy-hugo/issues/35) but it works perfectly, pending [minor tweaks](https://github.com/cescoferraro/dotfiles/blob/master/src/emacs.d/configuration.org#hugo) that are now well documented on the GitHUb repository.

Overall, I like this setup. I can (1) easily manage all my posts, much like when I am using [Deft](https://jblevins.org/projects/deft/), (2) choose between Markdown (for blog posts) or Org (for single web page) format, (3) access most of `hugo` options without having to switch to a terminal. Moreover, `easy-hugo` let me select pictures from Hugo `static/img` directory (<kbd>M-x easy-hugo-image</kbd>), or from my `~/Pictures` folder (<kbd>M-x easy-hugo-put-image</kbd>), where I store all my screenshots.[^1]

{{% music %}}Laura Veirs • *Year of Meteors*{{% /music %}}


[^1]: I use [this little bash script together with a Launch Agent](https://apple.stackexchange.com/a/251393) that is watching my Desktop for new screenshots. New screenshots are automagically moved to my `~/Pictures` folder with a more convenient name `yyy-mm-dd-hh-mm-ss.png`, which serves as a unique ID and that I can safely move to Hugo `static/img` directory afterward.
