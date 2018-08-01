+++
title = "My Setup"
date = 2013-06-10T11:19:56+01:00
draft = false

# Tags and categories
# For example, use `tags = []` for no tags, or the form `tags = ["A Tag", "Another Tag"]` for one or more tags.
tags = ["apple", "misc"]
categories = []

# Featured image
# Place your image in the `static/img/` folder and reference its filename below, e.g. `image = "example.jpg"`.
# Use `caption` to display an image caption.
#   Markdown linking is allowed, e.g. `caption = "[Image credit](http://example.org)"`.
# Set `preview` to `false` to disable the thumbnail in listings.
[header]
image = ""
caption = ""
preview = true

+++

I always enjoy reading [The Setup](http://usesthis.com/) from time to time. Here is mine.

I try whenever possible to stick to basic text-based workflow and I don't like complex UIs or applications that eat up all my RAM. I am working on a Macbook Air that I [bought in 2010]({{< ref "/post/welcome-to-the-macbook-air.md" >}}), and I stopped upgrading my OS at Lion. I didn't even bother updating to the latest 10.7.5. I only have 4 Go of RAM and most of the times that's just enough.

![OS X Lion](/img/20130610121428.png)

Since Apple fullscreen capabilities just suck with dual monitor, I rarely plug a second monitor onto my Airbook, and keep working with the Airbook screen (1440 x 900 pixels). I have no external mouse, and I use [Moom](http://manytricks.com/moom/) for windows management. The fact that Apple raised screen resolution of all their 13'' laptops above 1024 x 768 was one of the main reasons I switched from a 15'' Macbook Pro to an Airbook, by the way. I also have an iPhone which I use to read and process incoming emails when I'm not in front of my computer, and more recently I got an [iPad mini](http://www.apple.com/ipad-mini/overview/) to read books I buy on O'Reilly shop. I don't have other personal machines at home, and I backup my Home directory on a Time Machine and critical documents on AWS with [Arq](http://www.haystacksoftware.com/arq/). I have a 100+ Go account on Dropbox, which I use for cloud storage and web sharing. I no longer use Apple's services after they changed (again and again) their policies regarding cloud storage, email management, or simply applications packaging/management (read, the infamous AppStore). In sum, I try keeping the best of Apple's UI--nice looking and comfortable laptop (although too expensive, really), Quartz device, memory management, drag'n'drop facilities, core BSD system--while avoiding pointless enhancements.

I use few paid applications, and these are mainly for statistical work or sharing stuff with colleagues that cannot imagine their life without Word or Excel (or worse, HTML emails). I do not blame them nor I am making any judgment, however, since I believe everyone should be able to choose the best way to work. Whether it is the safer and clever way is another issue; I'm not so much interested in that, I just know this never worked for me. Such applications include: [Stata](http://www.stata.com/), [Mplus](http://www.statmodel.com/), Apple [iWork](http://www.apple.com/iwork/) suite (mainly Pages), and [Mathematica](http://www.wolfram.com/mathematica/). For statistics, the rest is essentially free software: [R](http://www.r-project.org/), [ggobi](http://www.ggobi.org/), [Octave](http://www.gnu.org/software/octave/), [Python](http://www.python.org/) ([Orange](http://orange.biolab.si/), [Pandas](http://pandas.pydata.org/), [StatsModels](http://statsmodels.sourceforge.net/)), [Weka](http://www.cs.waikato.ac.nz/ml/weka/), [JAGS](http://mcmc-jags.sourceforge.net/). I have a plethora of other applications that I barely use once a month. I spent several hours testing new software or updating 32 and 64-bits dependencies in the past. I now stick to 64-bits program and everything goes under my `/usr/local` which is currently facing something like 13 Go of various stuff. Yes, it would need to be refreshed more often :-)

I recently stopped using Apple Mail to archive or even process my emails, and I'm now saving them on my HD with [offlineimap](http://offlineimap.org/). I can search and read them using [mu](http://www.djcbsoftware.nl/code/mu/) at the command-line or directly from Emacs using `mu4e`.

I have been using [Safari](http://www.apple.com/safari/) since my first Mac back in 2005, but I am now using [Chrome](http://www.google.com/chrome/‎). I just find it more simple and less greedy in terms of RAM. I used to have Gmail opened all time but I occasionnally have two or three extra tabs opened at once: [Feedly](http://feedly.com) (now that Google Reader is dead), [Cross Validated](http://stats.stackexchange.com/), and a Google page. And when I get bored or want to check how accessible a website is, I just use [links](http://links.twibright.com/) for browsing. I bookmark a lot of webpages on my HD or saved links via <http://bit.ly>. I use [Twitter](https://twitter.com/chlalanne) as my main social network, in concert with [Prismatic](http://getprismatic.com/) and [Feedly](http://feedly.com), usually to share interesting news I found while reading or browsing. I do not have a Facebook account and I do not use Google+.

I spend most of my days typing commands in [iTerm2](http://http://www.iterm2.com/), using [zsh](http://www.zsh.org/) as my main shell interpreter with a very basic setup based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). I may run a shell directly from Emacs, though. I use [sed](http://en.wikipedia.org/wiki/Sed) (and more rarely [awk](http://en.wikipedia.org/wiki/AWK_programming_language)) and Bash scripts for interactive processing of data or text files. I'm happy with the GNU [coreutils](http://www.gnu.org/software/coreutils/) and [Scientific Library](http://www.gnu.org/software/gsl/), although I don't really like what Richard Stallman has to say at times. My text editor and personal psychotherapist is [GNU Emacs](http://emacsformacosx.com/), and I used it for almost everything. I tried other software ([TextMate](http://macromates.com/), [TextMate 2](https://github.com/textmate/textmate), [Sublime](http://www.sublimetext.com/), [vi](http://en.wikipedia.org/wiki/Vi)) but none offered me the freedom and simplicity of Emacs UI. Depending on my mood, I may run Emacs in Cocoa or cli-mode. I try to keep my own workflow as clean and reusable as possible with [Makefile](http://www.gnu.org/software/make/manual/make.html) and version control systems (usually, [Git](http://git-scm.com/)), although I often end up thinking that a good workflow woud better be: Do as I say not as I do.

I take notes using plain ASCII text, or [Markdown](http://daringfireball.net/projects/markdown/) (with [Marked.app](http://markedapp.com/) as my main previewer). Most of my reports, articles, posters, or handouts are written using LaTeX or ConTeXt, but I often write directly in Markdown and I let [Pandoc](http://johnmacfarlane.net/pandoc/) post-process them. I also like [Sweave](http://www.stat.uni-muenchen.de/~leisch/Sweave/), [noweb](http://www.cs.tufts.edu/~nr/noweb/), [knitr](http://yihui.name/knitr/), and [pweave](http://mpastell.com/pweave/) a lot.

