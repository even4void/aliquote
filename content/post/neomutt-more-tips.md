---
title: "More Neomutt little hacks"
date: 2022-08-26T12:58:30+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

Some further tips and tricks on Neomutt after my [original post]. See also my related post on [Tmux hacking].

I will probably never regret switching from [mu4e] to Neomutt two years ago. Chris Wellons [did the same] apparently. It's the same keyboard-driven experience, but with all the functionalities you would expect from a mail processor. Moreover, as they use to say:

> All mail clients suck. This one just sucks less. --- Michael R. Elkins

I spent a lot of time configuring Neomutt to my liking, and to this end I happened to read a lot of blog posts,[^1] the online documentation and the man pages, dotfiles available on Github, etc. Neomutt is great, but its configuration is harder than it seems because there are tons of options that you need to define carefully. Of course, default options are quite good, but you know when you start tinkering your setup... My previous post explained how I ended up setting my default config. Here are a few additional tricks that I learned along the way.

- using folder hooks: Folder hooks are actions that carried automatically when you enter a (local or remote) folder. I use a few of them, mostly to setup specific mailboxes. For instance, I have a different display mode depending on whether I'm in my Inbox or in the Archives folder (where I usually want a detailed timestamp, especially the year since messages can span more than 15 years), but see below:

     ```
     folder-hook archives/* 'set read_inc=1000'
     folder-hook archives/* 'set index_format="[%[%Y-%m-%d %H:%M]] [%Z %?X?A&-? %?l?%4l&%4c?] %-25.25F %?M?<%M> ?%s "'

     folder-hook aliquote/* source ~/.config/neomutt/accounts/aliquote
     folder-hook aliquote/* 'set index_format="[%[!%m-%d %H:%M]] %zt %-25.25F %?M?<%M>? %s "'
     folder-hook aliquote/Sent 'set index_format="[%[!%m-%d %H:%M]] [%Z %?X?A&-?] %-25.25F %s "'
     folder-hook aliquote/Sent 'set sort=reverse-date-sent'
     folder-hook aliquote/Sent set strict_threads=yes

     folder-hook aliquote/INBOX 'push "Tscipy-dev-request<enter><tag-prefix-cond><save-message>=digests<enter><end-cond>"'
     --8<--------
     ```

     If you write a lot of macros, sometimes it is worth considering folder-hook or variation thereof. You often just have to replace your `macro` statement with a `push` command to let Mutt press all the keys for you.

- collapsing threads: I wanted all threads to be collapsed by default when entering my Archives folder. I originally used a hook for that, `folder-hook archives/* 'push <collapse-all>\n'`, which has the undesired side-effect of making sidebar actions (navigating next and previous folders) to open the first message when entering the folder itself. Fortunately, there's an even simpler solution using the following two options: `set collapse_all = yes` and `set uncollapse_new = yes`. This will affect all folder, but the last one will help in case there are new replies in the Inbox.

- navigating the sidebar: After reading Joshua Stein configuration on Github, I ended up using two macros to toggle the sidebar on or off. However, there's a simple command that do the trick: `bind index,pager B sidebar-toggle-visible`. I then use two macros to help navigating in the sidebar tree: `macro index K "<enter-command>push <sidebar-prev><sidebar-open><enter>"` and `macro index J "<enter-command>push <sidebar-next><sidebar-open><enter>"`.

- displaying all URLs in a message: I originally used [urlscan] to show all URLs found in a message, but I found that `urlview` is builtin and works better. By default, it is mapped on `C-b`.

- colors: There are several sections to manage Neomutt color theme, the main parts being `index`, `header` and `body`. In the `body` section, you can even highlight Git diff or emojis if you like.

- PGP signing/encryption: I like to have the possibility to sign and/or encrypt my message, but I don't want them to be signed on by default. For this, you can unset the `crypt_autoencrypt` and `crypt_autosign` variables, and when you save your message, the magic key is `p` before confirming to send your message (`y`): you will be prompted to sign and/or encrypt your outgoing email. To configure PGP stufff in neomutt, source the relevant sample file, `/usr/share/doc/neomutt/samples/gpg.rc.gz`, which contains default values that should work if you have gpgme installed on your system, and the relevant settings in your muttrc file:

     ```
     set crypt_autoencrypt = no
     set crypt_autopgp = yes
     set crypt_autosign = no
     set crypt_replysign = yes
     set crypt_replysignencrypted = yes
     set crypt_use_gpgme = yes
     set crypt_verify_sig = yes

     set pgp_self_encrypt = yes
     set pgp_sign_as = {PGP_KEY}
     set pgp_use_gpg_agent = yes
     ```

Finally, some words about my workflow. The main structure of my mailboxes is shown below:

```
INBOX
Drafts
Sent
Trash
archives
digests
@chicken-users
--8<--------
```

I now use a single account setup because I found that juggling different accounts was kind of not that funny at times. My typical workflow is that every new mail end up in the INBOX, with some automatic filters to move messages from mailing-lists I subscribed to in their respective folders. Mailing digest may be archived manually into the "digests" folder, and I used to use a weird macro to automate this stuff.[^2] The "archives" folder is an all-in-one archive of all the messages I received since around 2006 (Gmail time, remember?). It held more than 45K messages at some point, but I did a drastic pruning a few years ago so that now there are just about fifteen thousand messages, which is more manageable, even for Neomutt. I have some handful macros that help keeps the digests and mailing folders clean: one macro allows to delete all message older than a certain amount of days, while another macro is used to mark all messages as read.

```
macro index <Esc>x "<tag-pattern>~d >6m<enter><tag-prefix-cond><delete-message>" "delete old messages"
macro index \Cx "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>" "mark all messages as read"
```

{{% alert note %}}
<small>[2022-08-27]</small><br>
TIL some Vim keybindings are defined in `/usr/share/doc/neomutt/vim-keys/vim-keys.rc`. Unfortunately, there's not much to see except some bindings for moving around, scrolling and managing threads (sort of).
{{% /alert %}}

{{% music %}}Maxence Cyrin • _As the Darkness Falls_{{% /music %}}

[original post]: /post/neomutt/
[tmux hacking]: /post/tmux-little-hacks/
[mu4e]: https://www.emacswiki.org/emacs/mu4e
[did the same]: https://nullprogram.com/blog/2017/06/15/
[urlscan]: https://github.com/firecat53/urlscan

[^1]: I may even have missed Steve Losh's excellent [blog post](https://stevelosh.com/blog/2012/10/the-homely-mutt/) at some point.
[^2]:
    Example of a weird macro, that I converted to more manageable folder hooks a while ago:

    ```
    macro index <Esc>s \
      "Tr-devel-request<enter><tag-prefix-cond><save-message>=digests<enter><end-cond> \
      T~Crabble@arXiv.org<enter><tag-prefix-cond><save-message>=digests<enter><end-cond> \
      Tnumpy-discussion-request<enter><tag-prefix-cond><save-message>=digests<enter><end-cond> \
      Tscipy-dev-request<enter><tag-prefix-cond><save-message>=digests<enter><end-cond> \
      --8<--------
      Tcryptography-request<enter><tag-prefix-cond><save-message>=digests<enter><end-cond>"
    ```
