---
title: "Now using i3wm as a window manager"
date: 2021-09-08T09:14:47+02:00
draft: false
tags: ["unix"]
categories: ["2021"]
---

I decided to install the [i3 window manager](https://i3wm.org/) (WM) on my main Linux laptop, and use it as a replacement for Gnome default WM (Mutter). Gnome WM is fine, to be honest. It offers a clean UI, and a few handy keyboard shortcuts to manage windows and workspaces. If you want more fancy stuff in your menu bar, you need to install Gnome Shell Extensions, at least for Ubuntu. I believe Linux Mint comes with shell extensions enabled by default. Since my main usage of a desktop consists in using maximized applications on screen, or sometimes side by side applications like in a vertical split (e.g., for web dev I may want to have a browser right to my Neovim instance to have a live preview).

On my MacBook, I used to use [Amethyst](/post/amethyst-app/), which I configured to look like i3-gaps (i.e., i3 with inner and outer gap) because native apps look better with a bit of space around them especially when you cannot remove window border and/or titles. It worked great, until I switched to Linux. I was also using [Kitty terminal](/post/kitty-terminal/) (both on my MacBook and my Linux machine) and its handy multiplexing capabilities, notwithstanding its font ligature support and remote management facilities. When I decided to use default Gnome apps, I had to resort on [Tmux](/post/tmux-2021/) to manage my windows (the menu and tab bars in Gnome are just useless and take so much vertical space).

{{< fluid_imgs
  "pure-u-1-2|/img/2021-01-16-20-36-17.png"
  "pure-u-1-2|/img/2021-08-29-21-18-00.png" >}}

Back in the days when I was using Linux in 2004, I used to use a tiling WM as well. I recently installed i3 on my OpenBSD laptop, and it was great. So why not trying out i3 on this machine, and see if it can help improving my daily workflow?

Before I discuss my current setup, here's what I really need from a WM: (1) handy shortcuts to navigate around windows arranged automagically in a convenient layout, i.e. fullscreen or maximized, or in split view (mostly as side by side windows since I rarely need more than two windows); (2) easy navigation between workspaces, including the ability to send focused window(s) to new workspace; (3) low RAM consumption --- I don't really care about my RAM since I have 16 Go on my laptop, but I don't see why meeting the above requirements would need more than 100-200 Mo of RAM; (4) a scriptable setup, that is I want to have a plain text config file. I already spent a lot of time customizing Gnome, like adding Readline compat for Firefox or updating default colors, but I never found a clean way to that other than firing some command in a shell, like:

```shell
$ gsettings set org.gnome.desktop.background picture-uri ""
$ gsettings set org.gnome.desktop.background primary-color '#6e7f80'
$ gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"
$ cd /usr/share/gnome-shell/extensions/
$ sudo mv ubuntu-dock@ubuntu.com{,.bak}
```
<small>And of course you should not forget to reload Gnome Desktop afterwards (<kbd>ALT-F2, r</kbd>).</small>

Not to forget that I need to manually enter Hex codes using dialog box or color pickers and save my current color scheme for Gnome Terminal.

So, I'm back to Kitty terminal and to a tiling WM. As far as I am concerned I didn't have to read a lot of documentation or user config files to setup my WM. In fact, I added very few things to the bare defaults, which are already really good.

Below I show what I added to the default config:

```
# class                 border   backgr. text    indicator child_border
client.focused          #4c566a  #4c566a #ffffff #2e9ef4   #285577
client.focused_inactive #5f676a  #5f676a #ffffff #484e50   #5f676a
client.urgent           #2f343a  #ffb52a #222222 #900000   #900000

# Background jobs
exec_always --no-startup-id $HOME/.config/polybar/launch.sh
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork --image=/home/chl/Images/ilock.png
exec_always feh --bg-scale ~/Images/wp4627247-macos-mojave-wallpapers.jpg

# Take screenshot
bindsym Print exec "scrot '%Y-%m-%d-%H-%M-%S.png' --thumb 300x200 -e 'mv $m $f ~/Images'"
bindsym --release Shift+Print exec "scrot -s -e 'mv $f ~/Images/%Y-%m-%d-%H-%M-%S.png'"
bindsym --release Ctrl+Print exec "scrot -u -d 2 -e 'mv $f ~/Images/%Y-%m-%d-%H-%M-%S.png'"

bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev
```

A default session may look like what I show in the following screenshot:


{{< fluid_imgs
  "pure-u-1-2|/img/2021-09-08-11-12-26.png"
  "pure-u-1-2|/img/2021-09-08-11-13-15.png" >}}

The default menu bar once you launched i3 is kind of ugly, to say the least, but it can easily be customized to display only the information you want. I leave it below for posterity, but I definitely switched to polybar, see below:

```
general {
        colors = true
        color_good = "#a3be8c"
        color_bad = "#bf616a"
        color_degraded = "#d08770"
        output_format = "i3bar"
        interval = 1
}

order += "wireless wlan0"
order += "ethernet enx00e04c68005b"
order += "cpu_usage 0"
order += "volume master"
order += "battery 0"
order += "tztime local"

wireless wlan0 {
        format_up = "W: (%quality at %essid, %bitrate) %ip"
        format_down = "W: down"
}

ethernet enx00e04c68005b {
        format_up = "E: %ip"
        format_down = "E: down"
}

battery 0 {
        format = "%status %percentage"
        last_full_capacity = true
        low_threshold = 20
}

cpu_usage {
		    format = "CPU: %usage"
}

tztime local {
        format = "%d/%m %H:%M"
}

volume master {
    format = "♫ %volume"
	  device = "default"
	  mixer = "Master"
	  mixer_idx = 0
}
```

Enter [polybar](https://polybar.github.io/) which provides a lot of enhancements and allows for easy customization of the status bar. It comes with a lot of handy built-in plugins that can grab various informations from the system for you, e.g. CPU load and temperature, pulseaudio and ALSA sound controls, network status. External plugins are also available, like the [cmus-player](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/player-cmus) plugin which displays current song in a small interactive container (with right and left click enabled) in your status bar.[^1] This is what I settled upon finally, as you can see in the above screenshots. I started using the default config files, and ended up using the following pieces of modules:

```
modules-left = i3
modules-center =
modules-right = cmus system-usb-mount cpu temperature battery pulseaudio wlan eth date
```

So far I really like this new setup. It's still a bit crazy to have 3 ways of arranging windows on a screen --- tmux, kitty and i3 --- but in the end not having to worry about window placement and maximization and having simple keyboard shortcuts to navigate and move windows is a huge plus. Kudos to the i3 and polybar developers.

[^1]: Note that you can even use polybar itself to take a screenshot of your current config.
