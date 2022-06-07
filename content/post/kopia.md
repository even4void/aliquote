---
title: "Kopia backup"
date: 2022-06-05T20:36:43+02:00
draft: false
tags: ["unix", "app"]
categories: ["2022"]
---

For everything related to backup I used to use [Arq] back in my Apple days. I tried Borg on both Apple and Ubuntu, and I also tried [Timeshift], but finally I decided to use Duplicity and deja-dup for my weekly backup on Ubuntu 20.04. It worked well, although the cache files took a lot of place. At that time I was backing up my entire `$HOME` system on an external HD connected on an USB-C port. I didn't add a cron task for that and I managed to launch the backup process more or less carefully every Sunday.

A week ago, I deleted my `~/.local/share` folder by mistake. Fortunately, I was able to recover everything thanks to those weekly backups. However, the only way to recover this specific folder from Duplicity snapshots was to extract the full snapshot in a temporary folder and stopped the extraction process when I noticed that the folder in question was extracted. I was in a hurry, there may be a better option or better tool to use than deja-dup. Unlike Arq, there does not seem to be an easy way to view the inner structure of each snapshot.

Yesterday, I decided to give [Kopia] a try. It uses deduplication, compression, encryption --- all the state of the art in terms of backup strategies. Moreover it allows to list all snapshots, mount them on your local filesystem, diff one snapshot against the other, and restore any snaphot with a few commands or via a nice GUI ([Kopia UI]). Of course, you can set exclusion rules, schedule how often snapshots are taken, and so on. Finally, you can synchronize your local backup with other sources, like an external HD or a local home server. I choose to backup my HOME directory on my HOME directory, and to synchronize it to an external HD, while previously I only use external HD to store my backup. This way, I have a local copy from which I can restore anything if something goes wrong -- no need to take my external HD with me, and I use deduplication with the sftp transfer protocol. The documentation is also excellent, and there's a [Discourse] group.

One thing I noticed is that it is blazing fast, especially compared to deja-dup.[^1] I excluded static folders which are unlikely to change more than once a week (pictures, music, and PDFs) and I ended up with a 30 Go backup repository.

```shell
% du -sh ./* | sort -h
364K    ./bin
1,7G    ./tmp
2,1G    ./Sites
6,0G    ./cwd
6,9G    ./Documents
18G     ./Images
33G     ./backup
74G     ./Media
```

I'm aware of the [3-2-1] backup strategy, except that I no longer use any offsite storage (Dropbox or Google, previously). I'm expecting to setup a central backup on a NAS, and a local copy on an external HD. I also have a cron job to schedule backup every hour, with default retention policy (48 hourly snapshots are kept in the central repository).

It all looks very promising. I'm waiting to see what happens next, especially in case of accidental deletions or corruptions.

{{% music %}}Washed Out • _Amor Fati_{{% /music %}}

[^1]: Backups to a local SSD are expected to be faster than backups whose destination is an external HD, though.

[arq]: https://www.arqbackup.com/
[timeshift]: /post/timeshift-backup/
[kopia]: https://kopia.io/
[kopia ui]: https://kopia.io/docs/release-notes/v0.9/#ui-changes
[discourse]: https://kopia.discourse.group
[3-2-1]: https://www.backblaze.com/blog/the-3-2-1-backup-strategy/
