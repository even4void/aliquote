+++
title = "Scheme and Emacs"
date = 2014-04-18T22:16:03+01:00
draft = false

tags = ["lisp", "apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

For those who like to write Scheme without leaving Emacs, [Geiser](http://www.nongnu.org/geiser/) is probably the way to go.

The [Racket guide for Emacs](http://docs.racket-lang.org/guide/Emacs.html) also recommends to install [Quack](http://www.neilvandyke.org/quack/), which I happened to try long ago for an [introductory course in programming for Bioinformatics](http://www.laurentbloch.org/MySpip3/spip.php?rubrique4) where we were using Scheme (I was using [Chicken Scheme](http://www.call-cc.org/) at that time).

I believe [DrRacket](http://racket-lang.org/) (formerly [PLT Scheme](http://plt-scheme.org/)) is really a great software to learn Scheme and do serious stuff with it, including [computational science](https://groups.google.com/forum/#!topic/racket-users/29fIsGnbVIw). I know people would not necessarily consider Racket as a [pure Scheme language](http://stackoverflow.com/questions/3345397/how-is-racket-different-from-scheme). By the way, here are some of the most upvoted questions on Stack Overflow:

- [What is the best Scheme or LISP implementation for OS X?](http://stackoverflow.com/questions/459323/what-is-the-best-scheme-or-lisp-implementation-for-os-x)
- [What are the differences between Clojure, Scheme/Racket and Common Lisp?](http://stackoverflow.com/questions/11223403/what-are-the-differences-between-clojure-scheme-racket-and-common-lisp)
- [Dr Racket problems with SICP](http://stackoverflow.com/questions/3597781/dr-racket-problems-with-sicp)

Beside [Doug Williams](http://drschemer.blogspot.fr/) `science` collection, Racket now includes scientific packages like [plot](http://docs.racket-lang.org/plot/) and [math/statistics](http://docs.racket-lang.org/math/stats.html).

For example, using a toy demo from Racket website, here is how it looks under the native Mac app:

![racket](/img/20140417113203.png)

And here is the same script processed through Emacs Geiser:

![emacs](/img/20140417113420.png)

With Emacs, you just have to `M-x run-geiser` to start the REPL (it is pretty fast to come up, unlike Clojure REPL). However, since `Geiser` targets both Racket and Guile, I decided to compile Guile. I tried to install Guile some time ago, following a suggestion on [Cross Validated](http://stats.stackexchange.com/a/20144/930) where I provided a brief illustration with Scheme. But it soon reached to the point where I had too much dependencies to manage and I finally gave up. This time, it works perfectly well, and I suspect that this is because I added all those dependencies in the mean time (in particular, to install [mu]({{< ref "/post/using-mu-to-manage-e-mails.md" >}})).

![guile](/img/20140401192823.png)

Finally, I recently learned about [Pyret](http://www.pyret.org/) (and, as a side-effect, of [Frog](https://github.com/greghendershott/frog)):

> Pyret is a programming language designed to serve as an outstanding choice for programming education while exploring the confluence of scripting and functional programming.


### Sidenote

Emacs 24.4 is available for OS X on <http://emacsformacosx.com/> (check the Nightlies builds), and it comes with [pretiffy](http://ergoemacs.org/emacs/emacs_pretty_lambda.html)[^1], see also [What's new in Emacs 24.4](http://www.masteringemacs.org/articles/2013/12/29/whats-new-in-emacs-24-4/).

By the way, I learned that Emacs 24.3 suffers from a problem when rendering [sRGB color](http://goo.gl/whSihf), which explains why I got some strange problems with [powerline](https://github.com/jonathanchu/emacs-powerline).[^2]


[^1]: I use <i class="fa fa-file-code-o fa-1x"></i> [`pretty-lambdada.el`](http://www.emacswiki.org/emacs/pretty-lambdada.el) at the moment.

[^2]: [Other issues](https://github.com/jonathanchu/emacs-powerline/issues/11) came around when I used the solarized theme. Now, I switched to [gruber-darker](http://marmalade-repo.org/packages/gruber-darker-theme) theme, so it doesn't bother me anymore.
