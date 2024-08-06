---
title: "Prettify your Emacs (bis)"
date: 2019-09-18T21:59:15+02:00
draft: false
tags: ["emacs"]
categories: ["2019"]
---

Lately I have spent a fair amount of time tweaking my (Doom) Emacs config to make it look the way I want it to.

> I care about how my editor looks because I stare at it all day. How could I not care deeply about how it looks? --- [Jack Baty](https://www.baty.net/2019/how-my-editor-looks-is-important-to-me/)

I do care as well, especially since I spend nearly 70% of my "computing time" in front of this editor.

Now, when I see the number of new commits since the last time I fetched the develop branch of Doom Emacs on my HD, I just want to cry. It is just scary as it might break a lot of things that are currently working (mainly Python and Lisp/Scheme stuff), and I wonder if there is a point in updating as frequently as I did in the past. Last update went with a complete rework of the package management ([straight](https://github.com/raxod502/straight.el)) system, for example. Even with a complete backup of my `.emacs.d`, it took me more time than expected to get my Emacs up again. And, of course, I forgot to save the `.local/cache` directory where a lot of useful stuff is stored...

{{< figure src="/img/2019-09-18-21-58-09.png" >}}

Anyway, let's see how it goes. For the time being, I will definitely stay with my current config, as I find it definitely satisfactory after months of fighting with LSP servers and Org mode. I know I will probably change my mind in the next few weeks, but anyway, here are the good parts of my hacking time, which closely follows my [earlier post](/post/enliven-your-emacs/).

First, I removed `org-ref` --- I wasn't really using it, in fact I just need to be able to manage a BibTeX file (read search/edit/annotate), and I am now using Pandoc syntax to include references in Org document. For example, `@johndoe2011` should read "John Doe (2011). The infamous article that nobody reads. The fucking Journal, vol (#): pp" when exported as HTML or PDF. Otherwise, I don't really care since I can use `ivy-bibtex` and look for the reference. The same function (`ivy-bibtex`) allows me to find and open any BibTeX entry, to annotate it as well, or to insert a plain text reference or the bibtex key in my current buffer, be it an Org or a Markdown file. This is generally all I need to do, after all. Back to our subject, as I removed the `org-ref` package, I needed a way to highlight Pandoc-like citation in any Org file I am currently editing. Easy peasy, here is one way to do it: (and here is [another way](https://emacs.stackexchange.com/a/52390))

```emacs-lisp
(font-lock-add-keywords 'org-mode
                        '(("@[a-z]+.+?[^;,.]+" . font-lock-keyword-face)))
```

This is basically how it looks:

{{< figure src="/img/2019-09-18-23-00-40.png" >}}

I should note that I follow strict rules when generating BibTeX keys, which simplifies the construction of the above regex (which should stop whenever we encouter a semi-colon, a comma or a period):

```emacs-lisp
(setq bibtex-field-delimiters 'double-quotes
      bibtex-autokey-year-length 4
      bibtex-autokey-name-year-separator "-"
      bibtex-autokey-year-title-separator "-"
      bibtex-autokey-titleword-separator "-"
      bibtex-autokey-titlewords 2
      bibtex-autokey-titlewords-stretch 1
      bibtex-autokey-titleword-length 5)
```

Second, I don't really like the way `≤` and `≥` are rendered when using the patched Iosevka font. The symbols look too streched (horizontally), and I much prefer slanted version. As I said in my [earlier post](/post/enliven-your-emacs/), I updated the default list of symbols (`+pretty-code-iosevka-font-ligatures`) using basic `setq`. However, new settings will not override default settings, so I decided to manage the `+iosevka.el` file myself, and commented out the default values I didn't like. I know this is sort of a ugly hack, but this way I can keep things in control at the very least.

The same happens for Magit nice `list-repository` utility. Why not adding some fancy Unicode character in place of plain text column headers? A little `(setq magit-repolist-columns ...)`, and we are done.

Also, I added some (ya)snippets for the git commit popup, namely `wip` (work in progress), `cos` (cosmit changes), `fix` (minor fix) and `doc` (add doc). Do we need any other headline when we wok-rk alone? This basically mimics what I already have as Git aliases in my Git config files. Very handy in any case.

Last, I managed to reafctor all my Org files so that I now have a set of public files that I can push to Github, as well as private files (daily log book and work-related todos files), and a set of public notes that I may probably publish on Github at some point:

    ~/org (master|✚2)  tree
    ├── drafts
    │   ├── _assets
    │   │   ├── github.css
    │   │   └── worg.css
    │   ├── _img
    │   │   ├── ch1-Z-G-13.gif
    │   │   ├── fig-emacs-markdown-mode.png
    │   │   ├── fig-emacs-screenshot.png
    │   │   └── fig-sam-format.png
    │   ├── drafts.org
    │   ├── emacs-lisp.org
    │   ├── fp-notes.org
    │   ├── impatient-emacs.org
    │   ├── ngs.org
    │   ├── number-theory.org
    │   ├── phylo.org
    │   ├── src
    │   │   ├── ackerman.pas
    │   │   ├── echange.pas
    │   │   ├── fibonacci.pas
    │   │   ├── gauss.c
    │       --%<--------------
    │   │   ├── test.db
    │   │   ├── test_perms.pas
    │   │   ├── testfloat.c
    │   │   ├── trinome.pas
    │   │   └── trinome2.c
    │   └── unix-one-liner.org
    ├── local
    │   ├── diary.org
    │   ├── log.org
    │   └── todos.org
    ├── micro.org
    ├── notebook.org
    ├── old-notes.org
    ├── papers.org
    ├── quickies.org
    ├── references.bib
    ├── refile.org
    └── urls.org

<small>(Yes, I know, Turbo Pascal files are very, very old school.)</small>
