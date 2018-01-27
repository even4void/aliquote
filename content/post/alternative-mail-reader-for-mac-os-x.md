+++
title = "Alternative mail reader for Mac OS X"
date = 2012-12-17T22:12:46+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I just gave a try to [MailMate](http://freron.com) to manage my emails on my Airbook.

There are some good overviews of alternative applications to Apple Mail here: 

* [The Ultimate Mail Client for Mac OS X](http://bit.ly/UA4Xui) <i class="fa fa-chain-broken fa-1x"></i>
* [The Best Email Client for Mac OS X](http://bit.ly/T2CAHI)
 
I tried [Postbox](http://www.postbox-inc.com) a month ago but I gave up after one day: although it looks interesting in many respects (attachment via Dropbox, searching facilities, and responsiveness). It was supposed to be a good client for Gmail users because it is supposed to handle labels and virtual folders. However, I was unable to fetch all my Gmail messages after leaving the application run over 12 hours or so. On the plus side, the customer service is very cool and you get a full refund if you are not satisfied with the product.

[MailMate](http://freron.com) has a clean UI and visually looks like Apple Mail, except for the way threaded conversations are handled. It is designed to work with IMAP only. It can import your account information from Apple Mail and it has access to contacts stored in the Address Book. I haven't found any iCal support, although there seems to be some Apple scripts located in `MailMate.app/Contents/SharedSupport/Scripts/`. Not sure of what to do with them at the moment.

Since Gmail does not follow usual IMAP convention, we always end up with duplicated messages in our mailbox, unless we adapt the way messages are fetched on the server. On Apple Mail, for example, I had to disable every labels for IMAP and map the Sent Messages to the Sent folder on my Mac. In this case, detailed instructions are available at <http://blog.freron.com/category/gmail/>. I followed the instructions (adding the `[Gmail]/Archive` label to messages from the `All Mail` virtual folder) and everything seems to work fine for now.

Here are some nice features:

- Every command is binded to a custom (combination of) key(s) which makes it comfortable even without a mouse.
- Import facilities, including eml (for those who like Outlook) and mbox format.
- Natural Markdown support. I only use plain text, but it might be useful from time to time if syntax highlighting for code snippets is needed.
- Powerful search engine with rules combination (much like in Finder), which was seriously lacking on Apple Mail.
- Smart mailboxes, like there were on Apple Mail two or three years ago.
- Different viewing layout, including three-column mode and statistics or conversation view.
- Natural support for PGP (on Apple Mail, we need to install it [separately](https://www.gpgtools.org/gpgmail/index.html)).
- Menu or Dock messages notifications and counters (again, on Apple Mail one has to resort on third-party software, like [Mail Unread Menu](http://loganrockmore.com/mailunreadmenu/)).

There's no way to search messages with Spotlight, though. The CPU and memory usage seems reasonable, although greater than Apple Mail when idle. According to the author, "All messages are essentially handled as if they were in one big mailbox and all other mailboxes are queries within this mailbox. It is extremely flexible, but it also has a price with respect to memory and cpu time." I need to do more extensive testing during working days.

