---
title: "Emacs, 15 years later"
date: 2019-05-13T20:24:05+02:00
draft: false
tags: ["emacs"]
categories: ["2019"]
---

I have been using Emacs almost daily for about 15 years. For the days without, I was probably just away from my computer or working full-time on a task for which no text editor was required.

Well, I started using Emacs on the recommendations of my colleague [Christophe Pallier](http://pallier.org/), who also encouraged me to use R more regularly. At that time, I would not have imagined how much important these tools would be in my daily job. Now, I know, even if I barely use R anymore these days. So, let me thank you again, Christophe! Of course, I've tried many [other text editors](/post/emacs-versus-textmate/), and well, I'm [still using Emacs](/post/why-i-am-still-using-emacs/) after all those years, although I must admit VS Code is a [great editor](/post/vscode-python/) for coding as well.

During the past few days, I have spent some time rebuilding from scratch my Emacs config. It happened because of some sort of procrastination religion that I discreetly practice every 2 or 3 months, and also because I was looking for a faster and ubiquitous way to use Emacs anytime, anywhere, from a simple terminal. Indeed, following my recent move, I spend more time using a shell and CLI-oriented tools than I was beforehand. I have been using Spacemacs for a few months now, and even if it works quite well when launched as `-nw` (i.e., when it is launched in a terminal rather than using the GUI), its startup time is barely acceptable -- unless you launch it once, and make use of Emacs server facilities afterwards. Nope, I wanted something like Vim, or NVim since it is the Vim falvour I am currently being using, and I also spent some time configuring my NVim the way I like it to be. This is it, btw:

![NVim](/img/2019-05-13-21-07-26.png)

However, the Vi philosophy is probably too obscure for me at the moment. It has been going on for at least 10 years so I have little hope that it will ever change. While I like some ideas we found in modal editing, I cannot embrace them all. For instance, let's say I'm editing a simple BibTeX file. This basically is a just a plain text file with fields appearing on separate line. Using Emacs, I can jump to the next field using `C-j` and just go on. I mean, this is part of the writing task: skip the rest of the blank line and move on. I do the same everyday when I write in my notebook. Likewise, `C-e` and `C-a` let you go to the end or the start of the visual line, much like your wrist would do if you were to write by hand. (This also works nicely in Bash or zsh for what matters.) I mean, this really is part of the editing process, and you should not have to rewind your mind, switch to the normal or visual mode for that very specific purpose. Sometimes, modal editing makes more sense, though. For example, let's say I copy/paste (read yank/paste), some code into a Markdown file, I can select the region afterward (this is the visual mode) and indent it accordingly using `>>`.

That's fine. I am aware we can also comment region using `gc` or fold a given block of code using `za`. But, it is all about region we select manually, when we are not involved in editing any text _per se_. What about the line or paragraph we are actually on, trying to find the next word, and then realizing that we just need to pick a quick action, e.g., exchange character at point or comment the whole line? Do I really need to `Esc`ape to perform that action and go back into the editing mode. Maybe I'm just one of the many who think that modal editing is just _evil_.

I ended up installing [Doom Emacs](/post/doom-emacs/) again. That's also fine with me. Doom Emacs comes pre-configured with the [Evil](https://www.emacswiki.org/emacs/Evil) mode. I am not particularly careful when it comes to use different modes in Emacs, as long as I know when I can use standard Emacs commands, or even more standard actions like in any text editor (I'm a happy user of `delete-selection-mode` and `shift-select`). This means that I can perform some actions in _normal_ (saving a file, checking git status, jumping to a definition) or _visual_ (deleting or commenting a region) mode, while spending most of my time using insert mode to write text, to get help on a symbol or to move between chunck of codes. I try to learn a bit of Vim each time, either when I'm using Emacs or when I need to quickly fix something in Vim itself. From within Emacs, I get a shell for free as well. This time I decided to use Eshell full time, and I must admit it's the best of both worlds.

I don't have expansive requirements in terms of a text editor. I just want to be able to move easily between any part of a text file, and to have a few shortcuts under the hood. In my Spacemacs config, I had a dedicated keybinding section for recurrent actions, all binded to a command (⌘) leader key. Here is an excerpt from my `init.el` file:

```emacs-lisp
(global-set-key (kbd "H-b") #'neotree-toggle)
(global-set-key (kbd "H-;") #'evilnc-comment-operator)
(global-set-key (kbd "H-:") #'evil-toggle-fold)
(global-set-key (kbd "H-g") #'magit-status)
(global-set-key (kbd "H-h") #'helpful-at-point)
(global-set-key (kbd "H-u") #'capitalize-region)
(global-set-key (kbd "H-o") #'org-capture)
(global-set-key (kbd "H-t") #'split-window-vertically)
(global-set-key (kbd "H-f") #'helm-find-files)
(global-set-key (kbd "H-,") #'helm-swoop)
(global-set-key (kbd "H-p") #'helm-projectile-ag)
(global-set-key (kbd "H-r") #'query-replace)
(spacemacs/set-leader-keys "so" 'helm-occur)
(spacemacs/set-leader-keys "sz" 'helm-bibtex)
(spacemacs/set-leader-keys "s<" 'xref-find-definitions)
(spacemacs/set-leader-keys "s>" 'xref-find-references)
```

As you can see, I am not particularly demanding.

The good news is that Doom Emacs still favors [ivy](https://oremacs.com/swiper/) in place of [Helm](https://emacs-helm.github.io/helm/). It is way more faster, of course, and less intrusive. I would say you get 80% of the functionalities of Helm for free. My unoptimized Spacemacs config actually means a 10s startup time using Emacs 27; I am done with 1.2s using Doom on an Homebrewed Emacs 26.2. That's ok for me. I get [Cider](https://github.com/clojure-emacs/cider) and SLIME, or its little brother in arms [sly](https://github.com/joaotavora/sly), for free as well. I tried [vlime](https://github.com/l04m33/vlime) but was not very happy with the way we handle REPLs in Vim (much like `:terminal`, btw) -- Vim is still like we have to `C-z` and switch to a proper terminal at some point.

As I said, I would like to keep working in a Terminal as much as possible. This means I need a running Emacs and a standard zsh shell, or two for what matters. Initially, I tried a single one-window configuration in iTerm, with Emacs on top and a tiny but resizeable zsh session below:

![Emacs-nw](/img/2019-05-07-15-31-49.png)

However, I soon realized that it was not very convenient since I need a larger frame for running some tasks in a shell, especially the ones where we get a lot of output printed on `stdout`. So I decided to use two tabs in iTerm: on the first tab, I have Emacs in a single frame, while on the second tab I have two zsh shells -- one occupying 4/5 of the frame, and a tiny one below, to run background jobs or quick actions. I even save this window arrangement using iTerm facilities, so that I won't have to set up everything again. Regarding the color scheme, I use the same in Emacs, Vim and iTerm itself. I learned a few tricks about configuring iTerm as a true 256-color or even 24-bit terminal (which requires to update the `.terminfo`) in passing, but I finally do not need it with the official [Nord theme](https://www.nordtheme.com) for Emacs (the one that comes with [doom-themes](https://github.com/hlissner/emacs-doom-themes) is a bit buggy, IMHO).
