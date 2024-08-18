---
title: "Ubuntu 24.04"
date: 2024-08-15T20:35:19+02:00
draft: false
tags: ["unix"]
categories: ["2024"]
---

I just installed and configured Ubuntu 24.04 LTS. This is the second dist upgrade I apply on the [same laptop](/post/welcome-ubuntu/). Everything went well but this time I wanted to polish things a bit, especially remove old artifcats from multiple upgrade while keeping all my [customizations](/post/how-to-do-without-wm/). By the way, the extensions I were using (Tactile and Simply Workspaces are now useless with the new features introduced in Gnome desktop).

I won't comment about the new Desktop, WM or app UI, there's already a good deal of information on the web. It's pretty slick as far as I can tell (e.g., Nautilus or the desktop menu bar). However, I should note that Ubuntu mono font now looks quite crappy in a Terminal. Since I downloaded the Nerd font equivalent a while ago, I switched to that temporarily (I know nostalgics can get the "legacy" font from a package). What follows is is merely an installation log.

After updating all packages installed on my laptop, I ran the classical `do-upgrade-release -d` at the shell prompt. This didn't work. First, there appeared to be some problem with custom PPAs. I started to remove them one by one then forgot a leading asterisk which removed them altogether. A good start to say the least... Afterwards, there still was a pending issue with postgresql-12 (which may date from the 20.04 release?). Finally, the dist upgrade went fine, although some packages like texlive highlighted minor errors while some other packages were forcibly removed.

Upon rebooting the system, my plan was to remove packages tagged jammy (obs-studio), remove packages installed from custom PPA, check orphaned packages if any and record packages with residual config files for further investigation. It took me a few more minutes.

I deleted old Linux kernels (headers and images), totalling 640 Mo on my HD! I used a [shell script](https://askubuntu.com/a/1315976) slighty adpated from SO.

```shell
» dpkg --list | grep linux-headers
ii  linux-headers-5.15.0-118                       5.15.0-118.128
ii  linux-headers-5.15.0-118-generic               5.15.0-118.128
ii  linux-headers-5.19.0-50-generic                5.19.0-50.50
ii  linux-headers-6.5.0-45-generic                 6.5.0-45.45\~22.04.1
ii  linux-headers-6.8.0-40                         6.8.0-40.40
ii  linux-headers-6.8.0-40-generic                 6.8.0-40.40
ii  linux-headers-generic                          6.8.0-40.40
ii  linux-headers-generic-hwe-22.04                6.8.0-40.40\~22.04.3
```

Next, I wanted to get ride of resiudal config files from uninstalled packages. For whatever reason (e.g., packages flagged as manually installed), even all packages were supposed to be "purged" and "autoremoved" from the system, there remained dozens of such files.

I listed all relevant packages as follows:

```shell
dpkg --get-selections | grep 'deinstall$' | cut -f1
```

I then tried to pipe this list to `xargs sudo apt --yes purge` but I got stuck in the middle of a dialog box asking whether I really wanted to delete everything from Postgresql 12. Shortly after C-c'ing and killing the whole process, dpkg was no longer working. I reconfigured dpkg and then all packages were flagged as purge and not deinstall this time. I finally was able to cleanup everythign and checked that I got the same number of installed packages as highlighted by neofetch:

```shell
sudo dpkg --configure -a
dpkg --get-selections | grep 'purge$' | cut -f1
sudo apt clean && sudo apt autoclean && sudo apt autoremove
dpkg --get-selections | wc -l
```

I also cleaned up `/usr/share/applications` and `$HOME/.local/share/applications` for unused desktop entries, my `/opt` directory full of application for testing purposes, and a bunch of unused software.

I still need to filter out broken executables installed by Python in $HOME/.local/bin (e.g., streamlink), install nodejs, npm and yarn, and handle software that were installed via custom PPAs (e.g., Racket). Also, I would need to review log files in `/var/log/dist-upgrade` to see if I missed something.

```shell
» neofetch
OS: Ubuntu 24.04 LTS x86_64
Host: Latitude 7310
Kernel: 6.8.0-40-generic
Packages: 3623 (dpkg), 17 (flatpak)
Shell: zsh 5.9
Terminal: alacritty
CPU: Intel i7-10610U (8) @ 4.900GHz
```

### Sidenote

- Alacritty 0.13 is available via apt. However I encountered some issue with the mouse pointer that disappeared from sight when above window, so that I reinstalled version 0.14-dev from GitHub that I compiled last week.
- There's a new version for Cmus available in Ubuntu repos, still without album art support; I reinstalled my old fork, messed up with various GH clones (including one which used to work, and then I deleted everything. I'll see how to bring album art back in my notification popup if I really miss that.
- Newsboat not available in official repos, don't know why, but there's a deb package for 23.10 and apparently a snap package for the current relese. Hey, I don't want to use Snap, I removed it from my laptop two releases ago already!
- Now got NeoMutt 20231103, which is a 4 yr.bump (latest version in 22.04 dated back to 2019 if I remember correctly). Got some issues with my color definition but this was [easily fixed](https://github.com/neomutt/neomutt/issues/4095).
- Tmux 3.4 works as expected.
- swayimg no `--gallery` option with current version from apt, while the version I compiled from the master branch on GitHub works fine.
- Zathura is working fine with poppler as a PDF backend; should install mupdf backend but got stuck with dependencies (it would require mupdf > 1.19, and when I checkout the latest tag which accepts mupdf I got another conflict with a now defunct library). For the moment, I will use Foliate for Epub. And I realized that using a single app for all publication formats isn't very realistic. After all, Evince is able to open PS and DVI files, while Zathura needs a plugin for Postscript and can't open DVI file.


{{% alert note %}}
<small>[2024-08-17]</small><br>
As advised on [Linux Mint Forums](https://forums.linuxmint.com/viewtopic.php?t=426783), you can just install the latest available deb package (23.10 Mantic), and it works right out of the box.
{{% /alert %}}


Oh, I forgot to say that Minecraft is still working ;-)

{{% music %}}Tindersticks • _See my Girls_{{% /music %}}
