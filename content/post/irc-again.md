---
title: "IRC again"
date: 2026-03-25T08:50:13+01:00
draft: false
tags: ["apple", "unix"]
categories: ["2026"]
---

I stopped using Irssi a while ago. Since I was not using any bouncer, it was
running on a server at my lab, and I connected to the client via ssh. That was
fine, though. [Soju][1] has been on my radar for quite a moment, and yesterday I
set up a free account on [IRC Today][2] to try it out together with [Senpai][3].
I know it is tightly tied to SourceHut users, but you can use it without a
bouncer as well. It works great with IRC Today, and the config is so much easier
compared to what I had in my Irssi config.

```
address "irctoday.com"
nickname "even4void"
on-highlight-beep true
pane-widths {
  nicknames 10
  channels 0
  members 16
}
colors {
  status disabled
  nicks fixed
}
```

The password can be managed outside the config file if desired, by the way. I
may eventually switch to SourceHut Soju instance if I'm happy with this client.
The price are reasonably low, and they offer Mercurial and bpaste services in
addition to traditional Git and lists, but see [Setting up IRC with soju and
senpai][4] to learn how to configure their IRC bouncer.

From what I've seen so far, Senpai has a clean UI, with mouse-enabled action. No
distraction, it's just pure text and you hide all side panels if you like.
Everything just works out of the box, without the need of extra plugin like in
Irssi, and the chat history is preserved on screen even after you `/quit`. IRC
Today offers one week of chat history on their free tiers.

It's time for the traditional screenshot, yet another TUI in my toolshed.

![img](/img/2026-03-25-09-04-03.png)

{{% music %}}Adele • _Set Fire to the Rain_{{% /music %}}

[1]: https://soju.im
[2]: https://irctoday.com
[3]: https://git.sr.ht/~delthas/senpai/
[4]: https://www.nickzana.dev/blog/irc-soju-senpai/
