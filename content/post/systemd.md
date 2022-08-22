---
title: "Migrating to Systemd"
date: 2022-08-22T14:37:44+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

I've been faithfully using cron jobs on Linux for twenty years now. It's quite simple to schedule basic tasks using `crontab -e`: simply write your shell script or call the application you want to run at a desired time, and then forget about it. Currently, I only have two crontab entries running: one for checking my mail (`mbsync`), and the other for [Kopia] hourly backup. Recent versions of Ubuntu now favor the use of systemd scheduler instead of cron, and so I decided to move all my running jobs to systemd. One of the advantages of using systemd is that you can move your systemd files between your machine or over ssh. The other advantage, of course, is that you can manage your running jobs using `systemctl`, which means you can stop or pause tasks at any time, or reschedule a timer easily.

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
<tr><td><kbd>*-*-* *:*:00</kbd>*</td><td>every minute</td></tr>
<tr><td><kbd>*-*-* *:*/30:00</kbd>*</td><td>every 30 minute</td></tr>
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

Once you have these two files, you just need to reload the systemd configuration and enable the timer:

```shell
% systemctl --user daemon-reload
% systemctl --user enable kopia-backup.timer
```

If you just want to test the timer, replace the last command with `systemctl --user start kopia-backup`. To check that the timer is indeed enabled or active, just issue:

```shell
% systemctl --user list-timers --all
```

{{% music %}}Jan Lundgreen Trio • _Rosemary's Baby_{{% /music %}}

[kopia]: /post/kopia/
