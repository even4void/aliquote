+++
title = "The random joys of living with a Macbook"
date = 2012-02-23T23:12:16+01:00
draft = false
tags = ["apple"]
categories = ["2012"]
+++

Well done OS X AppStore! You just deleted my `/Developer` folder with all extra stuff I installed on top of your programs...

<!--more-->

I don't really understand what pleasure Apple might take in changing everything on my Mac everytime they release new software or new system. Now, they even don't ship `gcc` with the newly released Xcode. 

My bad, of course. I shouldn't have updated to Xcode 4.3 without reading the changelog.

> /Developer No Longer Exists  
> The simplification afforded by repackaging Xcode 4.3 as a single app bundle eliminates the need for the /Developer directory containing prior versions of Xcode. As a result, the Install Xcode application and the uninstall-devtools command line script are also no longer needed.

As I found this was a convenient place to put everything related to programming, I just lost my Qt SDK, Clozure Lisp, and a lot of Ruby, Python demos files. The [What's New in Xcode](https://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/WhatsNewXcode/Articles/xcode_4_3.html) says that

> The first time you run Xcode 4.3, you are prompted with a dialog to delete the Install Xcode application from the Applications directory if one is resident, and to remove any older installation of Xcode

In my case, I was offered the option to delete my old Xcode program, but not `/Developer`; so it seems it just deleted everything.

Anyway, I'm left with reinstalling everything. Funny enough, all utilities are now packaged within Xcode, instead of being "utilities" that can be used independently of Xcode.

![xcode1](/img/20120223155521.png)

Likewise, you need to go to Developer Central to get extra programs, like OpenGL Profiler or the Quartz Composer.

![xcode2](/img/20120223155511.png)

The fact that Apple removed support for `gcc` (in favor of `llvm`) with the latest release of Xcode has created [some buzz](https://stat.ethz.ch/pipermail/r-sig-mac/2011-March/008100.html) in the R community, notwithstanding the fact that they charged Apple users for that (ok, now it's free again). When I got my OS X 10.7, there was no support for Flash (ok, I can live without it) or Java (I had to reinstall it!). In the next release, they will drop X11 and replace it with [XQuartz](http://xquartz.macosforge.org/trac/wiki).

Just skimming over [Mountain Lion new features](http://www.macworld.com/article/165496/2012/02/ten_exciting_system_changes_in_mountain_lion.html), I noticed that major enhancements to the system focus on iCloud support, gestures, and everything that could potentially make my Mac looks like an iPad.
