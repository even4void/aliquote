---
title: "Upgrading Context"
date: 2010-04-03T08:43:45+01:00
draft: false
tags: ["tex"]
categories: ["2010"]
---

For some time ago (in fact, since I initially upgraded [Texlive](http://tug.org/texlive/) to the 2009th grinding) I suffered from repeated failures to "properly" compile tex documents with embedded Metapost background. Properly here means that the compilation went fine but the colored backgrounds weren't there. After googling for a possible Metapost bug with the newly released ConTeXt engine, I just realized that the Texlive 2009 distribution does not actually include a useable Mark IV engine.

> The most important motivation for this page is that the TeX Live 2008 edition contains Mark IV, but it is only copied to the installed system, no post-install setup takes place at all. For this Tex Live release, the post-install setup has to be done manually. TeX Live 2009 does not come with a usable Mark IV at all because the luatex on the 2009 editions is too old. Instructions on how to deal with TeX Live 2009 will be added soon.
-- <http://wiki.contextgarden.net/Running_Mark_IV>

Well, Mark IV is the core of LuaTeX processing within ConTeXt, which explains why most of my code fails. I follow the recommendation to upgrade the TDS, but after having upgraded the ConTeXt tree the rough way (i.e., directly using with rsync in the TDS), most of the executables listed in `/usr/texbin` were out. I decide to follow the other instructions on ConTeXt wiki and to install the beta version of ConTeXt in my /usr/local. It happens to be a children's game and I just need to configure my `.profile` (a little bit messy, I must admit). So in short, the procedure is as follows:

```
$ sudo mkdir /usr/local/context
$ chown `whoami` /usr/local/context
$ cd /usr/local/context
$ curl -o first-setup.sh http://minimals.contextgarden.net/setup/first-setup.sh
$ chmod +x first-setup.sh
$ ./first-setup.sh
```
	
To set up the path permanently, add to your bash configuration file:

```
$ echo 'source ~/context/tex/setuptex' >> .bash_profile
```

Next, you can upgrade all package with the [TLMGR](http://tug.org/texlive/tlmgr.html) GUI (installed with Texlive) or directly as follows:

```
$ tlmgr -location http://minimals.contextgarden.net/texlive/beta update --all
```

It is suggested that there is no need to remake formats. However, if necessary, simply run:

```
$ mktexlsr 
$ texexec --make --all 
$ mktexlsr 
$ texexec --make --xtx --all 
$ luatools --selfupdate 
$ mtxrun --selfupdate 
$ luatools --generate 
$ context --make
```

Now, I am able to incorporate MP background again, although I noticed other problem, especially with `dvipdfmx` and `hyperref` when using `biblatex` and `xelatex`. As I am using [Textmate](http://macromates.com/) for texying my files, I need to add this new path to the shell variables since non-cli applications don't have access to the unix PATH variable (and it is boring to set up an environment variable in `~/.MacOSX/environment.plist`).