+++
title = "Sublime Text"
date = 2012-08-26T15:19:53+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

[Sublime Text](http://www.sublimetext.com) is one of the latest killer app on OS X, although it is also a powerful cross-platform text editor. But, that just ain't to be a text editor, right?

I am a huge fan of [GNU Emacs](http://www.gnu.org/software/emacs/), so why writing about another text editor? For OS X users, there has been [Textmate](http://macromates.com) which has not kept its promises to update, so to speak. It is now on [Github](https://github.com/textmate/textmate), but see also [Textmate 2 and why you shouldn’t rewrite your code](http://kerr.io/textmate-2-and-why-you-shouldnt-rewrite-your-code/). There was also [smultron](http://www.peterborgapps.com/smultron/), [fraise](https://github.com/jfmoy/Fraise), and now [chocolate](http://chocolatapp.com). Want more funny stuff for HTML dev? Check out [Coda](https://panic.com/coda/). All that to say that it is a matter of taste... and leverage. As always, simplicity matters, but you need to feel confident with your preferred text editor.

Sublime Text is great because it has a very simple user interface: no fancy buttons, a simplified and useful status bar, two magic commands (<kbd>⌘-P</kbd> and <kbd>⇧-⌘-P</kbd>). Configuration is done via text files, with Python as a driving language. I tried it for a day or so, but obviously that is not enough to really gauge its capabilities. However, I soon found myself missing some nice tools from Emacs: first, keyboard shortcuts are really different--looks like I had to rewire my fingers, buffer management and file/directory browsing (I'm thinking of `dired-x` and `ido-mode`, among others). Of course, there's [sublemacspro](http://grundprinzip.github.com/sublemacspro/) which provides some of Emacs key mapping, but that's just too limited. I have an Emacs.app but I mainly work from a terminal with bash, jobs, and the unix way of life; I just can't do that with Sublime Text. I found little support for R or $\LaTeX$, as compared to Emacs. I'm missing inferior processes where I can just lauch any interactive program I want in a dedicated buffer, although I was able to run Clojure thanks to the [sublimeREPL](https://github.com/wuub/SublimeREPL) package, which uses `lein repl`.[^1]

![ST and Clojure](/img/20120826225419.png)

My conclusion is that I will stick to GNU Emacs: with age, I'm less inclined to change my work habits; but I will certainly recommend it for students and people interested in leveraging their text editing activities.

Finally, some links where authors provide a much better description of pros (and cons, occasionally) of Sublime Text:

- [Sublime Text: A candidate of best editor](http://bit.ly/SFuHXC)
- [Sublime Text 2 tips for Python and web developers](http://bit.ly/SFvg3z)
- [Using Sublime Text 2 for R](http://bit.ly/QH4lje)
- [I Code With Things and Stuff](http://bit.ly/QO3e5G)

[^1]: Read [this issue](https://github.com/wuub/SublimeREPL/issues/11) on Github to see how to configure it on OS X.
