---
title: "Regolith Desktop"
date: 2022-02-02T20:48:05+01:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

Out of curiosity, I tried [Regolith Desktop] yesterday. I was looking at Pop OS for a long time before deciding on [i3] last year, mostly because Gnome shell and Gnome WM eat up too much memory to my taste, and because I was looking for a keyboard centric experience to manage and navigate my desktop environment. I must say that Regolith Desktop rocks!

Regolith Desktop is originally based on [i3-gaps], but it adds further keyboard centric and TUIs specific to i3. Above all, it comes with sensible default settings and its installation is a breeze. Just issue `sudo add-apt-repository pa:megalith-Linux/release && budo apt install megalith-desktop-standard` in your terminal and you're done after a reboot.

If you have an existing i3 configuration file, you can reuse (part of) it for Regolith, whose config files are located under `$HOME/.config/regolith`. The main config file is an `Xresources` file. Note that your own `$HOME/.Xresources` file is also read by Regolith at startup. Once you made some changes or update default settings, you can update the WM with `regolith-look refresh`. For instance, I changed the default font for the terminal and various other settings:

```shell
gnome.terminal.font     : JetBrains Mono 11
gnome.wallpaper         : $HOME/Media/Pictures/waves.jpg
i3-wm.font              : pango:JetBrains Mono Medium 10
i3-wm.gaps.inner.size   :	8
i3-wm.gaps.outer.size   :	5
i3xrocks.value.font     : JetBrains Mono Medium 10
rofi.font               : JetBrains Mono Medium 10
```

Not all i3 options are manageable from this file, though. You can copy the default config file from `/etc/regolith/i3/config` and update its settings under your own `regolith` directory.

Except that I didn't find any pleasant light theme for Regolith -- I currently use my beloved Nord theme -- the experience is close to what I was used to with my own i3 settings. I only tweak the default GTK theme so that Firefox is not using a dark theme as the default. And if I happen to get tired (again) of dark theme for the terminal and my editor, I can still switch back to Kitty since it uses its own color settings. I also disabled a lot of applets for the i3bar.

What I really like, though, is that all Gnome applications work as if you were using the default Gnome shell desktop, with a pretty GTK theme. Here's the default look'n feel of Gnome applications (here, the control panel):

{{< figure src="/img/2022-02-03-09-33-45.png" >}}

Gnome terminal nicely fits in the tiling framework (no menu bar, no title bar, etc.), and of course Tmux makes session and terminal management even easier:

{{< figure src="/img/2022-02-03-09-37-23.png" >}}

{{% music %}}Marianne Faithfull • _Crazy Love_{{% /music %}}

[Regolith Desktop]: https://regolith-linux.org/
[i3]: /post/i3wm/
[i3-gaps]: https://github.com/Airblader/i3
