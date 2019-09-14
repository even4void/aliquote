+++
title = "Git, svn, Emacs and OVH"
date = 2010-07-15T16:40:37+01:00
draft = false
tags = ["misc"]
categories = ["2010"]
[[gallery_item]]
album = "1"
image = "20100714113001.png"
caption = ""
[[gallery_item]]
album = "1"
image = "20100714113010.png"
caption = ""
+++

I happened to setup Git and SVN to work with my web hosting service, [Ovh][Ovh]. This is quite cool because Hosting solutiosn proposed on [GitHub][GitHub] or [Beanstalk][Beanstalk] are not so cheap (if you're interested in having access to private repositories).

<!--more-->

As usual, I found very useful information on the web, especially:

1. [SVN sur Mutu (Ovh)][SVN sur Mutu (Ovh)]
2. [Configuration et utilisation de SVN chez OVH][Configuration et utilisation de SVN chez OVH]
3. [Dépôt Git privé et personnel sur serveur mutualisé OVH][Dépôt Git privé et personnel sur serveur mutualisé OVH]

## SVN

Just follow the instruction from the two first links, then fetch your
repository, and finally add a file:

```
$ touch README
$ svn update
$ svn info
Path: .
URL: [...]
Repository Root: [...] 
Repository UUID: ce3250b1-ac10-4a10-b06f-d376fe3691cb
Revision: 1
Node Kind: directory
Schedule: normal
Last Changed Author: aliquote
Last Changed Rev: 1
Last Changed Date: 2010-07-14 11:25:32 +0200 (Mer, 14 jul 2010)
```

The commit looks like (from `svn log`):

```
------------------------------------------------------------------------
r1 | aliquote | 2010-07-14 11:25:32 +0200 (Mer, 14 jul 2010) | 1 line

test the connexion
------------------------------------------------------------------------
```

and here are the pictures I took from my SVN GUI ([Versions]):

{{< gallery album="1" >}}


## Git

Setting up and iteracting with a working Git repository is far most easier than in the above (to my opinion at least). Indeed, you just have to create a directory on your remote hots (through `ssh` of course), then upload all the stuff, and that's all.

Just initialize an empty repository, and clone it to get a `.git` version:

```
$ mkdir ~//prj_test
$ cd ~//prj_test 
$ touch .gitignore
$ git init
$ git add .
$ git commit -an
$ cd ~/prj_test 
$ git clone --bare . ~/prj_test.git
$ cd ~/prj_test.git
$ git --bare update-server-info
$ cd hooks/
$ mv post-update.sample post-update
$ chmod a+x post-update
```

Now, upload `prj_test.git` to your server (through ftp), then

```
$ git clone ssh://login@hostname.tld/~/prj_test.git
$ touch readme
$ git add readme
$ git commit -an
$ git push
```

Here is how it looks under [GitX]:

![](/img/20100714112228.png)

And if you wonder how easily does Emacs handle Git repositories, let's take a look at the following screenshot from an R tutorial I am currently writing:

![](/img/20100714110203.png)


[Ovh]: http://www.ovh.com
[GitHub]: http://github.com/
[Beanstalk]: http://beanstalkapp.com/
[SVN sur Mutu (Ovh)]: http://guide.ovh.net/SVNMutu
[Configuration et utilisation de SVN chez OVH]: http://www.lezard-rouge.fr/blog/index.php?post/2009/11/Configuration-et-utilisation-de-SVn-chez-OVH
[Dépôt Git privé et personnel sur serveur mutualisé OVH]: http://blog.touv.fr/2009/06/depot-git-prive-et-personnel-sur.html
[Versions]: http://versionsapp.com/
[GitX]: http://gitx.frim.nl/
