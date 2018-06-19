---
title: "Texlive 2018"
date: 2018-06-18T20:12:55+02:00
lastmod: 2018-06-18T20:12:55+02:00
draft: true
description: ""
tags: ["tex", "apple"]
categories: []
---

When I tried to update my TeX packages I first learned that there was a French translation ready to install and then I ended up with a blank list in the TeX Live Utility app. Yes, I know, this is 2018 and it is probably time to update my Texlive distribution.

<!--more-->

One funny side note from the [MacTeX](https://www.tug.org/mactex/newfeatures.html) website is about the removal of the Preference pane. Just quoting, emphasis is mine:

> Previously, MacTeX installed a preference pane for Apple's System Preferences allowing users to select the active TeX distribution. Unfortunately, this Preference Pane was a plugin for System Preferences, and when Apple changed System Preferences, the Preference Pane needed to be recoded. **Apple often made changes.**

Anyway, one of the updates worth mentioning is the fact that LaTeX now considers UTF-8 as the default encoding, so there is no need to add `\usepackage[utf8]{inputenc}` in new files.
