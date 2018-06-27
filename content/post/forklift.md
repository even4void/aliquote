---
title: "Forklift"
date: 2018-06-27T07:44:45+02:00
draft: false
tags: ["apple"]
categories: ["app-review"]
---

Here is a brief review of [Forklift](https://binarynights.com), a lightweight and pervasive app for file management.

<!--more-->

There is already a very nice review on [Jack Baty's blog](https://www.baty.net/2018/forklift-as-a-finder-replacement/). I have not much more to add but I will briefly highlight the key features I like most.

![](/img/2018-06-27-07-54-20.png)

I've never made very sustained use of the Finder. However, I find it pretty convenient when it comes to visualize the hierarchical structure of certain folders, or just to preview some files using the <kbd>SPC</kbd> shortcut. Forklift allows you to edit known files without even opening them, which some users may find pretty useful (this even works when files are hosted on  a remote server). In any case, it is also possible to choose among distinct apps to open a file selected from one of the two panes.

Regarding the UI, Forklift remembers the current layout and locations so you will get back where you were when you launch it the next time. There are search and quick select facilities that allow to apply specific filter like file extension, tags or Spotlight `kind:` keywords. In addition to the dual pane view, Forklift supports tabs for browsing multiple directories at once. It is even possible to [replace Finder almost completely](https://binarynights.com/manual#fileviewer).

Remote connections are a big plus for this app. While I use mostly `ncftp` from the command-line or Transmit to upload files to FTP servers, it is very convenient to be able to sync a set of files to a remote connection. This works quite well with FTP and SFTP but it is also possible to manage connection to AWS instance or even Google Drive. If you have Dropbox installed on you system, it is automatically integrated as another favorite in the sidebar. All in one, I would say that it combines the features of [ExpanDrive](https://www.expandrive.com) and the good old [Path Finder](https://www.expandrive.com) that I never liked in my early Mac days.

An action is also available to create symbolic links, like when using `ln -s` from a Terminal, or Apple "alias". Forklift can work with compressed archives (ZIP, tarball) as well. Version control is enabled, but currently it is only to add/commit a set of files or pull/push from/to a repository, that is no things like Git Status, GitHub interaction, or all the magick that happens when using [Magit](https://magit.vc).

Things I haven't try yet: Forklift allows to delete applications and to apply custom scripts to selected files. Moreover, it seeems to have rich features for remote file management and/or transfert which I haven't time to play with.

Finally, Forklift comes with Apple Share button and also a dark mode which is definitely a game changer for dark theme users. For Emacs or Vim users, don't be afraid: you don't even need to use the mouse, everything is under keyboard control.

{{% music %}}Divinyls • *Divinyls*{{% /music %}}
