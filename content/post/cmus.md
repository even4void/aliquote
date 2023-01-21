---
title: "Cmus"
date: 2021-09-17T20:26:30+02:00
draft: false
tags: ["unix", "app"]
categories: ["2021"]
---

I've been using [cmus](https://cmus.github.io/) as my main music for almost a year and I am pretty happy with it. It has a low memory fingerprint, and it easily parses large database of MP3. Of course, it is a lot different from Apple's own music player, iTunes, which I used to love before they made so many updates to the app that it no longer resembles the app it was ten years ago. Cmus is simple, yet powerful.

I also tried [mpv](https://mpv.io/), which I consider as the best CLI tool for multimedia files after [ffmpeg](https://ffmpeg.org/) --- and not only because Glen Gould is on the cover, and [VLC](https://www.videolan.org/vlc/). VLC is fine but I mostly use mpv to watch videos or Youtube downloads on my computer. I even have a script, called `playme`, to launch a playlist in the background:

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

It works fine to just launch 12 hours of music in the background and get back to work. I also found a little script that helps to display the current song in my status bar (which actually is a customized [polybar](/post/i3wm.md)). Likewise I have a [script](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/player-cmus) to display the current track from cmus, with interactive mouse actions (stop, skip forward/backward in playlist). It looks like it is easier to manage cmus state thanks to `cmus-remote` which handles most of the actions we expect from a mini player. See also [Workflow Optimization Part 3: Sidekick Programs for i3](https://gideonwolfe.com/posts/workflow/sidekickprograms/) for a solution similar to mine.

There's a lot more to see with [cmus extensions](https://github.com/cmus/cmus/wiki).

{{% alert note %}}
<small>[2023-01-21]</small><br>
Should you want to fetch music directly from Youtube, you can use the [following hack](https://github.com/invicnaper/cmus-youtube). You will likely need to install a bunch of additional libraries on Ubuntu, but it works fine. This may help developing additional command to fetch music from external provider (e.g. Bandcamp, or [online radio](/micro/2022-10-27-21-32-49)).
{{% /alert %}}

![cmus](/img/2021-09-18-20-27-54.png)
