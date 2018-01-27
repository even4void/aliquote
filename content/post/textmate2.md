+++
title = "Textmate 2"
date = 2013-01-02T15:15:20+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Things have changed since the last time I used TextMate (that was probbaly two or three years ago). 

TextMate 2 is now [available on GitHub](https://github.com/textmate/textmate). I don't want to spend much time into the "TextMate is dead, Long live TextMate" debate; it has been discussed elsewhere and it seems that many users turned to [Sublime Text](http://www.sublimetext.com). The fact is that TM2 is now hosted on GitHub and anyone can contribute to its development and somehow ensure its sustainability. I always feel sad when I hear that a great project sank into oblivion. Although I really much like GNU Emacs, TextMate was something special for me: a minimalist GUI with much functionalities, no useless icons or "tool bar", a keyboard centric approach to editing, and a powerful customization system via the Ruby scripting language. It looks like GitHub has become the preferred hosting solution for dead projects, handing over to new developers (not a bad idea), or to get around Apple App Store and the sandboxing policy (shame on you, Apple), see e.g. [Vico](http://blog.vicoapp.com/2012/07/Vico-is-dead-Long-live-Vico) <i class="fa fa-chain-broken fa-1x"></i>:

> Vico is a programmers text editor with a strong focus on keyboard control. Vico uses vi key bindings to let you keep your fingers on the home row and work effectively with your text. 
> <small><http://www.vicoapp.com></small>

## First impressions

Something I found annoying (much like in Emacs [auctex](http://www.gnu.org/software/auctex/)) is the use of varying (proportional) font size for headings, as well as different font shape (Baskerville). This can be changed by editing Bundles properties (<kbd>⌃-⌥-⌘-B</kbd>) in *Themes ‣ Settings*. 

There's no split view option but it appears to be a [requested feature](https://github.com/textmate/textmate/issues/203). However, the user interface has kept all of its original design, with tab support added (which was seriously annoying before). I haven't found a way to open new file in new tab but there's a 'Merge all windows' option.

I had to customize indentation (with spaces instead of tab) and wrap mode to mimic Emacs behavior which I prefer. Unfortunately, there's still no true auto-filling mode although I found a little hack based on `fmt` ([How do you force carriage return after 80 characters?](http://bit.ly/U8QtqA)). One should be aware that by using 'Reformat text' (<kbd>⌃-Q</kbd>) at the end of each paragraph will result in a lost of syntax highlight for, e.g., inline Markdown www hyperlinks.

## Useful bundles

- [Stata](http://bylr.net/3/2010/10/stata-bundle-for-textmate/) offers syntax highlighting and command completion (BTW, I forgot that it was the Escape  and not Tab key as in Emacs :-) but sending command from Textmate buffer to Stata is done via AppleScript which is of no interest to me. (Surely, we could do some nice stuff with [tmux](http://tmux.sourceforge.net) and Stata from the command line.)
- R and Sweave (built-in) bundles, or [knitr](https://github.com/fonnesbeck/knitr.tmbundle), offer minimal support to process R and Noweb files. There's even an *eval and step* command (with Mac GUI).
- [ConTeXt](https://bitbucket.org/bernhard/textmate-context-bundle/)
- Enhanced [Markdown](https://github.com/fletcher/markdown.tmbundle) support (including [MultiMarkdown](http://fletcherpenney.net/multimarkdown/download/)) and built-in visualization (although we could make [Marked](http://markedapp.com) and textMate play nicely together).

The [Clojure bundle](https://github.com/swannodette/textmate-clojure) relies on Cake and there's no support for [nREPL](https://github.com/clojure/tools.nrepl) or Leiningen. More generally, I found that support for Common Lisp is quite scarce with just syntax highlighting and few shortcuts for CL.

## How does it differ from Sublime Text?

Well, that's difficult to say because I haven't used [Sublime Text]({{< ref "/post/sublime-text.md" >}}) for real work. What is really great about ST2 is the [sublimeREPL](https://github.com/wuub/SublimeREPL) package, although nothing compares to Emacs inferior processes, IMO. Such embedded REPLs are obviously missing in TextMate, but we could certainly bind TM to iTerm2 in an unobtrusive way.

I read on [Quora](http://www.quora.com/Chris-Fonnesbeck/answers/TextMate-text-editor) that Chris Fonnesbeck always found that using a multi-platform editor is a bad idea, but I do not necessarily agree. For instance, GNU Emacs (or Vim) runs on all three main OSs and offers an almost similar UI experience and interaction with the system (meaning, it does not target a particular platform, although it should probably be better used on Un*x-like system). However, I think that it is not a good idea to switch between several editors depending on the task at hand: we need to use the same software every day to really get used to it and appreciate its pros and cons.

## To sum up

I personally tend to use as few applications as possible. Usually, I'm happy and probably most productive with just Emacs, a [Z-shell](http://aliquote.org/memos/2012/07/24/upgrading-bash-and-zsh-on-os-x), sed/awk, and a combination of GNU [Coreutils](http://www.gnu.org/software/coreutils/). That's a very basic setup, but that's what I learned several years ago and I'm still trying to learn more of them. About Emacs, I abandoned the idea of using the Cocoa application and I am now using it exclusively from [iTerm2](http://www.iterm2.com/#/section/home). Here are few other applications I use: [Marked](http://markedapp.com), [Skim](http://skim-app.sourceforge.net), [Gitx](http://gitx.frim.nl).
