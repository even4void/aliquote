+++
title = "lost+found 2016"
date = 2018-01-21T19:28:46+01:00
draft = false

tags = ["misc", "emacs"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Here are some draft notes, written in 2016, unfilled but not lost forever. With slight edits to accomodate a proper archive blog post.

## Docker
<small>(August 2016)</small>

[Docker][docker] allows to wrap software into a dedicated filesystem available on a server without having to build a complete virtual machine (VM) with its own operating system (OS). Docker containers can thus run as isolated processes on any computer and any OS.

### Getting started with Docker

There are actually two options to install Docker on a Mac: [Docker Toolbox][docker-toolbox] and [Docker for Mac][docker-mac]. The latter does not need to have [Virtual Box][virtual-box] installed since it relies on [Hyperkit][hyperkit] instead.

If everything went fine, we should be able to query Docker version at the shell prompt:

```
% docker --version
Docker version 1.12.0, build 8eab29e
```
(Omitting the `--` results in a more verbose output.)

Now, with `docker run hello-world` we can confirm that everything is working as expected. Finally, to check that the ngynx server is also working we can just type:

```
% docker run -d -p 80:80 --name webserver nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
```

As in the previous case, Docker will pull the relevant image from the internet, or more precisely the [Docker Hub][docker-hub]. This may take some time depending on your internet connection. The VMs are installed in `~/Library/Containers/com.docker.docker/`. It should be noted that this is not reported by `docker info`. We now have a running instance of Docker as shown below:

```
% docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                         NAMES
706c4d957b24        nginx               "nginx -g 'daemon off"   13 minutes ago      Up 13 minutes       0.0.0.0:80->80/tcp, 443/tcp   webserver
```
(For whatever reason, I couldn't check that ngynx is working on `http://localhost` using Emacs `eww` and I had to launch my browser.) 

To stop the running container, we just use the following command:

```
% docker stop 706c4d957b24
```

where `706c4d957b24` is the contained id that `docker ps` displayed (assuming we didn't set a name--using the `--name` switch--when launching the container).

Well, that's pretty all we need to know to start from scratch with Docker.


## Spacemacs
<small>(March 2016)</small>

As discussed in many posts of mine, I am a big fond of GNU Emacs. I use it all the time in my daily work. Last year I was just saying that [I will stay with my Homebrewed Emacs][emacs] and my own configuration. I finally resign, like I did before when I decided to switch to Homebrew instead of compiling everything from scratch on my Mac. The main reasons are: I no longer need to keep an eye on what best packages do exist for specific tasks since Spacemacs, Prelude or other Emacs distribution will likely include them in their core packages; I also don't need to worry about updating my whole `emacs.d`, since those same distributions usually allow to update everything quite easily.

In the mean time, I found interesting blog posts like [Spacemacs for 2016][milosophical] or [Org mode and Pandoc][rousette] where authors describe their experience with Spacemacs.

Everything seems to work right out of the box. A quick check allowed me to confirm that Slime and CIDER can be directly fired from a Lisp or Clojure buffer, while IPython is the default REPL that is launched when visiting a Python file. Spacemacs relies on [anaconda mode][anaconda-mode] (not to be confused with [Anaconda Python][anaconda]) which was a little bit tricky to configure (I ran into trouble with Homebrew Python and then once I installed Anaconda Python, with `pip` itself[^1]; but see [this discussion][issue2917]). Most important to me is the ability to use [ESS][ess] to manage my statistical projects, and it also proved to work quite smoothly.

![Spacemacs in 2016](/img/2016-05-05-12-38-17.png)

Some key features are highlighted below:

- **Emacs editing mode:** Of course, I stay on holy mode, because I know nothing about Vim and I don't want to learn a new set of key habits (especially modal interaction with my text editor). So I know that I can find everything with `M-x`, as before, but that I now benefit from `M-m` and `Esc-m`, and much more thanks to [Helm][helm] and [which key][which-key], but see my next point.

- **Helm and which key:** I think Spacemacs is just an incredible idea (for Emacs users at least) because it offers a great UI while maintaining availbale key bindings. You don't need to learn anything except that you just want to forget about your `.emacs` or `init.el` config file, and replace it with `.spacemacs` (or [something else][emacsd] if you like). Now, you get additional pleasure: `M-m` (so-called [leader key][leader]) will trigger a dedicated Helm mini-buffer

    ![Spacemacs and which-key](/img/2016-05-05-12-26-28.png)
    
    Beside Helm completion mini-buffer, Spacemacs also provide so-called micro states, which allows to perform quick repetitive action, e.g. dealing with buffers, by simple key presses.

- **Documentation:** The documentation is, well, just great. Everything comes as [Org][org]-formatted files, and it is readily available *via* `M-m h SPC` (or, we can just press the `F1` key to get a series of help-related commands).

- **Layers:** I really like the concept of layers: packages are loaded on demand and can be updated very easily.

- **Gorgeous themes:** just add `themes-megapack` to your configuration layer and you get some 100 dark or light themes for Emacs, but see this [online gallery][themes] for an overview. I personally use the [atom-one-dark-theme][one-dark] (with [Source Code Pro][source-code], 13pt), and this can be added to the 'additional packages' layer.

- **Syntax checking and spell checking:** They are available via simple 'Toggle' (`M-m t s` or `S`)

- **Workspace and layouts:** A combination of latest Spacemacs persp-based layout and eye-browse

- **Update packages and Spacemacs:**


[^1]: And then with Python 3.5, which was installed as the default Python interpreter by conda, because I use [offlineimap][offlineimap] to fetch my email on my local HD (and [process them with mu4e][mu4e]) and it is not compatible with Python 3.5, sigh. Maybe I should just switch to [mbsync][mbsync] or [imapfw][imapfw], which might replace offlineimap at some point.


[docker]: https://www.docker.com
[docker-toolbox]: https://docs.docker.com/v1.10/mac/step_one/
[docker-mac]: https://docs.docker.com/docker-for-mac/
[virtual-box]: https://www.virtualbox.org
[hyperkit]: https://github.com/docker/HyperKit/
[docker-hub]: https://hub.docker.com
[cogmaster]: http://cogmaster-stats.github.io/site/
[openintrostat]: http://www.openintro.org/stat/
[lsr]: http://health.adelaide.edu.au/psychology/ccs/teaching/lsr/
[maa]: http://www.maa.org/publications/maa-reviews/modern-statistics-for-the-social-and-behavioral-sciences-a-practical-introduction
[Spacemacs]: http://spacemacs.org
[emacs]: {{< ref "/post/why-i-am-still-using-emacs.md" >}}
[milosophical]: http://milosophical.me/blog/spacemacs-00.html
[rousette]: http://www.rousette.org.uk/blog/archives/org-mode-and-pandoc/
[anaconda-mode]: https://github.com/proofit404/anaconda-mode
[anaconda]: https://www.continuum.io
[issue2917]: https://github.com/syl20bnr/spacemacs/issues/2917
[helm]: https://emacs-helm.github.io/helm/
[which-key]: https://github.com/justbur/emacs-which-key
[emacsd]: http://emacs.stackexchange.com/q/19936
[leader]: https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#emacs
[org]: http://orgmode.org
[ess]: http://ess.r-project.org
[themes]: http://themegallery.robdor.com
[one-dark]: https://github.com/jonathanchu/atom-one-dark-theme
[source-code]: https://github.com/adobe-fonts/source-code-pro
[offlineimap]: https://github.com/OfflineIMAP/offlineimap
[mu4e]: {{< ref "/post/using-mu-to-manage-e-mails.md" >}}
[imapfw]: http://imapfw.offlineimap.org
[mbsync]: http://isync.sourceforge.net
