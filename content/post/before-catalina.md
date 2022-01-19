---
title: "Before Catalina"
date: 2020-04-02T16:38:20+02:00
draft: false
tags: ["apple"]
categories: ["2020"]
---

Yesterday or the day before (I tend to forget which day we are after those 15 days of confinment), I learned that [ssh got broken](https://tyler.io/so-uh-i-think-catalina-10154-broke-ssh/) after the last update to macOS Catalina (10.15.4). That's quite unfortunate for those working at home and who need remote access to their own servers or the ones from their paid job. This is not the first time Apple breaks something or simply removes a feature that was otherwise perfectly working. I can think of telnet or ftp for the most recent ones.

> This was a good read. Meanwhile, things have changed a bit on OS X: the ftp command no longer exists in High Sierra, the X11 server has been replaced by XQuartz, and much more. But I guess the next iteration of OS X will come with new UI and core planning policies. --- [Learning Unix for OS X](/post/learning-unix-for-os-x/), February 2018

As many other users I decided to stay on [Mojave](/post/osx-mojave/) --- which I like anyway (despite the fact that it doesn't bring many visual enhancements compared to the preceding version of macOS), when I saw that everybody was complaining about the deluge of [notifications](https://tyler.io/macos-10-15-vista/) and [apps or permissions](/micro/2019-10-28-13-15-02/) issues (plus additional issues regarding the installation of scientific packages that I need for my work). I deactivated the automatic updates when I got my current Macbook, and the gentle reminder to upgrade to Catalina disappeared some time ago (maybe I deactivated it too, I don't remember). At this point, I think this is my definitive setup for the next years to come. I just hope that nothing will break until Apple next release. If they do persist in delivering OSs that just suck, I will have to go back to a Linux of some kind. But I remain optimistic. After all, we got some good surprises along the years.

{{% alert note %}}
<small>[2022-01-19]</small><br>
So be it. [Welcome Ubuntu](/post/welcome-ubuntu/).
{{% /alert %}}

Anyway, I keep updating every package I installed via Homebrew, but I find it a bit boring at time. Why do we need to get a minor update every week, literally? Is this the result of agile development? I do not even speak of software available through Github. Or maybe this is just me, who just happened to spend a fair amount of my time compiling and linking esoteric programs for bioinformatics stuff. Believe it or not, I had to reconfigure my CPAN local folder to use a [tiny program](http://mitf.cbrc.jp/MitoFates/cgi-bin/top.cgi) a few months ago.

I like that it is still possible to [run R 1.0](https://twitter.com/revodavid/status/1243621843023450112?s=20) after 20 years, like the fact that [Common Lisp programs](https://twitter.com/RainerJoswig/status/1220457695414771714?s=20) written more than 20 years ago are still working fine on modern hardware. This is what bothers me with new languages (e.g., Julia; the "new" or "modern" or "tidy" R): we are forced to live somehow on the bleeding edge, to update frequently, and to experience backward compatibility issues soon or later. The solution appears quite simple, for me at least, since I could also freeze the set of tools I used to use (R, Python, C, Lisp/Scheme, Mathematica, Stata, Emacs, Zsh and all the Unix goodies). This reminds me of a recent interview with [Nils M Holm](https://usesthis.com/interviews/nils.m.holm/), who uses quite of an arcane set of tools (and I don't even speak of the look'n feel of his [website](http://t3x.org)!):

> Most probably got it cheap from a used parts dealer. It is underclocked to 750MHz, because that is all I need. Honestly, I could do 99% of my work on a 16MHz 286 box without any significant loss of productivity.<br> Just to prove the point, I sometimes write texts and programs on my Amstrad NC100 notepad computer. That is a 4MHz Z80-based CP/M machine with 64KB of RAM, and it really feels quite snappy.

Anyway, I'll probably continue with my current configuration for a few more years; and who know: by then we'll have a new improved version of the modern R and the successor to VS Code. Long live the Unix shell!

![shell](/img/2019-10-28-16-27-34.png)
