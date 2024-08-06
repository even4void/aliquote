---
title: "A modular configuration for Emacs"
date: 2014-08-04T15:14:17+01:00
draft: false
tags: ["emacs", "apple"]
categories: ["2014"]
---

In this post I describe how I decided to organize by Emacs configuration files after having used for more than 10 years a monolithic `.emacs` file.

There are many ways to configure Emacs, but you always need an init file. Several 'ready-to-use' system have been proposed, including [starter-kit](https://github.com/technomancy/emacs-starter-kit), [prelude](https://github.com/bbatsov/prelude), and various flavours based on those packaging systems (e.g., Eric Schulte's [Starter Kit for Emacs 24](https://github.com/eschulte/emacs24-starter-kit), Kieran Healy's [Starter Kit for the Social Sciences](http://kieranhealy.org/resources/emacs-starter-kit/), or Xiao Hanyu's [oh-my-emacs](https://github.com/xiaohanyu/oh-my-emacs) inspired by [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh); see also [Where I can find the most popular Emacs settings?](http://goo.gl/QLpbuU)). I don't really like the way they often are introduced--"to provide Emacs better defaults"--since Emacs is what it is and you are free to customize it the way you like. After all, Emacs default configuration is already a good one, compared to many other free Text editor (and yes, I know, "Emacs is not just a Text editor").

I've tried two Starter Kits and [prelude](https://github.com/bbatsov/prelude), but (1) nothing works right out of the box, and (2) I dislike using pre-configured packages because I know I will spend more time tweaking their many options than writing a set of configuration files myself. This is not to say that these are bad frameworks. They are just bad for me, because I know I will learn nothing from copying them into my `.emacs` directory, or I will spend too much time parsing hundreds of Elisp files. Moreover, there are many Emacs modes that I don't need (basically, I mainly work with R, Python, lisp, Markdown, and shell), and other settings I am not used to when it comes to handle text stream in Emacs. However, I very much appreciate the work made by others--especially the litterate programming approach based on org-mode by Eric Schulte, and I must acknowledge I shamelessly copy/paste many of Elisp instructions in my own `.emacs` for years. Now, I was just feeling it really is time to build my own set of configuration files.

Here is how looks my Emacs at the time I am writing this post (with [Gruber theme](https://github.com/rexim/gruber-darker-theme)), with an R script and an [IBuffer](http://www.emacswiki.org/emacs/IbufferMode):

{{< figure src="/img/2014-07-27-14-43-49.png" >}}

{{% alert note %}}
This is very much work in progress and things will probably change a little. I will eventually post this Emacs config files on GitHub.
{{% /alert %}}

## A modular approach to package management

In a [related post](/post/os-x-mavericks) I described how I configured my new MacBook Pro by using [Homebrew](http://brew.sh). This took me half a day before a trip to Utrecht. It took me a couple of hours to build a whole directory of Elisp files to manage my final Emacs configuration. Let's start by taking a look at what is finally included in my `~/.emacs.d` directory:

```
% tree -d -L 1
.
├── auto-save-list
├── cache
├── elpa
├── modules
├── snippets
├── var
└── vendor

7 directories
% ls 
README         cache          init.el        snippets       vendor
auto-save-list elpa           modules        var
```

The `init.el` file is quite simple: it consists in initializing Emacs package manager, define a series of required packages (if they are not installed, they will be installed when Emacs starts) and some specific directories, and finally launch Emacs daemon in order to ensure that we can connect to the running instance of Emacs through `emacsclient`.[^1]

```lisp
;; Init package manager and set up ELPA repository
(require 'package)
(setq package-archives
      '(("marmalade" . "http://marmalade-repo.org/packages/")
        ;; ("tromey" . "http://tromey.com/elpa/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(markdown-mode ido-ubiquitous ess mode-compile
                      ac-python ac-math ac-nrepl git-gutter-fringe
                      ibuffer-git elpy slime offlineimap
                      geiser ac-geiser quack elisp-slime-nav
                      scala-mode2 sbt-mode smex
                      cider cider-tracing auctex
                      clojure-mode coffee-mode pandoc-mode
                      deft gist haskell-mode flx-ido
                      magit smartparens projectile python
                      auto-complete exec-path-from-shell)
  "A list of packages that will be installed if not present when firing Emacs")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Define top-level, vendor and custom files
(defvar emacs-dir (file-name-directory load-file-name)
  "Top level Emacs dir.")
(defvar vendor-dir (expand-file-name "vendor" emacs-dir)
  "Packages not yet available in ELPA.")
(defvar module-dir (expand-file-name "modules" emacs-dir)
  "Personal stuff.")
(defvar save-dir (expand-file-name "cache" emacs-dir)
  "Common place to save Emacs save/history-files.")

;; Add to load path
(unless (file-exists-p save-dir)
  (make-directory save-dir))
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))

;; Launch Emacs as daemon
(require 'server)
(unless (server-running-p) (server-start))
```

Here, I defined four custom directories: `emacs-dir` is the root directory, `vendor-dir` and `module-dir` directories are where packages will be installed, and `save-dir` will be the general place where cache and history files will be stored.

Then, I wrote several Elisp files (list is growing) to customize different modes (e.g., general lisp, Clojure, Python), but the most important ones are `ui.el` and `text.el`, where default options for Emacs look-and-feel (including general theme options) and text handling are defined.

```
% ls modules
my-ac.el      my-email.el   my-git.el     my-octave.el  my-project.el 
my-scheme.el  my-tex.el     my-ui.el      my-cc.el      my-ess.el
my-lisp.el    my-osx.el     my-python.el  my-shell.el   my-text.el
```

Autocomplete is enabled for most programming languages, and I make heavy use of Eldoc, Outline, and Ido/smex. All temporary or history files are saved in the `cache/` directory, which avoids to clutter my user directory or the `.emacs.d/` folder itself. Although I do not use [better-defaults](https://github.com/technomancy/better-defaults), I think I setup almost everything as suggested by Phil Hagelberg. I do not make use of Yas-snippet, but it is required by Python [elpy](https://github.com/jorgenschaefer/elpy/). At some point, I will probably remove this dependance. I'm quite happy with how things are working now. Regarding Lisp dialects (Common Lisp, Clojure, and Scheme), I have the following settings:  [my-lisp.el](/pub/my-lisp.el) and [my-scheme](/pub/my-scheme.el). Note that I configured Slime in both cases (i.e., with SBCL and with Chicken Scheme). Finally, as can be noted in one of the first output above, I still have to manage how to put this `auto-save-list` folder into the right place (`cache/`), but that's a minor issue.


At some point, I should probably give [Helm](http://tuhdo.github.io/helm-intro.html) a try. However, I do not really like when there's too much fuzzy completion. As long as I can keep it simple and have access to my favorite commands within few keystrokes, I'm happy with my current configuration.


## Sidenote

I was thinking I could organize R packages into two different folders: `core/` where most used and reliable packages would go and `sandbox/` where I would copy packages that I barely use or that I just installed to check some functions. This bears some idea from `devtools::dev_mode()`, except that all packages will be listed under `.libPath()`, and thus available at any time. However, this would greatly simply their updating since I could just list the 'core' packages in a separate text file that I could pass to `install.packages()` when I need to update only those packages or for a brand new installation of R.


[^1]: Actually, for testing purpose I also installed some packages by hand (`M-x list-packages-install`), and I added them back to my list of default packages. This is why using a simple text file with the name of packages would be a better alternative.
