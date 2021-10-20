---
title: "My current music setup"
date: 2021-10-20T18:53:14+02:00
draft: false
tags: ["self"]
categories: ["2021"]
---

I am now scrobbling music I listen to on my laptop to [Last.fm](https://www.last.fm/user/even4void). Cmus has a [small plugin](https://github.com/Arkq/cmusfm) for that purpose, and it works great. I like the idea of archiving everything I listen to and get statistics at a glance from Last.fm. This partly results from my attempt to move away from Apple services, like Apple Music, even if I'm still using it (I have a paid subscription) from times to times, and to get my music back on my HD. I used to have several gigs of music back in the day, and then online services came along, including Deezer or Apple Music. If you're happy with the idea of renting your music (or movies), that's probably okay. These are two of the top music streaming providers available on the market.[^1] I discovered [Bandcamp](https://bandcamp.com/) three years ago, thanks to Tom Macwright, and I am now browsing the indie records available there, especially in the alternative and Jazz sections.

Regarding my current setup, here is how I do on my laptop and at home. On my laptop, I discussed [Cmus](/post/cmus/) in a previous post, and since then I use it almost every single day. I use [abcde](http://lly.org/~rcw/abcde/page/) to rip my audio CDs (I found it easier to use and a little bit faster than iTunes own converter); the only minor problem is that I often have to retag some tracks or entire albums afterwards using `id3tag`. This is somewhat cumbersome, but that's not a big deal since it can be automated easily using shell scripts. I have something like 300 audio CDs, and as many vinyl records. I am now focusing on enriching my vinyl collection since I am no longer interested in audio CDs. (I haven't even reconnected my CD player since I moved.)

{{< fluid_imgs
  "pure-u-1-3|/img/IMG_1744.JPG"
  "pure-u-1-3|/img/IMG_1743.JPG"
  "pure-u-1-3|/img/IMG_1745.JPG" >}}

I use a single Bluetooth JBL 3D audio speaker, which I activate using `bluetoothctl` most of the time. I wrote a shell script to automate the connection, but I always forget about it --- I should probably add it to my polybar at some point. The sound is acceptable, and I can bring the audio speaker to my office if I want since it does not take too much space.

My home setup is also quite simple, basically an amp, a DAC, an Apple TV, a record player and a pair of speakers (see picture above). I use the Apple TV to stream music from Apple Music (on my Macbook or my iPhone) eto the physical devices, via the Digital to Analog Converter. In the end I will probably transfer all my MP3s onto a NAS or an external drive available on my home network. And that will be fine I guess.

[^1]: I stopped using Deezer a long time ago because I couldn't get my playlist last more than one year because of regular removal of tracks I added in the past (due to copyright issue or author's removal, probably).
