---
title: "Kopia backup"
date: 2022-06-05T20:36:43+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

For everything related to backup I used to use [Arq] back in my Apple days. I tried Borg on both Apple and Ubuntu, and I also tried [Timeshift], but finally I decided to use Duplicity and deja-dup for my weekly backup on Ubuntu 20.04. It worked well, although the cache files took a lot of place. At that time I was backing up my entire `$HOME` system on an external HD connected on an USB-C port. I didn't add a cron task for that and I managed to launch the backup process more or less carefully every Sunday.

A week ago, I deleted my `~/.local/share` folder by mistake. Fortunately, I was able to recover everything thanks to those weekly backups. However, the only way to recover this specific folder from Duplicity snapshots was to extract the full snapshot in a temporary folder and stopped the extraction process when I noticed that the folder in question was extracted. I was in a hurry, there may be a better option or better tool to use than deja-dup. Unlike Arq, there does not seem to be an easy way to view the inner structure of each snapshot.

Yesterday, I decided to give [Kopia] a try. It uses deduplication, compression, encryption --- all the state of the art in terms of backup strategies. Moreover it allows to list all snapshots, mount them on your local filesystem, diff one snapshot against the other, and restore any snaphot with a few commands or via a nice GUI ([Kopia UI]). Of course, you can set exclusion rules, schedule how often snapshots are taken, and so on. Finally, you can synchronize your local backup with other sources, like an external HD or a local home server. I choose to backup my HOME directory on my HOME directory, and to synchronize it to an external HD, while previously I only use external HD to store my backup. This way, I have a local copy from which I can restore anything if something goes wrong -- no need to take my external HD with me, and I use deduplication with the sftp transfer protocol. The documentation is also excellent, and there's a [Discourse] group.

One thing I noticed is that it is blazing fast, especially compared to deja-dup.[^1] I excluded static folders which are unlikely to change more than once a week (pictures, music, and PDFs) and I ended up with a 30 Go backup repository.

```shell
~ % du -sh ./* | sort -h
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

```shell
~ % kopia snapshot list
chl@aliquote:/home/chl
  2022-06-05 19:05:21 CEST k295d3d6f42eeb3fa08c5d47e58af91bf 58.4 GB drwxr-xr-x files:504927 dirs:73697 (hourly-17,daily-3,weekly-2)
  2022-06-06 20:22:20 CEST k96b2fb21131fbbfc0815dd5fb373a763 44 GB drwxr-xr-x files:506393 dirs:73202 (hourly-16)
  2022-06-06 21:00:02 CEST kf916e1b0c60fa4f409a42684fb93019a 44 GB drwxr-xr-x files:506629 dirs:73202 (hourly-15)
  2022-06-06 22:00:01 CEST k728bb034a39a4ff650182b3059d49991 44 GB drwxr-xr-x files:506712 dirs:73203 (hourly-14)
  2022-06-06 23:00:01 CEST k5f4017166b44946ca6259a4ae17f1e38 44 GB drwxr-xr-x files:506714 dirs:73203 (hourly-13,daily-2)
  2022-06-07 00:00:01 CEST kbf3b9941f81be51b1165cfb6806b4251 44.1 GB drwxr-xr-x files:506716 dirs:73203 (hourly-12)
  2022-06-07 01:00:01 CEST k97b62af55128160101b828d76e26256c 44.1 GB drwxr-xr-x files:506718 dirs:73203 (hourly-11)
  2022-06-07 02:00:01 CEST k39386d816ded10cbc656a2e4c161e1bc 44.1 GB drwxr-xr-x files:506720 dirs:73203 (latest-10,hourly-10)
  2022-06-07 03:00:01 CEST kc012f6b2bf5e8678e89b5d891603a168 44.1 GB drwxr-xr-x files:506722 dirs:73203 (latest-9,hourly-9)
  2022-06-07 04:00:01 CEST k8947a49d41f253dd2938d29ffbd7f1a3 44.1 GB drwxr-xr-x files:506724 dirs:73203 (latest-8,hourly-8)
  2022-06-07 05:00:02 CEST ka91ca4f30e5411edfa2ff196a4e0905f 44.1 GB drwxr-xr-x files:506726 dirs:73203 (latest-7,hourly-7)
  2022-06-07 06:00:01 CEST k19705c3b296d13670f0cc9ac7e91ffb5 44.2 GB drwxr-xr-x files:506728 dirs:73203 (latest-6,hourly-6)
  2022-06-07 07:00:02 CEST kadc58cb442efbd727441de745cbebd13 44.2 GB drwxr-xr-x files:506730 dirs:73203 (latest-5,hourly-5)
  2022-06-07 08:00:01 CEST kdb87258b93ae8e3d3d83ac5a4d281426 44.2 GB drwxr-xr-x files:506973 dirs:73244 (latest-4,hourly-4)
  2022-06-07 10:00:01 CEST k7d9b1c6f0d746e9b9ffdb63011299a2c 44.2 GB drwxr-xr-x files:507123 dirs:73244 (latest-3,hourly-3)
  2022-06-07 11:00:01 CEST k22b5115235d9dceb0ec9f204be6e3ae7 44.3 GB drwxr-xr-x files:507782 dirs:73254 (latest-2,hourly-2)
  2022-06-07 12:00:01 CEST k7dc38129e4011ef6c0e870e220094459 44.3 GB drwxr-xr-x files:507743 dirs:73229 (latest-1,hourly-1,daily-1,weekly-1,monthly-1,annual-1)
```

It all looks very promising. I'm waiting to see what happens next, especially in case of accidental deletions or corruptions.

{{% alert note %}}
<small>[2022-08-25]</small><br>
Small update: I effectiveley had to use Kopia to restore some files that were accidently deleted, and to compared two directories at different points in time. The latter is made really easy thanks to the <code>diff</code> utility inside Kopia. Also, after two months of daily backup, I came to the conclusion that compression (zstd or pgzip) is not that good as it consumes a lot of RAM and keep RAM cache increasing when your backup are schduled on an hourly basis. Finally, to keep your backup repository at a reasonable size don't forget to set up appropriate exclusion rules using <code>kopia set policy</code>.
{{% /alert %}}

{{% music %}}Washed Out • _Amor Fati_{{% /music %}}

[^1]: Backups to a local SSD are expected to be faster than backups whose destination is an external HD, though.

[arq]: https://www.arqbackup.com/
[timeshift]: /post/timeshift-backup/
[kopia]: https://kopia.io/
[kopia ui]: https://kopia.io/docs/release-notes/v0.9/#ui-changes
[discourse]: https://kopia.discourse.group
[3-2-1]: https://www.backblaze.com/blog/the-3-2-1-backup-strategy/
