+++
title = "OS X Yosemite"
date = 2014-11-04T10:35:51+01:00
draft = false

tags = ["apple"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

I installed [Yosemite](http://en.wikipedia.org/wiki/OS_X_Yosemite) last week on my fresh MacBook Pro, and I must say this is just whooo...

As part of my series of [posts]({{< ref "post/os-x-leopard.md" >}}) on [OS X]({{< ref "post/os-x-lion.md" >}}) [updates]({{< ref "post/os-x-mavericks.md" >}}), here are my very first impressions on OS X 10.10. Note that I never tried any beta versions despite the big buzz surrounding its release, and I just installed the official release from the App Store. Here is how looks desktop as I am writing this post: 

![OS X Yosemite](/img/2014-11-04-13-14-09.png)
<small>(And yes, I just tried the new release of TextMate 2.0 instead of writing in Emacs.)</small>

The UI looks very clean, and this will be a big change for your eyes if you have been using a Mac for several years. Several new features are really good (PDF annotation, Messages transfered automatically from an iPhone to the Mac, dark theme, etc.), and this update comes with critical fixes like broken multi-desktop support. I have nothing to say regarding the brand new font (Apple Helvetica Neue, instead of Lucida Grande) that sits everywhere, although this choice has been [critized by some](http://gizmodo.com/designers-explain-why-apples-new-os-x-typeface-is-a-str-1585123982). Anyway, I like the new look-and-feel of the desktop (including the relooked Dock) and the window management system--though I still use [Moom](http://manytricks.com/moom/) to resize windows. One of my Email add-ons, [CargoLifter](http://www.chungwasoft.com/cargolifter/), was broken after the update, but Apple now provides a way to attach (via iCloud) large documents to email, so this is not a big deal. I had to install a Java6-compatible package from Apple website and Oracle JDK 8 since some of my software (e.g., Mathematica) didn't play well with the new Java version that ships with Yosemite.

I followed some Homebrew-related advices that I found on Google and updating my system took something like two hours. But after the update everything was fine, and no program was broken.

I updated part of my workflow. I now pick up R from Homebrew, because I finf it more convenient to update everything with `brew`. However, I had to reinstall all packages that include compiled C or Fortran code. I no longer have R GUI but I never really used it: I have Emacs + ESS and RStudio for coding in R. One minor issue was to symlink `/opt/X11` to `/usr/X11` to resolve some problem with `fontconfig` or `tcltk` (not sure for the later, though).

For Julia, rather than recompiling each time from my local GitHub repository, I decided to fetch a Homebrew version, thanks to Zachary M. Jones's nice post on [Setting up OSX for Data Analysis](http://zmjones.com/mac-setup/).

```
% brew tap staticfloat/julia
% brew install --HEAD --64bit julia
```

I had some problems with the `--HEAD` option, so that I ended up installing the base version. But I'm not very happy with that solution: (1) this is Julia 0.3.2 while I had `Version 0.4.0-dev+817` (2014-09-28 15:29 UTC); (2) this installed a bunch of software suffixed with `-julia` in my `/usr/local`. 

```
% brew deps julia
fftw
gcc
git
gmp
libffi
mpfr
pcre
pkg-config
python
staticfloat/julia/arpack-julia
staticfloat/julia/cloog018-julia
staticfloat/julia/gmp4-julia
staticfloat/julia/isl011-julia
staticfloat/julia/llvm33-julia
staticfloat/julia/openblas-julia
staticfloat/julia/suite-sparse-julia
```

Again, not a big deal, but given that Julia packages are incompatible between both version, I will probably keep my Git version until a Homebrew formula becomes available for the 0.4 branch.

I stopped using Apple version of GNU coreutils and set up Homebrew's version at the top of my path in my `.zshrc`:

```
## GNU coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
```

Now, when viewing Man pages I get the GNU version instead of the BSD one.

![Viewing GNU man pages](/img/2014-11-04-13-26-25.png)

Otherwise, I installed a [bunch of software]({{< ref "post/useful-mac-apps-for-data-scientists.md" >}}) and picked up some nice configuration files from [Mathias Bynens' GitHub](https://github.com/mathiasbynens/dotfiles). In passing, I updated the default icon for Emacs once I saw this Tweet:

{{< tweet 527983358081376258 >}} 

