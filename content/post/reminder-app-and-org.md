---
title: "On standardizing the use of Reminder App and Org mode"
date: 2018-10-21T13:22:18+02:00
draft: true
description: ""
tags: ["apple", "emacs"]
categories: []
---

Since macOS Sierra, I found myself using the Reminder App more often than I did before. This is partly due to the fact that I cannot stand well organized when I rely on manual sticky notes, and it helps recording things I have to do along the week or for a project. On the one hand, the Reminder App is simple enough to meet the needs mentioned above; on the other hand, it lacks serious fucntionalities like being able to print items, synchronize with Calendar App, while it works pretty well with Fantastical, or a decent API to be used by other software.

<!--more-->

Most importantly, it is available on iOS too. I use Reminder for various stuff. Beside simple TODO list and project management, I also make extensive use of Reminder to store web links via Apple Share Action menu. Here is what I currently have in my "Read it later" list:

![](/img/2018-10-21-13-28-07.png)

Note that it also possible to send reminder from Apple Mail directly (although it is not obvious--you have to left-click on the title of a message to send it to the Reminder App). It is also interesting to remark that copy/pasting the above list yields the following plain text checklist:

    [ ]	ECON 626 Empirical Microeconometrics
    [ ]	Faster generalised linear models in largeish data
    [ ]	ECM is finally streaming, and I'm here to tell you what's good - Sound & Complete
    [ ]	Blogging with org-mode and ox-hugo // Shane Sveller

Interesting, but we loose important metadata (hyperlinks, due dates, notes). While it is still possible to [Get a Spreadsheet of Tasks into Reminders.app](https://n8henrie.com/2014/05/how-to-get-a-spreadsheet-of-tasks-into-reminders-app/), using this handy [AppleScript program](https://gist.github.com/n8henrie/c3a5bf270b8200e33591),[^1] I found no easy way to go the other way around, that is to export Reminder tasks into another application. Now, I also use Emacs a lot, and as you may have already guessed, I manage various TODO lists with Org mode. The aforementioned action for web capture can easily be implemented in Emacs thanks to [this irreal gem](http://irreal.org/blog/?p=3726). However, getting a proper way to import, or better, syncronize Reminder items with an Org TODO list seems a lot trickier. From the [Apple Documentation Center](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/EventKitProgGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40004759-SW1), we know that Reminder data are stored in the same database than Calendar data, which is located under `~/Library/Calendars`. It is easy to lookup specific task with `grep` or `ack`. For instance, the first item displayed in the above list reads in iCal format as follows:

    BEGIN:VCALENDAR
    VERSION:2.0
    PRODID:-//Apple Inc.//Mac OS X 10.13.3//EN
    CALSCALE:GREGORIAN
    BEGIN:VTODO
    CREATED:20180108T105626Z
    UID:1C545AF5-EA03-4375-B94F-F1FE5319B70C
    X-APPLE-ETAG:"C=5566@U=6da3ee09-8deb-4c7f-8b05-dc02403e8686"
    X-APPLE-SCHEDULETAG:
    X-APPLE-SERVERFILENAME:1C545AF5-EA03-4375-B94F-F1FE5319B70C.ics
    SUMMARY:ECON 626 Empirical Microeconometrics
    DTSTAMP:20180308T121417Z
    SEQUENCE:0
    DESCRIPTION:#readings \nhttp://economics.ozier.com/econ626/
    END:VTODO
    END:VCALENDAR


[^1]: It was even possible at some point to use [Drafts 4](https://getdrafts.com) to [query a virtual folder](https://agiletortoise.zendesk.com/hc/en-us/articles/200634965-Reminders-Integration) in iOS Reminder. I didn't check if it is still working with Drafts 5.
