+++
title = "Using mu to manage e-mails (followup)"
date = 2013-06-14T11:09:30+01:00
draft = false

tags = ["apple", "emacs"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here are further thoughts on managing IMAP accounts on a Mac without any GUI.

I have been reading with pleasure this post: [Email done right](http://zmalltalker.com/linux/mu.html). In my case, I'm not so much concerned with the need for an unified inbox: I have several accounts but I only use Gmail. I have a `.mac` address that I will probably drop by little, and I don't use my server (`@aliquote.org`) address (maybe I sould!). Instead, I'm just looking for a simple way of checking and filtering mails. I like the Google web interface because it is dead simple, but it lives in the cloud. I need to backup everything on a physical drive: first, I'm a little paranoid when it comes to 7 years of messages, and, second, I need offline access to my mailbox. [Mu](http://www.djcbsoftware.nl/code/mu) provides me with the bare essentials: fast search and indexing capabilities, and a extremely simple interface for Emacs that I use all the days.

Text-based solutions are great: they are fast, they are not greedy in terms of RAM, and they allow to focus on the essentials--productivity. Besides email, I have been using [links](http://links.twibright.com/) (or [Lynx](http://lynx.browser.org/) under Linux) as my main text-based browser, but [w3m](http://w3m.sourceforge.net/) offer similar capabilities, or maybe more. I ran into a couple of problems when trying to compile the program. First, I had to apply a [minor patch](http://sourceforge.net/p/w3m/patches/59/) because of a weird error in file `main.c`. Then, the `Makefile` needed to be updated to link properly to the X11 libraries which are required for `w3mimgdisplay`. This can be fixed with:

```
LDFLAGS = -L/usr/X11/lib -lX11
```

According to the post [Emacs, Email and Mu](http://ionrock.org/emacs-email-and-mu.html), `w3m` can be used as a replacement for `html2text` (which I cannot get to work on OS X), and the following should work:

```lisp
(setq mu4e-html2text-command "w3m -dump -T text/html")
```

However, it should be noted that there is another project, [html2text](https://github.com/aaronsw/html2text), which is purely written in Python, and works like a charm.

Finally, I forgot to mention in my [preceding post](/post/using-mu-to-manage-e-mails/) that we need some extra steps to setup the sending part. The following gists were useful to get `mu4e` sending email:

- [Building GnuTLS on Mac OS X](https://gist.github.com/morgant/1753095)
- [Manage your email in emacs with mu4e](https://gist.github.com/areina/3879626)

I even managed to get my Google calendar and contacts list live in Emacs with the help of [googlecalendar](https://code.google.com/p/emacs-google/wiki/googlecalendar) and [googlecontacts](https://code.google.com/p/emacs-google/wiki/googlecontacts).
