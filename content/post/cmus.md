---
title: "Cmus"
date: 2021-09-17T20:26:30+02:00
draft: true
tags: ["unix", "app"]
categories: ["2021"]
---

I've been using [cmus]() as my main music for almost a year and I am pretty happy with it. It has a low memory fingerprint, and it easily parses large database of MP3. Of course, it is a lot different from Apple's own music player, iTunes, which I used to love before they made so many updates to the app that it no longer resembles the app it was ten years ago. Cmus is simple, yet powerful.

I also tried [mpv]() and [VLC](). VLC is fine but I mostly use mpv to watch videos or Youtube downloads on my computer. I even have a script, called `playme`, to launch a playlist in the background:

```shell
#!/bin/sh

case "$1" in
  kitty)
    kitty @ launch --type tab --tab-title "mpv" mpv --shuffle --no-audio-display ~/Media/Music/Jazz\ Chill
    ;;
  term)
    mpv --shuffle --no-audio-display --no-terminal  ~/Media/Music/Jazz\ Chill
    ;;
  *)
      echo "Usage: $0 {kitty|term}"
      exit 2
esac

exit 0
```

It works fine to just launch 12 hours of music in the background and get back to work. I also found a little script that helps to display the current song in my status bar (which actually is a customized [polybar](/post/i3wm.md)). Likewise I have a script to display the current track from cmus, with interactive mouse actions (stop, skip forward/backward in playlist).
