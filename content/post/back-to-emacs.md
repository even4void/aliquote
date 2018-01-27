+++
title = "GNU Emacs on OS X 10.7"
date = 2018-01-27T15:13:04+01:00
draft = false

tags = ["apple", "emacs"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I have been using [Aquamacs](http://aquamacs.org) for over 5 or 6 years now, but I recently decided to go back to a more simple version of Emacs, namely the latest build of [Emacs for OS X](http://emacsformacosx.com/).

Why? There are several reasons:

- I wanted to rewrite a cleaner configuration file and use the [ELPA](http://emacswiki.org/emacs/ELPA) package manager. OS X has no package manager, at least no one that I use (e.g., [Homebrew](http://mxcl.github.com/homebrew/))--anyway, I like compiling everything from scratch so that I know where things go to be installed. However, with time I have accumulated a large collection of `.el` files in my `.lisp.d` directory, and almost half of them are outdated.
- Aquamacs provides a rich set of facilities for people living with a Mac (key bindings, fullscreen support, etc.) and I have downloaded several versions from the developmental branch without any difficulties. Now, there are tons of gadgets that I don't use, and it doesn't work well when runned in a terminal (and the Emacs that ships with Apple Macbook is version 22.1!).
- This lead me to re-read a lot of documentation, which is quite good because with time we tend to rely on automated commands, sometimes without knowing how they are implemented.

Everything started with my looking at the [overtone](https://github.com/overtone/live-coding-emacs) project (following a [post](http://www.swaroopch.com/blog/learning-clojure) mirrored on Planet Clojure). There's a nice screencast on the Github website, and I also found this one: 

{{< vimeo 25190186 >}}

So basically, the author customized his emacs with a lot of add-ons, especially to assist coding activity: auto-complete, snippets, connection to various REPLs, etc. I wanted to do the same, but without using the complete overtone configuration files. That's almost done!

Be sure to grab one of the 24.* series in the [build repository](http://emacsformacosx.com/builds). I personally choosed the 24.1-rc pretest version. I haven't had any problem so far.

To configure ELPA, we can add the following two lines in our `.emacs`:

```lisp
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ("tromey" . "http://tromey.com/elpa/")))
```

This will add [Marmalade](http://marmalade-repo.org/) as well as Tromey ELPA to the default GNU repository. Something that's really important is to configure the keyboard; I just added

```lisp
(setq mac-option-modifier 'none)
```

in order to exchange command the option (<kbd>⌥</kbd>) and command (<kbd>⌘</kbd>) keys. Otherwise, we cannot type symbols like `~` (<kbd>Alt-n</kbd>), or use square brackets (which is pretty sad when writing R code :-). Other customizations can be added, for example to make the connection with Mac `pbpaste` more transparent.

I was aware of [Yasnippet](http://capitaomorte.github.com/yasnippet/), which is inspired from [Textmate](http://macromates.com/), but I just gave it a try in the past. Now, I'm using it and it seems the trigger key (⇥) is not too intrusive when I'm typing.

I am also trying to familiarize myself with [ido-mode](http://emacswiki.org/emacs/InteractivelyDoThings) that I've never used:

```lisp
(require 'ido) 
(ido-mode t)
```

My first impressions were disconcerting, but now I seem to get used to it. I just have to remember that I now have to `C-d` to get into `dired-mode` for browsing content of a directory.

My `.emacs` is not entirely clean at the moment: I need to investigate the [autoload vs. require](http://a-nickels-worth.blogspot.fr/2007/11/effective-emacs.html) issue more carefully. For the moment, I am quite happy with the configuration of Lisp, Clojure, R, and Python. I can connect to slime using either `lein swank` or `M-x clojure-jack-in` from within Emacs. For R, I have [Yasnippets](https://github.com/capitaomorte/yasnippet) working right out of the box, together with other goodies from [ESS](http://ess.r-project.org/). I was previously using [ado-mode](http://homepage.mac.com/brising/Stata/), but `ess-mode` provides most of the basic functionalities I need for interacting with Stata.

An example of an interactive R session is shown below:

![Emacs 1](/img/20120616124927.png)

Top panel shows how Yasnippet prompting tool is triggered when pressing tab (<kbd>⇥</kbd>), while bottom panel shows available arguments when typing `rnorm` in the R shell directly.

Here is another screenshot which show the beginning of a clojure script with auto-completion and a running `lein` shell:

![Emacs 2](/img/20120616165557.png)

Next screenshot shows two buffers with Yasnippet providing basic construction of `defn` macro (top), or suggesting methods in Python mode (bottom).

![Emacs 3](/img/20120616190311.png)

Finally, this configuration works equally well when Emacs run in a Terminal (`nw`), as can be seen below:

![Emacs 4](/img/20120616193729.png)
