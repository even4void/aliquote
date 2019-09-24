---
title: "Using Mu to manage e-mails"
date: 2013-05-31T20:14:47+01:00
draft: false
tags: ["apple"]
categories: ["2013"]
---

Yet another attempt at installing [mu](http://www.djcbsoftware.nl/code/mu) to store my Gmail account locally and get better search features than Apple Spotlight.

## Mail.app does not use open standard formats

Apple has stopped a long time ago to use standard plain text format for storing archives of mails. Instead, `Mail.app` now relies on the [elmx](http://mike.laiosa.org/2009/03/01/emlx.html) format and `sqlite` is used as a backend to manage its database. I'm quite happy with Mail.app, even if I tried some [other software](/post/alternative-mail-reader-for-mac-os-x). I think [MailMate](http://freron.com) is actually the best possible alternative, although I gave it a try for a very short time. Anyway, I happen to work most of the time in a browser since internet access is restricted to certain applications in my office. Even if there are some possibilities to use text-based search commands, like `to:`, `from:`, `subject:` and restricting the search to e.g., a specific month, it lacks several options, IMO. I also learned that there is an org library [org-mac-message.el](http://orgmode.org/worg/org-contrib/org-mac-message.html) to work with Mail.app directly from within Emacs, but what I really want to have is a direct access to my messages in plain text mode, with a full-featured search engine.

The [Maildir](http://en.wikipedia.org/wiki/Maildir) format is one possibility for saving messages in plain text, and contrary to the [mbox](http://en.wikipedia.org/wiki/Mbox) format, which is the default used by the `mail` program on OS X, messages are saved in separate files on the disk. Messages are organized in separate folders, basically `cur`, `new` and `tmp`, which speak for themselves but are fully explained on this [man page](http://www.qmail.org/qmail-manual-html/man5/maildir.html). As one would have suspected, these different formats cannot be mixed. Mail.app cannot readily manage a Maildir (altough I believe we can import messages archived in Maildir format), and the `mail` program cannot be used to work with a local Maildir.

## Installing mu

In order to install `mu`, it is necessary to have a recent version of [Glib](https://developer.gnome.org/glib/). The one I have on my system is pretty old (2.18), and it is mainly there for R and [Ggobi](http://ggobi.org). So I grabbed the GTK 2.24.17 framework from the [R for Mac OS X Developer's Page](http://r.research.att.com).[^1] We also need the [GMime](http://spruce.sourceforge.net/gmime/) library and I chose the latest version available on their website (gmime 2.6.15). For some unknown reason, it doesn't install the `gmime.pc` file. I had to manually copy it to `/usr/local/lib/pkgconfig`. Later, the `configure` program complained that it still wasn't able to find it:

```
checking for GMIME... yes
Package gmime-2.6 was not found in the pkg-config search path.
Perhaps you should add the directory containing `gmime-2.6.pc'
to the PKG_CONFIG_PATH environment variable
No package 'gmime-2.6' found
```

I ended up adding a symlink `gmime.pc -> gmime-2.6.pc` in `/usr/local/lib/pkgconfig`. Next, I was told that I also need the [Xapian](http://xapian.org) toolkit:

```
configure: error:
   *** xapian could not be found; please install it
   *** e.g., in debian/ubuntu the package would be 'libxapian-dev'
   *** If you compiled it yourself, you should ensure that xapian-config
   *** is in your PATH.
```

Let's go for a new download/configure/make with [xapian core 1.2.15](http://xapian.org/download). Hopefully, everything went fine this time, and I got the following:

```
mu configuration is complete.
------------------------------------------------
mu version                           : 0.9.9.5

Xapian version                       : 1.2.15
GLib version                         : 2.36.0
GMime version                        : 2.6.15

Have wordexp                         : yes
Build mu4e emacs frontend            : no
Build crypto support (gmime >= 2.6)  : yes
Build 'mug' toy-ui (gtk+/webkit)     : no
McCabe's Cyclomatic Complexity tool  : yes

Have direntry->d_ino                 : yes
Have direntry->d_type                : yes
------------------------------------------------
```

As can be seen, Emacs support has not been taken into account although I tried several options during `configure`. Anyway, I managed to put all `*.el` file in a dedicated folder under my `~/.emacs.d` directory and add

```emacs-lisp
(add-to-list 'load-path "/Users/chl/.emacs.d/lib/mu4e")
```

to my `.emacs`. I'm not so much interested in the Emacs UI for the moment, but I may return to it later.

Once `mu` has been installed, we have to select a program that can synchronize with IMAP or POP3 accounts. We could use Fetchmail but I decided to try [offlineimap](http://offlineimap.org), which appears to be the preferred method with `mu`:

```
% git clone git://github.com/OfflineIMAP/offlineimap.git
% cd offlineimap
% make
% sudo python setup.py install
```

I created a basic `.offlineimaprc` based on the default template, but note that with Gmail we have to [add information regarding certificates](http://comments.gmane.org/gmane.mail.imap.offlineimap.general/5654). This is basically a single line to add in the `[Repository Remote]` section of the `.offlineimaprc` file:

```
cert_fingerprint = f3043dd689a2e7dddfbef82703a6c65ea9b634c1
```

We can then fetch all messages:

```
 % offlineimap
 OfflineIMAP 6.5.5-rc2
   Licensed under the GNU GPL v2+ (v2 or any later version)
 Account sync Gmail:
  *** Processing account Gmail
  Establishing connection to imap.gmail.com:993
  Creating folder [Gmail].All Mail[Local]
  Creating folder [Gmail].Drafts[Local]
  Creating folder INBOX[Local]
  Creating folder [Gmail].Starred[Local]
  Creating folder [Gmail].Trash[Local]
 Folder [Gmail]/All Mail [acc: Gmail]:
  Syncing [Gmail]/All Mail: IMAP -> Maildir
 Folder [Gmail]/Drafts [acc: Gmail]:
  Syncing [Gmail]/Drafts: IMAP -> Maildir
  Establishing connection to imap.gmail.com:993
 Folder [Gmail]/Starred [acc: Gmail]:
  Syncing [Gmail]/Starred: IMAP -> Maildir
  Establishing connection to imap.gmail.com:993
 Folder [Gmail]/Trash [acc: Gmail]:
  Syncing [Gmail]/Trash: IMAP -> Maildir
 Folder INBOX [acc: Gmail]:
  Syncing INBOX: IMAP -> Maildir
 Folder [Gmail]/Trash [acc: Gmail]:
  Establishing connection to imap.gmail.com:993
 Folder INBOX [acc: Gmail]:
  Establishing connection to imap.gmail.com:993
 Folder [Gmail]/Starred [acc: Gmail]:
  Copy message 643 (1 of 39) Remote:[Gmail]/Starred -> Local
  Copy message 261 (2 of 39) Remote:[Gmail]/Starred -> Local
  Copy message 787 (3 of 39) Remote:[Gmail]/Starred -> Local
  Copy message 918 (4 of 39) Remote:[Gmail]/Starred -> Local

 (-- %< --)

 Account sync Gmail:
  *** Finished account 'Gmail' in 145:49
```

So, it took less than 3 hours to get all messages from my Gmail accounts. Then, we can ask `mu` to index our Maildir:

```
% mu index
indexing messages under /Users/chl/Maildir [/Users/chl/.mu/xapian]
\ processing mail; processed: 39300; updated/new: 39300, cleaned-up: 0
cleaning up messages [/Users/chl/.mu/xapian]
| processing mail; processed: 39369; updated/new: 0, cleaned-up: 0
elapsed: 1 second(s), ~ 39369 msg/s
/ processing mail; processed: 39369; updated/new: 0, cleaned-up: 0
elapsed: 233 second(s), ~ 168 msg/s
```

As can be seen, that's pretty fast!

Useful options for using `mu find` are `-u` to avoid returning duplicate messages (because the Gmail fake IMAP format just sucks some time). But see `man mu-find` to learn more on how to write specific queries. For example, the following query will match all messages between 3 and 5 Mo, sent during the year, and including a PDF file. Results will be sorted by date and include the link to the local file in the Maildir.

```
% mu find -u size:3M..5M date:1y..now mime:application/pdf \
  --fields "d f l" --sortfield=date
```

Of course, this can be piped to other programs, and we can do whatever text mining we want in our Maildir.

### Sidenote

Incidentally, I came across other projects that ought to provide similar functionalities, e.g., [sup](http://supmua.org) and [notmuch](http://notmuchmail.org), but I haven't investigate them thus far.


[^1]: It just introduced a splendid mess in every GTK-based applications on my Mac afterwards! This apparently is due to a problem with the Pango library. So I just replaced the symlinks in `/Library/Frameworks/GTK+.framework` to point to my older libraries.
