---
title: "Rhythmbox"
date: 2022-06-11T17:59:02+02:00
draft: false
tags: ["app", "unix"]
categories: ["2022"]
---

I've been a faithful user of [cmus] for the past two years. It is fast and responsive, it handles tons of music with no worries, and it is quite easy to configure. Using [cmusfm], we can even scrobble the tracks we listen to to Last.fm, and it all works great.

Since I upgraded to Ubuntu 22.04 LTS I decided to try another music player. I've been trying Audacious on i3, but that's was just to try it out. Last week, I decided to give Rhythmbox a try. I think it should normally be instaled on a full-featured Ubuntu distro, like Libreoffice, Thunderbird and the like. Since I decided to install the bare essentials, I don't have default application for managing media files on Ubuntu.

{{% alert note %}}
<small>[2022-09-29]</small><br>
TIL about [Lollypop](https://wiki.gnome.org/Apps/Lollypop) (via [Reddit](https://www.reddit.com/r/linux/comments/8kmero/linux_needs_a_really_good_music_player/)), which also seems to handle metadata quite well, and provides audio scrobbling facilities. There apparently is the [Sayonara player](https://sayonara-player.com/) in the race as well.
{{% /alert %}}

I imported my main libraries into Rhythmbox with no problem at all. All tracks were correctly classified by author/album/genre apparently. I could check with [beets], except that it no longer works since I switched to Python 3.10. I then created new playlists using the following command, for each playlist folder:

```shell
~/Media/Music/garbage % find . -name "*.mp3" -type f | shuf > garbage.m3u
```

I activated the Last.fm plugin and installed (later on) the [LastfmPlaycount] 3rd party plugin. This allows me to get a synchronized view of my lsitening activities from Last.fm, which also means I would get desynchronized track counts when switching back and forth between cmus and Rhythmbox, unless I found something equivalent for cmus. Anyway, I've been using Rhythmox as my daily music player for two weeks now, and I'm pretty happy with it. The current song that is being played is nicely displayed in the notification widget in the middle of the top bar (I forgot about its name), with basic control (start/pause, previous/next track, and the album cover). Same happens when using Rhythmbox: you get a small album cover art that you can hover on, classification by genre, artist, and so on. Everything you would expect from a basic music player in fact.

The advantage of usign Last.fm to get my track counts is that it doesn't matter whether some tracks are included on more than one playlists, unlike cmus whose playcount is really a physical track count. In other words, I'm seeing an increase in my all-time playcount as I write this post. Meanwhile, I'm slowly updating track counts by listening to my music library again and again. Not a bad deal after all.

{{< fluid_imgs
"pure-u-1-2|/img/2022-06-12-20-55-54.png"
"pure-u-1-2|/img/2022-06-12-20-38-51.png" >}}

{{% music %}}Timo Lassy • _Mountain Man Exit_{{% /music %}}

[cmus]: https://cmus.github.io/
[cmusfm]: https://github.com/Arkq/cmusfm
[beets]: https://beets.readthedocs.io/en/stable/
[lastfmplaycount]: https://github.com/BramBonne/LastfmPlaycount
