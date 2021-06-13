---
title: "Neomutt"
date: 2021-06-12T20:23:04+02:00
draft: false
tags: ["app", "unix"]
categories: ["2021"]
---

I heard about [mutt](https://www.mutt.org/) during my very first years of Linux, 20 years ago, but I never got into it until last year. I tried to use it a few times on my different Macbook, without success. I guess I was not that much interested at the moment, or I didn't know what mutt was capable of, or I simply couldn't resist the macOS Mail app (and I tried many other [mail applications](/post/alternative-mail-reader-for-mac-os-x/) on the Mac). No matter why, I am now using [Neomutt](https://neomutt.org/) every day, and while I'm still learning some of its [advanced features](https://neomutt.org/guide/advancedusage), I thought I would share my experience so far.

Since I moved my whole Emacs-based setup to individual apps I needed to choose a mail reader, preferably a TUI thing since I was used to process my email from within Emacs with [mu4e](https://www.djcbsoftware.nl/code/mu/mu4e.html). From my Linux time I knew Evolution, or at least what it was in the 2000s, wouldn't fit the bill, nor Thunderbird or anything with a ton of menus and dialog boxes. I was looking for something as lean and powerful as Vim, you get the idea. [Joshua Stein](https://jcs.org) uses it, why not me? I searched a little on the net and on Github to see examples of config, read and reread the documentation, to finally arrive at a configuration that satisfies me, and especially that I can use without asking myself too many questions. Processing emails is generally a boring task,[^1] it might as well not take forever either.

Here are a few points that I like most in Neomutt:

- "You get what you want" (my shorthand for WYSIWYG, for CLI junkies): no artifice, you enter directly in the heart of the subject and you can read and compose your messages with the help of some keyboard shortcuts; the navigation in the folders remains as flexible as within Vim, and of course moving/deleting messages or threads is as easy as with mu4e.
- Neomutt support PGP encryption right out of the box, and it offers good support for managing multiple accounts: I started with 4 accounts, now reduced to 2 (work + private, thanks to appropriate automatic forward rules[^2]), and it's pretty easy to switch from one account to the other. It means that I cannot really use [Notmuch](https://notmuchmail.org/) facilities available in Neomutt, but since I use mu as my mail indexer I don't feel I miss anything, especially since we can use mu search from within Neomutt.
- It looks like you are free to use whatever method you like for fetching emails, using either POP3 or IMAP settings. I personally settled upon [mbsync](https://github.com/gburd/isync) after I encountered a few issues with [offlineimap](https://www.offlineimap.org/). And you may use an indexer (mu or notcmuch) or not. The only thing that really matters is whether you email in a Maildir or as `mbox` files.

As I said, I'm still learning about advanced features, especially those concerned with search and automatic rules. That's pretty basic stuff everywhere else: what you generally need is goto, replace (or whatever action you want to carry on an item matching a target pattern) and full-body search functionalities.

And here are a few tricks that I learned when configuring Neomutt:

- You can bypass the `;` prefix to apply commands on tagged messages by setting the `auto_tag` option. I don't but in case you think it is useful, there you know.

- Moving messages isn't obvious until you understand the difference between "copy" and "save". As a one-liner, prefer `<save-message>` and bind it to a key that makes sense to you. I have this personally:

  ```
  # in general settings
  "<save-message>+archives<enter>"  \
  "Archive message (+archives)"

  # in account-specific settings
  macro index,pager a \
  "<save-message>+aliquote/Archive<enter>"  \
  "Archive message"
  ```

  This way, pressing `a` on a message in the index view will move it to the local "Archive" folder of the corresponding mailbox, while "A" will move the message to my general "archives" --- a Maildir managed by mu with ".noupdate" flag.

- Folder hooks are tricky, since they are evaluated in order, so you must think about it carefully before asking to set specific properties for your mailboxes. I'm sure there's a better way to do it (especially to iterate over a common pattern like ̀`*/Sent`), but here's my config at the time of this writing:

  ```
  folder-hook archives/* 'set read_inc=1000'
  folder-hook archives/* 'set index_format="%[%Y-%m-%d %H:%M] [%Z %?X?A&-? %?l?%4l&%4c?] %-25.25F %s "'

  folder-hook aliquote/* source ~/.config/neomutt/accounts/aliquote
  folder-hook aliquote/* 'set index_format="%[!%y-%m-%d] [%Z] %-25.25F %s "'
  folder-hook aliquote/Sent "set sort=reverse-date-sent"
  folder-hook aliquote/Sent set strict_threads=yes

  folder-hook jussieu/* source ~/.config/neomutt/accounts/jussieu
  folder-hook jussieu/* 'set index_format="%[!%y-%m-%d] [%Z] %-25.25F %s "'
  folder-hook jussieu/Sent "set sort=reverse-date-sent"
  folder-hook jussieu/Sent set strict_threads=yes
  ```

  The 2nd line confirms that you can manage to have different summary views depending on the mailbox you are currently viewing, but see the next point.

- Likewise, actions on a mailbox imply that you first "enter" that mailbox, which means that to fetch all new mails you either add to write a macro which starts with `<enter-command>` or `<shell-escape>` or you need to write account-specific macros, which is what I find easier. For instance, in my `.config/neomutt/accounts/aliquote` file, I have the following line:

  ```
  macro index o "<shell-escape>mbsync aliquote<enter>" \
          "run mbsync to sync mail for this account"
  ```

  This means that when I press `o` while on the "aliquote" mailbox, I can fetch all related emails. On the other hand, I also have a general macro which applies to all available inboxes:

  ```
  macro index O "<shell-escape>inbox<enter>" \
          "run mbsync + mu-index to sync all accounts"
  ```

- If you want to keep up to date with your mailbox status, you can use this [clever trick](https://unix.stackexchange.com/a/240618):

  ```
  set status_format = "mutt_status \" %f sort:%s msgs:%?M?%M/?%m %l%?n? new:%n?%?o? old:%o?%?d? del:%d?%?F? flag:%F?%?t? tag:%t?%?p? post:%p?%?b? inc:%b?%?l??\" \"mutt (%b)\"|"
  ```

  The first argument to `mutt_status` reflect my personal settings inside Neomutt, and the second argument simply display the name of the running app (which is what I used in my Zsh configuration[^3]) with the number of inboxes with new mails in brackets.

- You explicitly need to "subscribe" to lists if you want to easily reply to the list rather than the sender.

[^1]: Let's face it: incoming emails are mostly work-related or junk emails. It means we need extra efforts to process them, no matter how you look at it, compared to private messages we used to send each other in the 2000s. Facebook succeeded in abolishing private emails, Slack didn't for work-related emails apparently.
[^2]: I got a lot of timeouts for icloud recently, to the point this became really annoying since it was the first account I was checking on my list. I decided to forward everything to my other private account, and get ride of all my old mails by simply archiving them with the rest of my former Gmail account. On the plus side, fetching new mails is now much faster since I only have two accounts to manage.
[^3]: You can add `print -Pn "\e]0;$1\a"` in a `preexec()` function for that purpose. See also [Xterm Titles With Bash](https://www.davidpashley.com/articles/xterm-titles-with-bash/).
