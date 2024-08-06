---
title: "Setting Up Mu4e 1.0 C"
date: 2018-06-01T09:59:21+02:00
draft: false
tags: ["emacs"]
categories: ["2018"]
---

Just when I thought I would be a reasonable guy for 2018 and just keep processing my email with Apple Mail, I found myself reconfiguring Emacs to fetch and send some email using [mu4e](http://www.djcbsoftware.nl/code/mu/mu4e.html), now in version 1. 

{{< figure src="/img/2018-06-01-11-36-01.png" >}}

The above screenshot is just a side by side arrangement of the header view and the main mode view (with a little help from `ace-swap-window`).

There are a couple of modifications compared to my [previous settings](/post/getting-mail-with-emacs/). First, I am now relying [mbsync](http://isync.sourceforge.net) instead of [offlineimap](http://www.offlineimap.org) (which is in maintenance mode nowadays) to get my email in sync between the mail server and the local Maildir. I find it much simpler and probably faster, although I do not have large amount of email to fetch actually. Second, I no longer use Gmail so my setup was a bit simpler (you know how Gmail think of mailboxes and virtual folders, right?). I know we can [configure an iCloud account](http://irreal.org/blog/?p=6119) but I didn't try that for the moment. The default configuration with mu4e relies on Emacs `smtpmail`, but it is also [possible to use postfix](http://pragmaticemacs.com/emacs/using-postfix-instead-of-smtpmail-to-send-email-in-mu4e/).

I am using [Doom Emacs](https://github.com/hlissner/doom-emacs) and it comes with a [dedicated layer](https://github.com/hlissner/doom-emacs/tree/develop/modules/app/email), in Spacemacs parlance, and a set of Evil bindings that I still need to learn.[^1] However, original mu4e shortcuts are currently working so this is not a big deal. For the record, with OVH we need to use the SSL channel (`ssl0.ovh.net`) but the outgoing port should be set to 587 and not 465 (which is the one for SSL connection). This is not obvious from the on-line help but in case it helps...

I only configured one account since it is supposed to be used to send quick email or attachments, but I moved my entire archive of Gmail messages into a dedicated mailbox. I consider that it might still be helpful to keep of all my emails in one place as plain text: I can search into the archives from Emacs or a Terminal thanks to mu, and I also get all my contact information, including email addresses from past conversations, in case I need it. 

Note that I also added a "queue" folder using `(setq smtpmail-queue-dir "~/.mail/queue/cur")` in case I have to work remotely and offline. So, for now my Maildir is organized as follows:

```sh
% tree -d -L 2 .mail
.mail
├── aliquote
│   ├── Drafts
│   ├── INBOX
│   ├── Sent\ Mail
│   └── Trash
├── archives
│   ├── cur
│   ├── new
│   └── tmp
└── queue
    ├── cur
    ├── new
    └── tmp
```

Other useful tips & tricks can be found in the following blog posts:

- [Drowning in Email; mu4e to the Rescue](http://www.macs.hw.ac.uk/~rs46/posts/2014-01-13-mu4e-email-client.html)
- [A Complete Guide to Email in Emacs Using Mu and Mu4e](http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/)
- [Email done right (in Emacs)](https://zmalltalker.com/linux/mu.html)
- [Using mu4e](http://www.brool.com/post/using-mu4e/)

{{% music %}}Tom Waits • *The Asylum Years*{{% /music %}}

[^1]: I still haven't figured out how to make `org-mu4e-compose-org-mode` play well with the rest of my configuration when hooked under `mu4e-compose-mode-hook` (`C-c C-c` in message view does not send the message but remains bound to its Org-specific counterpart), and I have to dig further.
