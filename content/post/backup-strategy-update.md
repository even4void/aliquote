---
title: "Backup Strategy"
date: 2012-12-01T15:28:04+01:00
draft: false
tags: ["apple"]
categories: ["2012"]
---

I just updated my backup plans for my Macbook Air.

Up to now, I was mainly relying on hard drive backup: with my previous Mac I used to use a 500 Go HD connected through Firewire 400, and now I am using a [Time Capsule](/post/back-to-time-capsule.md) again. Backups are done manually every two days approximately. I also have a [Dropbox](https://www.dropbox.com) account but it is mainly to store in the cloud some documents I don't use often, and occasionally share papers or text files with colleagues or friends. I also use Dropbox to store all image files that appear on this blog. I also expect it to serve as a gateway between two Macs: a Mac Mini at home, and my Airbook at work. I shall have more to say about this later.

Problem with local backup is that if the disk crashed or something bad happens at home (fire or whatever), everything is lost obviously. This has been discussed at length on the internet, e.g., one that I recently found [Backups and the Cobbler's Children](http://bc.tech.coop/blog/070503.html).

I decided to go to the cloud (which was what I did with my iDisk before Apple changed their policies) with [Amazon S3](http://aws.amazon.com/fr/s3/) services and [Arq](http://www.haystacksoftware.com/arq/) which I found thanks to [Chris Fonnesbeck](http://biostat.mc.vanderbilt.edu/wiki/Main/ChrisFonnesbeck) via Twitter.

{{% alert note %}}
<small>[2022-11-08]</small><br>
Unfortunately, the tweet with ID 265506509776093184 has been deleted.
{{% /alert %}}

Yet you have to pay for that, whether you exceed your S3 free storage (5 Go) or simply for the application; $29 for Arq remains affordable, though, and I don't plan to exceed my S3 Bucket. Arq is currently uploading my data to [Amazon Glacier](http://aws.amazon.com/glacier/), which according to the docs implies a 4-hour delay to get access to the data but at a reduced cost. I believe this is a fair trade for a simple backup of critical data that we would miss in case of total breakdown of our system.

![Arq](/img/20121201121140.png)

I took the opportunity during this winter cleaning to remove all emails from list servers from my Gmail account (19,849, 800 Mo approx.) and switched to Emacs [gnus](http://www.gnus.org) to read them from <http://news.gmane.org>.

![Gmail](/img/20121201113340.png)

My last Gmail cleanup is now more than [one year old](/post/cleaning-my-gmail.md). (I still don't like pie charts.) I realized that it is a waste of time and HD space to subscribe to 10+ list servers when you could simply browse them through simple CLI applications.

And here how it looks under Emacs:

![gnus](/img/20121201125654.png)
