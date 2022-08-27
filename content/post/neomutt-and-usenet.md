---
title: "Usenet newsgroups with Neomutt"
date: 2022-08-27T11:01:27+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

A few days ago I was looking at some old messages on Usenet's comp.lang.scheme, now attached to Google groups. I quit all groups I was subscribed to a while ago already, but I renabled one of them just to see how it feels. Well, you still feel the same, Google, but I'm happy comp.lang.lisp hasn't been shutdown completely, and it is still possible to dig into the archives:[^1]

![comp.lang.lisp](/img/2002-08-27-11-05-33.png)

Last time I installed [slrn] ([official website]) and configured it to use [eternal-september] NNTP server. It worked great, and it still works after a few months without opening slrn. I spend some time digging on DDG for users' config for NNTP, and except for the [official documentation], I found nothing. Noboody's using (Neo)mutt for reading news via NNTP these days?

Apparently, there's nothing much to do to get Neomutt access Usenet. First, Neomutt is able to read newsgroup in addition to standard Maildir inboxes, just press `i` and you're right into Usenet provided the environment variable `$NNTPSERVER` is set correctly. With a few additional settings, as shown below, and a `$HOME/.newsrc` file, you'll get a list of newsgroups you can subscribe to. Usually, it is enough to create the `.newsrc` file and indicate on each line the name of the group (e.g., `comp.lang.lisp`) followed by `:`. If you already have such a file, you can edit it by hand, which is what I ended up doing with the `$HOME/.jnewsrc` file created by slrn.

```
set newsrc = '~/.newsrc'
set news_cache_dir = '~/.mutt/news'
set news_server = 'news://{USER}:{PASS}@news.eternal-september.org'
set nntp_authenticators = 'user'
set nntp_listgroup = yes
set nntp_load_description = yes
set nntp_pass = '{PASS}'
set nntp_user = '{USER}'
```

Replace `{USER}` and `{PASS}` with your credentials form eternal-september.

I found the experience of reading news more pleasant under Neomutt, especially given that the color scheme is already set up and that I have my usual keyboard shortcut. Note, however, that no shortcuts are defined for browser and news-specific index views. You will have to define a few handful bindings or macros for better navigation.

{{< fluid_imgs "pure-u-1-2|/img/2022-08-27-01-04-20.png"
               "pure-u-1-2|/img/2022-08-27-01-04-06.png" >}}

> Who ever said that Usenet is dead? It most certainly is not. Even though Usenet has changed it's face over the last, say ten years, the simple idea of exchanging ideas and having discussions among a large number of people by posting articles on a global message-board has pertained. Yes, for those of you who still don't know what this is all about, we are talking about Newsgroups, an important part of the Internet, albeit heavily neglected by the media, who usually equate "Internet" with "World Wide Web". --- [Usenet is still a strange place](https://www.netmeister.org/news/usenet/)

That's it! Happy reading with good old NNTP.

{{% music %}}Miguel Zenzön • _Quitate de la Vía_{{% /music %}}

[^1]: If like me you don't want to be tied to Goggle for reading newsgroups, you can subscribe by email using the regular way: Just send an email to newsgroup+subscribe@googlegroups.com, where newsgroup is the name of the newsgroup your are interested to follow.

[slrn]: /post/usenet-and-slrn/
[official website]: https://slrn.info/
[eternal-september]: https://www.eternal-september.org/
[official documentation]: https://neomutt.org/feature/nntp#muttrc
