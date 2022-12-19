---
title: "December in review"
date: 2022-12-19T10:33:05+01:00
draft: false
tags: ["readings"]
categories: ["2022"]
---
A quick summary of what I've read lately.

- I've been trying [codon][] recently. I didn't make extensive benchmarks on some of my numerical code, but it already looks like it could be really interesting to speed up some computation, or at least to have sane static type checking ahead of time.

- [GNU/Linux shell related internals][], by Viacheslav Biriukov, provides a very nice descritption of Unix shell, pipes & Co. I came across another good website about computing: [Beautiful Software][], which is Christopher Alexander's research initiative on computing and the environment.

> Ultimately, we want to help human intuition to do what it does best. That means people's interactions with computers should only help them to do what is needed, to inform them, to help them connect to the real world, and to draw their attention towards important things they've forgotten, and away from unimportant things they're too focused upon.

- People keep getting moving (GitHub, Twitter, Slack, etc.). Now, Gitea changed their mind and [Codeberg launches Forgejo][]. I'm still on GitHub since I only host hobby projects there, plus a couple of work-related shared and private repositories. I was interested in Codeberg or SourceHut at some point, but finally ended up staying on GitHub. However, I should probably jutst host my own RCS system.

- I still have a lot of Lisp and Scheme-related books to review (one of those reviews will probably end up on this blog by the end of the year), but in the meantime you may enjoy reading [The empty list][] by Tim Bradshaw. It's always a pleasure to read his articles on Lisp.

- The year of Linux on the desktop? [A Linux evening][] On a related note, the RAM used by [some of the common WMs][] on Linux is astonishing, e.g. KDE or Gnome, compared to lightweight solutions.

> The magic disappeared and our optimism has since faded. Our websites are slow and insecure; our startups are creepy and unprofitable; our president Tweets hate speech; we don’t trust our social media apps, webcams, or voting machines. And in the era of coronavirus quarantining, we’re realizing just how inadequate the Internet turned out to be as a home of Mind. --- [Where Did Software Go Wrong?][].

The above blog post somewhat reminds me of Niki Tonsky's [Software disenchantment][].

- [Algebraic Effects - You Can Touch This!][]: An interesting discussion on condition systems in CL.

- It's time for advent of code. I keep reading interesting blog posts on the subject. Here's one: [A Neat XOR Trick][], to find the first W-character window in which every character is unique in O(N) running time, with no dependence on the window size.

{{% music %}}Bauhaus • _Bela Lugosi's Dead_{{% /music %}}

[codon]: https://github.com/exaloop/codon
[GNU/Linux shell related internals]: https://biriukov.dev/docs/fd-pipe-session-terminal/
[Beautiful Software]: https://beautiful.software/
[Codeberg launches Forgejo]: https://blog.codeberg.org/codeberg-launches-forgejo.html
[The empty list]: https://www.tfeb.org/fragments/2022/12/16/the-empty-list/
[A Linux evening]: https://fabiensanglard.net/a_linux_evening/index.html
[some of the common WMs]: https://itvision.altervista.org/linux-desktop-environments-system-usage.html
[Where Did Software Go Wrong?]: https://blog.jse.li/posts/software/
[Software disenchantment]: https://tonsky.me/blog/disenchantment/
[Algebraic Effects - You Can Touch This!]: https://jacek.zlydach.pl/blog/2019-07-24-algebraic-effects-you-can-touch-this.html
[A Neat XOR Trick]: https://www.mattkeeter.com/blog/2022-12-10-xor/


