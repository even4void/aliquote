---
title: "CleanMyMac App"
date: 2018-10-09T10:44:27+02:00
draft: false
tags: ["apple", "app"]
categories: ["2018"]
---

[CleanMyMac](https://macpaw.com/cleanmymac) is probably the only app you need if you want to stay organized with your Mac.

I have always been a bit reluctant with "magic cleaner" of any kind. I have tried some of them in the past. First, it is hard to tell what they really do and it is often easier to let the system automatically cleanup things as it is supposed to be done, and oftentimes those apps do not offer much more than what is readily available in a Terminal (`sudo purge` to reclaim unused RAM, `sudo periodic daily weekly monthly` to remove temporary caches and files, etc.). So, why CleanMyMac?

First of all, even if you can put all your shell commands into a chron job, init script, or whatever, it is hard to beat a native app that provides you with a nice UI and lots of handy utilities. Indeed, CleanMyMac includes several components. The main task is probably to analyze the whole system in order to delete unused files, delete caches, or execute scheduled maintenance scripts. If this is a first try, when you launch CleanMyMac you will probably end up with several Go's of additional free space on your HD time (useless settings or cache data, localization files, temporary folders) and a slight performance boost. This is well summarized by the Summary View that sits at the top of the left menu bar:

![](/img/2018-10-09-10-54-24.png)

Note that it is possible to customize what will be removed during the cleaning stage--and I highly recommend to check those items beforehand, because it includes cleaning the Books app cache which simply means deleting all your local iBooks (or at least, this is what happened to me with the previous version of the app). In the last version of the software (series X), an history of all the actions that were undertaken has been added, so you can keep a trace of what you have been doing recently.

There is also an uninstall tool that I find very useful since it will also delete auxiliary files, which are always a pain to find manually:

![](/img/2018-10-09-10-54-45.png)

The latest release even features a nice utility: It is now possible to update all the apps found on your HD from the dashboard directly, even apps that were not installed via the App Store. Overall, I found that it is one of the best addition to the software. Note that this does not include third-app additional packages like Python, R or TexLive (but additional components like BibDesk will be udpated anyway):

![](/img/2018-10-09-10-44-06.png)

Finally, there is an option to let CleanMyMac stay in the menu bar, with live information regarding RAM and disk usage or network up/down status. If you already purchased CleanMyMac 3, you will get a 50% discount to upgrade to the X version. It looks like folks are keen to skip intermediate numbers between [0-9] and X these days.
