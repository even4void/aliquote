---
title: "Previewing EPS files on macOS"
date: 2026-08-20T15:08:22+02:00
draft: false
tags: ["apple", "tex"]
categories: ["2026"]
---

Apple dropped support for quicklooking and viewing Encapsulated PostScript (EPS)
file a while ago, but I wasn't aware of that since I used OSX Mojave before
turning back to macOS two years ago after a 4-year hiatus. I was in the middle
of browsing some old Stata code for a biostatistical primer and I wanted to
check some figures. All the code was written using Stata 13 which only support
EPS as a high-def graphical backend for further $\TeX$ processing.

Here's one way to preview EPS file using a Quick Action from the Finder. It
assumes you have the `epstopdf` program, which is usually bundled with
[MacTeX][1].[^1] There're probably other options worth of exploring but I was in
a hurry and I'm no AppleScript expert.

{{< figure src="/img/2026-08-20-15-10-39.png" >}}

Yes, this is using Automator to define a convoluted workflow (basically to
filter Finder items based on their extension) but it does the job actually. Now,
I can right click on an EPS file and it get converted on the fly (in the user
home directory) and sent to Preview app. It would be cool if we could call the
Quick Action when double clicking the file directly but it seems it is not
possible. However, the Finder Preview Pane displays the quick action so in case
I need to preview many files at once, I can just open it with its defualt
shortcut (`⇧⌘P`).

[1]: https://www.tug.org/mactex/

[^1]: Apple alos removed the `pstopdf` utility when Sonoma was released.

{{% music %}}The Velvet Underground • *Louise*{{% /music %}}
