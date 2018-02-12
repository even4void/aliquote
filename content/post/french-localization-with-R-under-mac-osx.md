+++
title = "French localization with R under Mac OS X"
description = ""
date = 2008-05-13T19:59:23+01:00
draft = false
tags = ["apple", "rstats"]
categories = []
+++

Now that I'm working with the latest release of Mac OS X (10.5, aka Leopard), I again face the problem of the french localization of the [R][R] software. It should be noted that I mainly use R in a simple console (the Terminal), rather than the GUI distributed with R. I must say, however, that this GUI is by far the most elegant I saw: Windows GUI is a disaster (!), and there is no GUI available for Linux; in both cases, one can use [JGR][JGR] or similar add-on software. But as I feel most comfortable with the command line, I decide to keep this option.

With my previous system, I have to set up a few parameters to get a correct localization. Indeed, I have to add the `LANG` option, which was not defined on OS X 10.4, and I happen to load it in my `.bash_profile`:

```
export TERM=xterm-color
export LANG=fr_FR.ISO8859-1
```

The Terminal has to be configured to accept western characters (Windows or Latin ISO-8859-1), and I configure this option although I was using [iTerm][iTerm] instead of the Terminal application (which was lacking tabbing support). Furthermore, I have to define the `DISPLAY` in order to get the X11 device working properly. Here is the code I was using:

```
# Set the DISPLAY variable -- works for Apple X11 with Fast User Switching
if [[ -z $DISPLAY &amp;&amp; -z $SSH_CONNECTION ]]; then
  disp_no=($( ps -awx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]" ))
  if [[ -n $disp_no ]];then
    export DISPLAY=${disp_no}.0
  else
    export DISPLAY=:0.0
  fi
  echo "DISPLAY has been set to $DISPLAY"
else
  # we already are under X11 with xterm
  PATH=/usr/texbin:/usr/local/bin:$PATH
  export PATH
  date
fi
```

Now, with OS X 10.5, the X server is launched at boot time, so we don't need to use it anymore. However, we still have to work around the locale because the Terminal application defaults to UTF-8. This is done easily in the Preferences panel of the Terminal app. But, we also need to tell R to use french locales instead of the default UTF-8 ones.

```r
> Sys.getlocale()
[1] "fr_FR.UTF-8/fr_FR.UTF-8/C/C/fr_FR.UTF-8/fr_FR.UTF-8"
> l10n_info()
$MBCS
[1] FALSE 

$`UTF-8`
[1] TRUE

$`Latin-1`
[1] FALSE
```

This can be done with the `Sys.setlocale()` function as explained in the R [Installation and Administration manual][Installation and Administration manual]. Finally, all get properly working after issuing these commands:

```r
> Sys.setlocale(category = "LC_ALL", locale = "fr_FR.ISO8859-1")
> Sys.getlocale()
[1] "fr_FR.ISO8859-1/fr_FR.ISO8859-1/fr_FR.ISO8859-1/C/ fr_FR.ISO8859-1/fr_FR"
```

and I can again import CSV files without problems.

[R]: http://cran.r-project.org
[JGR]: http://rosuda.org/JGR/
[iTerm]: http://iterm.sourceforge.net/
[Installation and Administration manual]: http://cran.r-project.org/doc/manuals/R-admin.html