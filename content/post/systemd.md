---
title: "Migrating to Systemd"
date: 2022-08-22T14:37:44+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

I've been faithfully using cron jobs on Linux for twenty years now. It's quite simple to schedule basic tasks using `crontab -e`: simply write your shell script or call the application you want to run at a desired time, and then forget about it. Currently, I only have two crontab entries running: one for checking my mail (`mbsync`), and the other for [Kopia] hourly backup. Most Linux distros now favor the use of systemd schedulers, also called "timers", instead of cron, and so I decided to move all my running jobs to systemd.

One of the advantages of using systemd is that you can move your systemd files between your machine or over ssh. The other advantage, of course, is that you can manage your running jobs using `systemctl`, which means you can stop or pause tasks at any time, or reschedule a timer easily. Finally, you can check when your task were run for the last time, and when they will be run next.[^1]

As an example, consider the following cron task, which runs Kopia backup every hour on my machine:

```shell
0 * * * * kopia snapshot create --all
```

To use systemd, you need two files in `$HOME/.config/systemd/user`. Let's call them `kopia-backup.service` and `kopia-backup.timer`. Here's the content of the service file:

```
[Unit]
Description = Back up files using Kopia

[Service]
Type = oneshot
ExecStart = /usr/bin/env bash -c 'kopia snapshot create --all'

[Install]
WantedBy = default.target
```

This basically tells to run the service once (`oneshot`) using the command specified as in the above crontab entry. The `default.target` has to do with unit dependencies, but this may be omitted in our case. For the timer file, the most important setting is the schedule, which differs slightly from cron syntax:

```
[Unit]
Description = Run kopia-backup every hour
RefuseManualStart = no

[Timer]
Persistent = true
OnCalendar = *-*-* *:00:00
Unit = kopia-backup.service

[Install]
WantedBy = timers.target
```

The `Persistent` option informs systemd to launch the task if it was missed the last start time because of some failure to run the task (e.g., system on sleep or done), much like anacron. There are also so-called monotonic timers, which just indicate how often a task should be run, not at what time precisely. This usually is performed with reference to system startup, using e.g., `OnStartupSec=`. NOte that both approaches can be interleaved, and the task will run whenever of the two timers occur. By default, timers in systemd have an accuracy of 1 minute, but you can ask for a more tight schedule, for instance `AccuracySec = 1us`.

Here is a brief summary of most common settings for the scheduler:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Timer</em></td>
<td><em>Description</em></td>
</tr>
<tr><td><kbd>*:*:00</kbd>*</td><td>every minute</td></tr>
<tr><td><kbd>*:/30:00</kbd>*</td><td>every 30 minute</td></tr>
<tr><td><kbd>*-*-* *:00:00</kbd>*</td><td>every hour</td></tr>
<tr><td><kbd>*-*-* */3:00:00</kbd>*</td><td>every three hour</td></tr>
<tr><td><kbd>*-*-* 00:00:00</kbd>*</td><td>every day</td></tr>
<tr><td><kbd>*-*-* 01:00:00</kbd>*</td><td>every day at 1am</td></tr>
<tr><td><kbd>Sun *-*-* 00:00:00</kbd>*</td><td>every Sunday</td></tr>
<tr><td><kbd>Mon...Fri *-*-* 00:00:00</kbd>*</td><td>Monday to Friday</td></tr>
<tr><td><kbd>Sun *-*-* 00:00:00</kbd>*</td><td>every week</td></tr>
<tr><td><kbd>* *-01,07-01 00:00:00</kbd>*</td><td>every 6 months</td></tr>
<tr><td><kbd>* *-01-01 00:00:00</kbd>*</td><td>every year</td></tr>
</tbody>
</table>
</small>

Once you have these two files, you just need to reload the systemd configuration and enable the timer (which, in this case, is the unit of interest):[^2]

```shell
% systemctl --user daemon-reload
% systemctl --user start kopia-backup.timer
% systemctl --user enable kopia-backup.timer
```

To check that the timer is indeed enabled or active, just issue:

```shell
% systemctl --user list-timers --all
NEXT                         LEFT       LAST                         PASSED  UNIT               ACTIVATES
Mon 2022-08-22 19:15:00 CEST 14min left Mon 2022-08-22 19:00:08 CEST 21s ago mail-sync.timer    mail-sync.service
Mon 2022-08-22 20:00:00 CEST 59min left Mon 2022-08-22 19:00:08 CEST 21s ago kopia-backup.timer kopia-backup.service

2 timers listed.
```

I implented my two cron jobs (fetch mail every 15' and backup my `$HOME` folder every hour) using systemd timer, and it works like a charm.

{{% alert note %}}
<small>[2022-09-01]</small><br>
See also this excellent review, in which I leaerned that we can check if our `OnCalendar` settings work as expected: [Use systemd timers instead of cronjobs](https://opensource.com/article/20/7/systemd-timers).
{{% /alert %}}

{{% music %}}Jan Lundgreen Trio • _Rosemary's Baby_{{% /music %}}

[kopia]: /post/kopia/

[^1]: One of the advantage of cron job is that the same job can be run again, in parallel, even if the previous instance hasn't finished yet. This happens if you have long-running jobs that are launched at evry short interval. This at least is what I seem to remember from my early Linux days, and I didn't check what the state of the rt is for this kind of situation.
[^2]: Thanks to Robert Lützner for having noticed an error in the wording of one of the commands.
