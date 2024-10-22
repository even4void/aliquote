---
title: "mpd and ncmpcpp"
date: 2024-10-22T10:55:14+02:00
draft: false
tags: ["unix", "app"]
categories: ["2024"]
---

I recently gave [mpd](https://mpd.readthedocs.io/en/stable) a try for my music setup. I've been a long time user of Cmus which served me well. Before upgrading to Ubuntu 24.04, I used to use a fork which allow to show cover art in the notification menu bar (via MPRIS and D-BUS).[^1] I've tried several other alternative players, which all support displaying cover art by the way. Audacious and Gapless (formerly, G4Music) are really great with their minimalistic yet efficient UIs, but I guess I just want to stick to TUIs for the moment. Enter [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) which serves as a frontend to a running mpd server.

Clearly, mpd is a different beast. While I always appreciated the simplicity and usability of Cmus, and its speed as well, I must say that using a daemon to interact with my music library is something new to me. For instance, when I reboot my machine this morning, I was surprised to hear the song I started listening yesterday evening before I shutdown the machine. There's an option whihc I did not set properly, `restore_paused "yes"`, meaning mpd started playing its queue as soon as it was up and running. The good thing is that it is easy to manage the mpd daemon using a user unit via `systemctl`. MPd indexed my whole library (> 15k tracks) in a very decent amount of time. I tagged it using beats a long time ago, and I added proper tags manually since then, as well as many cover art, but I should definitively do this again, and clean up the duplicates thare spread across full album or disc sets and individual tracks in separate playlists.

I use [mpc](https://musicpd.org/clients/mpc/) to interact with mpd for low-level operations (toggle play/pause via system hotkey, display stats, etc.). It is a command-line application which  It would be great if I could integrate the 3 years of listening data gathered through Cmus someday. For the moment, it's just the beginning, and the stats are pretty dumb. And I still don't know if I will keep the same library structure which consists basically in a bunch of folder with artist/album and another set of folders with separate playlists, which seems silly after all although it was quite handy with Cmus.[^2]

```shell
» mpc stats
Artists:   3410
Albums:    4513
Songs:    18532

Play Time:    0 days, 1:38:32
Uptime:       0 days, 6:50:44
DB Updated:   Mon Oct 21 18:02:28 2024
DB Play Time: 55 days, 15:51:08
```

It is also possible to manage a "sticker" database, which is composed of added features specific to songs, albums or playlists, like play counts, ratings, comments and the like. This is specific to mpd and not all clients support it. However, I can imagine that populating a `playCount` field with data from Cmus could be interesting, in addition to an hourly shell script gathering information from mpg log files for current events.

The first time I launched ncmpcpp, I was a bit lost. With the default config, you end up on an empty window, which stands for the current playlist. Here, a playlist is just a set of tracks you selected to play in a row, and not a pre-recorded list of tracks in an m3u file. Like in Cmus, there are different windows or views that you can navigate using the {1-8,=} keys (if you compiled ncmpcpp with all available options). The browser (2) and media library (4) are the ones you want to explore first: the browser summarize your media library as seen on you hard drive, while the media library is much like the first view in Cmus, a tree view of your artist/album collection. At first, I used the 4th view to select albums to play. Once you click Enter, the whole album is added to the current playlist (1) and the first track starts playing. It was cumbersome as I keep adding different albums along the way, and the playlist kept growing. Fortunately, there's the C shortcut which allows to clean the current playlist. Then I learned that we can add tracks directly from the browser view (2) by pressing Space (instead of Enter). Finally, I learned that we can just populate `$HOME/.config/mpd/playlists` with m3u files, and I was good to go. I now feel at home since I got the same experience as in Cmus. Easy peasy.

In addition, things you get for free (no plugin, no additional configuration) with ncmpcpp: a playlist and tag editor, an FFT-based spectrum visualizer among other displays), the ability to stream live music from radio stations, information fetched from last.fm for artists or albums, cover art and lyrics support, dozens of keybindings to toggle cross-fading, replay gain, forward or backward seek, etc. Additionally, mpd provides logging facilities which allow to track your listening experience along the day -- nothing hardcoded in a binary database like is the case for Cmus and its track counts.

{{% music %}}Class Actress • _Weekend_{{% /music %}}

[^1]: You can use [mpDris2](https://github.com/eonpatapon/mpDris2) which provides similar facilities for mpd. It also comes with a user unit for systemd.
[^2]: Indeed, you just need to add a whole folder as a playlist (instead of manually adding track one after the other) and you're done.
