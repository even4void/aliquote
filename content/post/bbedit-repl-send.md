---
title: "Poor man REPL shortcut for BBEdit"
date: 2026-09-25T09:16:54+02:00
draft: false
tags: ["apple"]
categories: ["2026"]
---

You've probably heard this story a lot of times: let's say we want to automate
sending a visual selection or a whole buffer to a running application (e.g.,
Stata, Mathematica), so we start writing some Apple Script, one script for each
target application. This works great. Then we started wondering whether we could
factorize all the code, ultimately using a single shortcut to send our code to
whatever is running depending on file extension. If we are working with a wls
file, send it to Wolfram desktop, if this is some Stata do code send it to Stata
GUI. Does this remind you of Emacs `C-c C-c`?

I discovered [Jonathan Marc Bearak][1]'s scripts some time ago and thought I
would adapt them for my own needs. Usually I only want to send the current line
or a visual selection to Stata or Wolfram. I wrote separate AppleScript to
perform such actions but it would be nice to have a single shortcut to send
whatever is selected to the right app.

Without further ado:

```applescript
tell application "BBEdit"
    activate
    set pathname to name of text document 1
    set the_selection to (selection of front window as string)
    if (the_selection) is "" then
            set the_selection to line (get startLine of selection) of front window as string
    end if
end tell

if pathname contains ".wl" or pathname contains ".wls" then
    tell application "Wolfram"
        set the clipboard to the_selection
        activate
        delay 0.1
        tell application "System Events"
            keystroke "v" using {command down}
            keystroke return using {shift down}
        end tell
    end tell
else if pathname contains ".do" or pathname contains ".ado" or pathname contains ".mata" then
    tell application "StataBE"
        DoCommandAsync the_selection
    end tell
else if pathname contains ".r" or pathname contains ".R" then
    tell application "Terminal"
        set the clipboard to the_selection
        activate
        tell application "System Events"
            keystroke "v" using command down
            keystroke return
        end tell
    end tell
else
    tell application "Terminal"
				if not (exists window 1) then reopen
				activate
				do script with command the_selection in front window
    end tell
end if
```

Note that I use R in the terminal and not the buggy R terminal app. Save this
script into your Scripts folder
(`~/Library/Application\ Support/BBEdit/Scripts`) and assign a shortcut if you
like.

This is just a boilerplate template that requires some further customization,
especially if you want to send the whole buffer instead of a selection or the
current line. Likewise, we don't check whether the app is already running.
Anyway, it fits my needs, somehow. Thanks again to Jonathan Marc Bearak for the
original work!

[1]: https://bearak.org/code/text/index.html

{{% music %}}The National • *Ada*{{% /music %}}
