+++
title = "OS X Mavericks"
date = 2014-07-27T15:41:33+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here it comes... I got a new MacBook Pro 13. After my longest streak with the [same laptop]({{< ref "/post/welcome-to-the-macbook-air.md">}}) (about 4 years), I decided to upgrade my work environment.

Although the ideas I developed in a previous post on [my default setup]({{< ref "/post/my-setup.md" >}}) haven't changed very much--I am writing this post in Markdown using Emacs, as usual, I must admit I feel the need to upgrade my core system and get a new laptop with more capabilities. So I choose a MacBook Pro 13 Retina, core i7, with 16 Go RAM / 512 Go HD. Well, my first impressions are that it is blazing fast compared to any laptop I worked on in the past. This is not surprising since the 'best' machine I used to use always was some kind of core i2 MacBook Pro or Air.

![Macbook Pro](/img/2014-08-08-20-33-18.png)

As always, I took some notes during the process because it is relatively new to me and I tend to forget what I did after few months. So this post is mainly intended to serve as a log file of my install.


## Using Homebrew

Now, what really changed is that I decided to use [Homebrew](http://brew.sh) instead of compiling everything from scratch like I did during the past 10 years. The fact that I would have to re-install a bunch of software and libraries on a new MacBook has long prevented me from upgrading last year. However, it only took 3-4 hours to get a working workstation the day I got this MacBook, thanks to Homebrew. Everything is installed under `/usr/local/Cellar` and binaries are symlinked to `/usr/local/bin`. So, this does not really make a big difference compared to the way I used to maintain my Mac year after year, except that for now I no longer have to fix myself broken dependencies and tweak Makefile or configure options. Furthermore, I don't have to worry with upgrading current installed packages since Homebrew will take care of that for me, plus I don't have to waste several hours on the internet looking for specific library that compiles fine on all Un*x systems but OS X. The only one thing to do is to update our `PATH` with `/usr/local/bin` coming before `/usr/bin` in order to grab the correct versions of the programs installed by Homebrew. Here are some information on my new system.

```
% brew --env
HOMEBREW_CC: clang
HOMEBREW_CXX: clang++
MAKEFLAGS: -j4
CMAKE_PREFIX_PATH: /usr/local
CMAKE_INCLUDE_PATH: /usr/include/libxml2:/System/Library/Frameworks/OpenGL.framework/Versions/Current/Headers
CMAKE_LIBRARY_PATH: /System/Library/Frameworks/OpenGL.framework/Versions/Current/Libraries
PKG_CONFIG_LIBDIR: /usr/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.9
ACLOCAL_PATH: /usr/local/share/aclocal
PATH: /usr/local/Library/ENV/4.3:/usr/bin:/bin:/usr/sbin:/sbin
% echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin
% zsh --version
zsh 5.0.5 (x86_64-apple-darwin13.0.0)
% emacs --version
GNU Emacs 24.4.50.1
```

Before installing Homebrew, I installed the command-line tools and [XQuartz](http://xquartz.macosforge.org/landing/).

```
% xcode-select --install
xcode-select: note: install requested for command line developer tools
% gcc --version
Configured with: --prefix=/Library/Developer/CommandLineTools/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 5.1 (clang-503.0.40) (based on LLVM 3.4svn)
Target: x86_64-apple-darwin13.2.0
Thread model: posix
% ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
==> This script will install:
/usr/local/bin/brew
/usr/local/Library/...
/usr/local/share/man/man1/brew.1
% brew tap homebrew/science
```

I also installed [Java](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and [TeX Live 2014](https://tug.org/mactex/).

I installed Python 2.7.8 to replace the Python 2.7.5 that shipped with OS X Mavericks. Python packages will go under `/usr/local/lib/python2.7/site-packages`, and I installed the data science stack following [Chris Fonnesbeck's gist](https://gist.github.com/fonnesbeck/7de008b05e670d919b71).

I also found [ggobi](http://www.ggobi.org) (no need to bother with Gtk2, Homebrew will install it right out of the box), [sbcl](http://www.sbcl.org), [pandoc](http://johnmacfarlane.net/pandoc/), and [mu](http://www.djcbsoftware.nl/code/mu/) among the available Brew files. Note that I added formulae from `tap/science`. Whenever there exist Bash or zsh completion files, they are installed in `/usr/local/etc/bash_completion.d` and `/usr/local/share/zsh/site-functions`. The packages that took longer to install were [gnuplot](http://www.gnuplot.info) and [octave](http://www.gnu.org/software/octave/).

```
$ brew install gnuplot --with-x --qt
==> Installing dependencies for gnuplot: lua, libpng, jpeg, libtiff, free

Also installing: fontconfig, freetype, gd.

$ brew install octave
==> Installing dependencies for octave: gmp, mpfr, libmpc, isl, cloog, gcc
```

Not sure about the later: Anyway, gcc and texinfo got installed, and many more: `qhull`, `qrupdate`, `plotutils`, `imagemagick`, `pstoedit`, `epstool`, `szip`, `hdf5`, `ghostscript`, `little-cms2`, `jbig2dec`, `graphicsmagick`, `gl2ps`, `cmake`, `glpk`, `fftw`, `arpack`, `veclibfort`, `suite-sparse`, `tbb`, `qscintilla2`, `pyqt`, `sip`, `qt`, `gnu-sed`. To use the graphic system with Octave, it is possible to either set the environment variable `GNUTERM` or create an `.octaverc` file including the following command `setenv("GNUTERM","aqua")` (or `"qt"`, or `"x11"`), which works quite well once [Aquaterm](http://sourceforge.net/projects/aquaterm/) is installed. There's even a GUI for Octave (use `octave --force-gui`), but I didn't even look at it.

Another interesting fact is that I was able to compile [xlispstat](http://homepage.stat.uiowa.edu/~luke/xls/xlispstat/) in few minutes. Although Homebrew installed readline for me, I still need to use [rlwrap](http://freecode.com/projects/rlwrap) to get command-line history, but this is really a minor issue.

The only software I installed separately were: [R](http://cran.r-project.org), [Haskell platform](https://www.haskell.org/platform/mac.html), [Postgres.app](http://postgresapp.com), [Skim](http://skim-app.sourceforge.net), and [Clozure CL](http://ccl.clozure.com) (from AppStore). I initially installed Emacs 24 from <http://emacsformacosx.com> but then switched to Homebrew's version, which has no problem with [sRGB support](http://goo.gl/sbhvdj). And after having dealt with a monolithic `.emacs` file for 10 years or so, I decided to reorganize my Emacs configuration files in modules. More to come later.

Other software I compiled manually are listed below:

```
$ git clone git://github.com/JohnLangford/vowpal_wabbit.git
$ make
$ make test
$ git clone git://github.com/JuliaLang/julia.git
$ make
```

Beside PostgreSQL, which I installed as a standalone application, I configured [redis](http://redis.io) and [MariaDB](https://mariadb.com) with Homebrew. I followed the detailed instructions on [how to configure MariaDB with Homebrew](http://goo.gl/4vtmKf).

I have used `Terminal.app` and `zsh` but I will eventually switch back to [iTerm](http://iterm2.com). The following picture is my current console that lives next to my running Emacs, and that's almost all that I have actually on my Desktop :-)

![Terminal](/img/20140727153700.png)

(My zsh prompt is quite simple:  
`PROMPT='%F{yellow}[%h] %F{blue}%n@%m (%j) %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%}%(?..%F{red} ★) $(git_prompt_info)
%F{yellow}%#%f '`)

## OS X Mavericks under the hood

It is still not clear to me what's the deal with memory management under Mavericks, but it looks like it has been greatly improved compared to preceding versions of OSX by relying on [compression](http://goo.gl/sMMfhe) and [file caching](http://goo.gl/ri2uum). See also [Get to know OS X Mavericks: Under the hood](http://goo.gl/X11N1b) for a more general discussion on OS X enhancements.

I haven't time to test the use of a second monitor and the updated [fullscreen capabilities](http://support.apple.com/kb/HT5891) for dual display of Mavericks because it requires an HDMI/VGA connector, which I don't have at the moment. Battery life looks impressive (> 10 hours, as reported in the menu bar, although I didn't run any formal test). The built-in monitor is great, although I switched from standard Retina display (1280 pixels wide) to my old 1440 x 900, which I found more comfortable. I don't really like the Notification center but I can live with it. I disabled automatic update because I don't need to be recalled every day that there's something that Apple want to install on my system. Something that is not vry clear to me is the integration of Twitter: I'm using Twitter.app but it seems that Twitter notifications can be fetched by OS X directly, and then they go to the Notification center. It is also possible to tweet directly from Safari or the Notification center. One thing that is quite handy is that Apple improved PDF support and we can now convert everything to PDF, including webpages.

I'm still using `mu` and `offlineimap` to manage my emails from Emacs or a console, but I reconfigured `Mail.app` which offers better support for Gmail, [more or less](https://discussions.apple.com/thread/5468189) (see also [Mail in Mavericks Changes the Gmail Equation](http://tidbits.com/article/14219), with follow-up here: [Mail Improvements in OS X 10.9.2](http://tidbits.com/article/14547)), although it is still unusable in fullscreen mode (How do you search for specific message while writing a new message?). One thing that was annoying me with my previous Mac is that whenever I switched from Wifi to Bluetooth (using my iPhone as a modem) it was unable to reconnect to a wireless network. It looks like it is no longer an issue.

Least interesting is the fact that I now have to deal with Pages 05. I know I can re-install iWork'09 but I don't want to have to manage several versions of the same software--if only we could say these are identical software. So, I'm left with a completely different UI of Pages, with visible improvements but also lot of lost facilities. My main concern is that I can't seem to manage bibliographic entries when writing technical paper since Apple broke their [Apple Script support](http://goo.gl/jxK425) (as used by, e.g., [Pages](http://www.papersapp.com), [Sente](http://www.thirdstreetsoftware.com/site/SenteForMac.html), or [CiteInPages](http://jhh.med.virginia.edu/main/CiteInPages)). That's not a big deal as I mainly use LaTeX adn BibTeX for serious work, but some journals still expect you to submit in Word.


## Conclusion

Overall, I'm happy with this new version of OS X. Despite some minor annoyances I believe the system gained in stability and performance. Since I was able to configure everything very quickly (as a result of relying on Homebrew, not Apple *per se*), without sacrificing to much of my preceding workflows for data analysis and technical writings, I will probably spend less time dealing with installation or upgrade issues. A step towards increased productivity with a system targeting more and more iOS users.
