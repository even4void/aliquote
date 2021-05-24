---
title: "Timeshift for system backup"
date: 2021-05-21T10:36:25+02:00
draft: false
tags: ["unix", "app"]
categories: ["2021"]
---

I did a brief review on existing solutions for incremental rotating backup in Ubuntu. I came across Dirvish after looking at a [short presentation](https://sanctum.geek.nz/presentations/incremental-backups-dirvish.pdf) (PDF) made by Tom Ryder, but I don't know if it's still being used (it looks like a pretty old project after all) and I finally stumbled upon [Timeshift](https://github.com/teejee2008/timeshift).

As highlighted by Tom Ryder, manual or homemade backups can be handled using a combination of `rsync` and `cron`, both ensuring the incremental and differential aspect of backup. However, neither do protect from limited space available on various external HD. An alternative solution relies on the ext4 filesystem, which supports hard link: contrary to symlink (`ln -s`), the idea would be to hard link all references to a single copy of, say, a file or a kernel image. This is where [Dirvish](https://dirvish.org/) comes into play, but also Timeshift, since they both allow rotating backups based on hard linking the system files (and not the user directory). Timeshift can also leverage [BTRFS](https://en.wikipedia.org/wiki/Btrfs) filesystems which allows for snapshots. The TL;DR is "backup your whole computer except the user directory".

Until now I always did my backup on external HD using either Arq (on macOS) or plain `rsync` (macOS + Linux/OpenBSD). I usually archive my `$HOME` folder only, every week or so. I always thought I would reinstall the whole OS itself if something gets wrong, and I never care about backing up system files themselves. On macOS, this means losing everything sitting under `/usr/local`, but that's not a big deal since this is usually something that was managed by Homebrew. Of course, we need to take care of hidden files but also `$HOME/Library`, and this soon became a nightmare because the latter depends on installed applications and it consists of a mix of config files, cache informations, and application data (e.g., Messages, Mail, etc.). I wish there was a clear separation between data and config files under OS X, but this never happened. In sum, it was (and it's probably still true) impossible to keep our `$HOME` folder a perfect Linux or BSD-like user directory.

When I started using Ubuntu as a replacement to macOS Mojave, there was no big deal with the OS itself, since I used to use Linux before switching to OS X.[^1] I started backing up my personal files using rsync, on an external 2 To USB3 HD. In fact I'm using [Déjà Dup](https://launchpad.net/deja-dup) to backup my personal files. Timeshift doesn't backup the `$HOME` directory directly, but instead the whole filesystem + `$HOME` dot files. According to the documentation:

- Unlike similar tools that are scheduled to take backups at a fixed time of the day, Timeshift is designed to run once every hour and take snapshots only when a snapshot is due.
- Creating a hard-linked copy may seem like a good idea but it is still a waste of disk space, since only files can be hard-linked and not directories. Timeshift avoids this wastage by using tags for maintaining backup levels. The snapshot location will have a set of folders for each backup level ("Monthly", "Daily", etc) with symbolic links pointing to the actual snapshots tagged with the level.

The rationale is that if you ever need to rollback your system, it is likely that your personal files will have changed and the backup files would overwrite them --- which is why I always made a separate backup for the OS and my personal files after all.

To sum up it looks like Timeshift would be a good addition to my backup strategy and I should probably give it a try for real.

[^1]: And let's face the fact that Linux was far less friendly 15 years ago. I'm thus quite happy with Ubuntu 20.04, to be honest.
