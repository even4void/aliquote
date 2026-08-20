---
title: "News Explorer"
date: 2026-08-19T20:37:32+02:00
draft: false
tags: ["app", "apple"]
categories: ["2026"]
---

I've long been looking for a replacement to [Reeder][1], with the following
characteristics:

- simple yet effective for daily use
- nice look'n feel, in the spirit of many native macOS apps
- import/export facilities for OPML
- iCloud syncing and storage
- advanced filters and options to discard or keep old items
- builtin previewer with support for inline images and $\LaTeX$ expressions

I've tried [NetNewsWire][2] on several occasions in the past but I never found
myself happy with using it, plus it was resource hungry, especially on my
iPhone. This is not a fair account of all the pros of that app, though, just my
own feeling. I must say that the app remains free and that this is the work of a
one-man developer, who is still working on it after retirement. That being said,
I tried the [updated version][3] of Reeder and I didn't like it at all. From the
homepage, "More than just RSS feeds, the new Reeder supports a wider range of
content, including videos, podcasts and social media posts, all seamlessly
integrated into a unified timeline." I don't want an all-in social feed reader,
I just want to keep reading my own curated RSS feeds. Actually, I've been using
[Newsboat][4] for quite a while and I really like it. When text alone is not
enough, I can just switch to Safari to browse the very same article online.

{{< figure src="/img/2026-08-20-11-07-49.png" >}}

[News Explorer][5] fulfills all the above requirements and let me replicate my
actual workflow when using Newsboat. And it is somewhat faster! I didn't check
if my feeds are perfectly synced between my MacBook and my iPhone, and I limited
the iCloud storage to two weeks. I'll keep managing my permanent archives with
Newsboat (storing plain text data in a SQLite database is cheap). Behind the
scene, News Explorer relies on snapshots which allow to reduce the time between
successive updates.

There's a wealth of parameters that you can customize using standard your
beloved macOS shortcut (`⌘,`), including read and unread feed retention policy,
local cache management, use of internal reader vs. external browser, fetching
comments automagically or manually from the website, etc. After two weeks of
use, I must say the builtin browser is really well designed and renders site
content as expected, think of an embedded web browser newt to your list of
feeds, which can be filtered by recency, counts, or reading status.

{{< fluid_imgs "pure-u-1-2|/img/2026-08-20-11-05-03.png" "pure-u-1-2|/img/2026-08-20-11-11-20.png" >}}

As a sidenote, if you plan to use both the iOS and macOS version of News
Explorer, I would recommend to first sync everything from macOS, and then
connect the iOS app to the iCloud database. I ran into trouble running the other
way around.

[1]: /post/reeder-app/
[2]: https://netnewswire.com
[3]: https://reeder.app
[4]: https://newsboat.org
[5]: https://betamagic.nl/products/newsexplorer.html

{{% music %}}Cold Cave • *Life Magazine (Delorean Remix)*{{% /music %}}
