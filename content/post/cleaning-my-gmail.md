---
title: "Gmail seasonal cleaning"
date: 2011-01-21T09:07:26+01:00
draft: false
tags: ["misc"]
categories: ["2011"]
---

I just finished cleaning up my Gmail account. The idea was to go below the 50% size limit. I was lucky enough to find [FindBigMail](http://www.findbigmail.com/) to tag large messages, and removed old messages from various mailing-lists.

Gmail is great, but its searching features are somewhat limited. For example, I would like to know which emails do have attached files larger than 5 Mb. It simply isn't possible using Gmail. Ok, I can fetch all my email using Mail.app as before, but now I decided to stop wasting my HD space with emails and decided to use Gmail online only.

I have something like more than 28,000 emails, as a result of a sloppy emailing activity: I always rested on Gmail huge capacity to store my emails, so that I never think of deleting any of them.

It's quite funny to browse five years of emailing activity. My first email on Gmail was from 2006/3/30. I was even able to find an R-Help digest from 2006/07/20 (Vol 41, Issue 20)! The largest email attachments I was able to found dated back from my PhD (obviously, I was so in a hurry that I send and resend the manuscript to everybody multiple times). Anyway, here is the picture that summarizes FindBigMail's results:

![BigMail](/img/20110121135900.png)

Well, some attachments were over 10 Mb! In conclusion, this on-line application saves a lot of time for finding forgotten emails (typically those including pictures, 2 Mb each!).

As a side-effect, this cleaning activity was a good occasion to make a recap' of useful advanced search features on Gmail. Here is some tips and tricks grabbed from everywhere on the web:

```
has:attachment pdf after:2011/01/01 before:2011/01/20
has:attachment (*.ppt || *.pptx || *.pps)
label:Label1 | label:Label2 (case insensitive)
label:Label1 filename:pdf
from:John OR from:Joe cc: bcc:
subject:"match this exactly"
from:John (keyword1 OR keyword2) (remove OR to match both keys)
keyword1 -keyword2 (has key1 but not key2)
in:anywhere (Spam and Trash excluded)
is:starred
```
