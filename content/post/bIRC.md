---
title: "bIRC and back to IRC"
date: 2026-08-08T21:32:01+02:00
draft: false
tags: ["app", "apple"]
categories: ["2026"]
---

Textual IRC has been sunset and although it still works with Libera.Chat, it
doesn't seem to handle history replay from modern bouncers like [soju][1]. At
the beginning of the year I subscribed to the free plan on
<https://irctoday.com>: one week of history is enough to keep track of any
channel I'm following or to engage in quick conversations, and I only use
Libera.Chat. They use soju which you find otherwise at the heart of
[sourcehut][2] hosted chat services. It's really great, I no longer need to let
Irssi run in the background on a distant server. Now I use senpai at the command
line, and bIRC when I want a native app sitting in my Dock:

![img](/img/2026-08-08-20-11-10.png)

I'm no [John Gruber][3], but I can only confirm that this app is simply
excellent and comprehensive. The only thing to remember is to use the
`username/server` convention to identify your account on bouncer.[^1] There may
be another way to do that, but that's how we did with Textual and ZNC bouncer.
By the way, I also bought the pro version even if I wouldn't need all these new
features.

First off, you have a native Mac app which means `⌘,` brings a Preferences
window you're all familiar with, and not a TOML or YAML file to edit with your
preferred text editor. And it's full of options ranging from very basic and
classical one (system notification, highlight, custom away message, etc.) as
well as more modern IRC features (so called [IRC v3][4]) which I'm not much
familiar with, except that I known it brings us a bit closer to the features
available on Matrix. Besides SASL auth, we get things like reactions (as in
modern chat apps) or [message tags][5]. See also [New And Upcoming IRCv3
Features][6] on Libera.Chat.

With bIRC you can search for specific messages, get a log of your current
session (login, auth, etc.), check your highlights across all channels, upload
file via [FILEHOST][7] when available, and sending a direct message is just a
matter of selecting a user in the user list on the right panel and right
clicking.

And you know what, when you start to get older, you appreciate being able to
change default font size or to get access to the classical macOS shortcut to
increase current font size ;-)

When I look at bIRC, it looks like senpai but with with all the little extras
that make macOS what it is. Congrats to the author of this gem!

{{< fluid_imgs
    "pure-u-1-2|/img/2026-08-08-22-18-02.png"
    "pure-u-1-2|/img/2026-08-08-22-18-47.png" >}}

[1]: https://soju.im
[2]: https://sourcehut.org
[3]: https://daringfireball.net/linked/2026/07/25/birc
[4]: https://ircv3.net
[5]: https://ircv3.net/specs/extensions/message-tags.html
[6]: https://libera.chat/news/new-and-upcoming-features-3
[7]: https://birc.app/documentation/#filehost

[^1]: This is your username, not your nickname which is what distinguishes you
    from other users in the channel you join at any time.

{{% music %}}Joy Division • *She's Lost Control*{{% /music %}}
