---
title: "Tips and tricks for Neomutt"
date: 2022-01-19T20:15:24+01:00
draft: false
tags: ["unix", "app"]
categories: ["2022"]
---
A few months ago, I talked about my new email client, [neomutt](/post/neomutt/), and the default settings I settled upon. Nothing has changed much, except that I now use a single catchup email address, which makes managing emails more comfortable over time.

Here are a few other tricks that I learned (the hard way) in the meantime:

- If you use Vim or Neovim as your main editor for writing emails, you can enable spell checking as follows: `set editor = "nvim +8 -c 'set textwidth=0' -c 'set spell spelllang=fr,en'"`. Note that you can use more than one language.
- I don't like notification, but you can get live notifications on your desktop using [inotify](https://neomutt.org/feature/new-mail).
- If you have multiple accounts (past or present), it is useful to define `alternates`, e.g. `alternates (john@smith.com)|(john.smith@(mac\.com|gmail\.com))`.
- Folding may be enabled automagically for threads provided you ask for it, e.g., write `folder-hook archives/* 'push <collapse-all>\n'` in your `muttrc` config file, after replacing `archives` with the mailbox of interest.
- If you prefer reading plain text message over, say, HTML version, don't forget to add `alternative_order text/plain text/enriched text/html`.
- If you use mu as your main backend to process your email archives, you can benefit from its search functionalities in addition to Neomutt builtin ones. I use the following bindings to query and retrieve results:

  ```
  macro index F "<shell-escape>mu find --clearlinks --format=links --linksdir=~/.mu/results " "mu find"
  macro index ,f "<change-folder-readonly>~/.mu/results<enter>" "mu find results"
  ```
- Rather than reading then deleting a message, you can mark it as read and delete it altogether using the following macro: `macro index,pager X ":set confirmappend=no delete=yes resolve=no\n<clear-flag>N<tag-prefix><delete-message>:set confirmappend=yes delete=ask-yes resolve=yes\n<next-undeleted>"`. This way, to delete a message just press the <kbd>X</kbd> key; it will be marked as read and moved to your Trash folder. No more unread message in your Trash folder!
- To mark all messages as read, you can use the following macro: `macro index \Cr "T~U<enter><tag-prefix><clear-flag>N<untag-pattern>.<enter>" "mark all messages as read"`.
- Finally, to view specific attachments, you can use the following settings:

  ```
  application/pdf; pdftotext -layout %s -; copiousoutput;
  # application/pdf; /usr/bin/xdg-open %s ; copiousoutput
  application/postscript ; /usr/bin/xdg-open %s ; copiousoutput
  application/msword; pandoc --from docx --to plain %s; copiousoutput
  application/rtf; pandoc --from rtf --to plain %s; copiousoutput
  ```

{{% music %}}Chris Bailey • _Bring It On Home to Me_{{% /music %}}

