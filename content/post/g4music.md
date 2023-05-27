---
title: "G4Music"
date: 2023-05-27T12:17:37+02:00
draft: false
tags: ["app"]
categories: ["2023"]
---

While browsing [deskto.ps](https://deskto.ps/u/oceane/d/dhlexn) I noticed a good looking music player, [Amberol](https://apps.gnome.org/fr/app/io.bassi.Amberol/). Unfortunately, it is only available as a Flatpak and it failed to compile on my machine because of a conflicting version of lib-gtk4-dev. Then, I came across [G4Music](https://gitlab.gnome.org/neithern/g4music), which is inspired by Amberol and comes with a bunch of additional features. Here it is in action:

![img](/img/2023-05-27-12-21-26.png)

Once dependencies were resolved (valac, meson, libgtk-4-dev, libadwaita-1-dev, libgstreamer1.0-dev, libgstreamer-plugins-base1.0-dev), the compilation and building stages took less than 30 seconds. This is the first time I use [Meson](https://mesonbuild.com/) as a build system and it looks really fast.

G4Music is presented as a low memory application, and a fast indexer of local music. Indeed G4Music found my 14k files when I first launched the application. I didn't test the drag'n drop support from Gnome file manager. The gapless and replay gain features work great. It makes use of embedded album cover art, without caching image thumbnails which is really a nice idea. We also get notifications in Gnome menu bar for free. Tracks can be sorted by album, artist or tracks, or souffle altogether. As I am writing this post, there's currently no play counts or option to manage custom playlists.

{{< fluid_imgs
"pure-u-1-3|/img/2023-05-27-12-38-00.png"
"pure-u-1-3|/img/2023-05-27-12-38-14.png"
"pure-u-1-3|/img/2023-05-27-12-38-23.png" >}}

The UI is really slick and useable, with minimal settings that are actionable in a few motions. If you are looking for a simple music player, give it a try. Overall, I like it a lot.

{{% music %}}New Order • _5 8 6_{{% /music %}}
