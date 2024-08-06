---
title: "Why I am still using Emacs"
date: 2015-08-15T15:11:20+01:00
draft: false
tags: ["emacs", "apple"]
categories: ["2015"]
---

Some months ago I noticed the release of a new text editor which was supposed to bring the best of both world, Emacs and Vim, but see [Spacemacs - First Impressions From an Emacs Driven Developer](http://jr0cket.co.uk/2015/08/spacemacs-first-impressions-from-an-emacs-driven-developer.html) for a recent review.

## Spacemacs

I tried [Spacemacs](https://github.com/syl20bnr/spacemacs) yesterday and I must say this should be great for people used to Vim modal approach to interacting with buffer and text. However, I feel like it is too much for Emacs users (even with the [Holy mode](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#holy)), and I stand on my [custom settings](/post/a-modular-configuration-for-emacs). These are certainly not the best ones, but this configuration suits my needs and that's all that matters after all! I should probably update my configuration with the [use-package macro](https://github.com/jwiegley/use-package), which allows lazy loading of packages among (so many) other things, but I do not have much time at the moment. This is indeed another great advantage of Spacemacs: it is super fast!

I must admit that the Spacemacs UI is really well designed, especially the [modeline](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#mode-line), and the concept of general and private layers. The core packages are available in [spacemacs/package.el](https://github.com/syl20bnr/spacemacs/blob/master/spacemacs/packages.el); as can be seen, the authors choose some of the best packages around the ones available on MELPA. Regarding Spacemacs modeline, I found a lot of discussion on the internet (e.g., on [reddit](https://www.reddit.com/r/emacs/comments/36qo2l/i_tried_to_copy_the_spacemacs_powerline_theme_my/)) because people seem to enjoy a lot its look-and-feel. I even found [one implementation](https://github.com/ashutoshrishi/emacs-personal/blob/master/personal/theming.el) of Spacemacs modeline, although it is likely that a dedicated package will be release by the Spacemacs team in the near future.

{{< figure src="/img/spacemacs-python.png" >}}

Since I am not a Vim user, I cannot tell whether Spacemacs can lead Vim users to switch to Emacs, or pure Emacs addicts to adopt Spacemacs. I for one find difficult to work with an already customized text editor: I need to do it myself, in order to understand how everything works or what I may be missing. Anyway, having played with Spacemacs for 3-4 hours I thought it would be good to update my own Emacs.


## Some updates

Why am I still using Emacs? Well, I guess this is always the [same story](/post/writing-a-book).

I decided to use [company](http://company-mode.github.io) and get ride of auto-complete. I am aware of the [pros and cons](https://github.com/company-mode/company-mode/issues/68) but I wanted to give it a try really. I also decided to use [Helm](https://emacs-helm.github.io/helm/) in addition to [ido](http://emacswiki.org/emacs/InteractivelyDoThings). It can be used together with `company`, [dash](https://github.com/areina/helm-dash) (be sure to use the built-in `eww` browser instead of default OS application) and [projectile](http://batsov.com/projectile/). I also added [neotree](https://github.com/jaypei/emacs-neotree) (with `ascii` theme) and [anzu](https://github.com/syohex/emacs-anzu). I enabled [flycheck](http://www.flycheck.org) globally and added R support via [lintr](https://github.com/jimhester/lintr) (in fact, this is managed by ESS directly, so we just need to install the R package). I customized the flycheck modeline by following [Sebastian Wiesner](http://www.lunaryorn.com/2014/07/30/new-mode-line-support-in-flycheck.html)'s example. I also found a pretty low-contrast theme: [apropospriate](https://github.com/waymondo/apropospriate-theme).

Finally, I upgrade Emacs to the latest development version (this was required to get projectile to work anyway, see [this issue](https://github.com/bbatsov/projectile/issues/780)):

```
% brew install emacs --HEAD --use-git-head --with-cocoa --srgb
% emacs --version
GNU Emacs 25.0.50.1
```

I noticed that Homebrew now provides a direct link for running emacs in a Terminal (`/usr/local/Cellar/emacs/HEAD/bin`), although I am still using this little Bash script (`/usr/local/bin/emacs`):

```
#!/usr/bin/env bash
exec /usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw  "$@"
```

Here is how my Emacs looks like by now: 

{{< figure src="/img/emacs.png" >}}

My modeline is much less developed but I am happy with it. Here is what I have in some of my configuration files:

```emacs-lisp
(require 'powerline)
(powerline-vim-theme)
(global-anzu-mode +1)

(require 'inbox)
(display-inbox-mode)

(require 'window-numbering)
(window-numbering-mode)

(require 'delight)
(delight '((company-mode " Ⓐ" company)
           (hs-minor-mode " ⓗ" hideshow)
           (outline-minor-mode " Ⓞ" outline)
           (outline-mode " Ⓞ" :major)
           (git-gutter-mode " Ⓖ" git-gutter)
           (flyspell-mode " Ⓕ" flyspell)
           (smartparens-mode " Ⓢ" smartparens)
           (elisp-slime-nav-mode nil elisp-slime-nav)
           (ess-noweb-font-lock-mode nil ess)
           (reftex-mode " Ⓡ" reftex)
           (visual-line-mode " Ⓦ" simple)
           (ess-noweb-mode " Ⓝ" ess)
           (anzu-mode " Ⓩ" anzu)
           (abbrev-mode " ⓐ" abbrev)
           (helm-mode " Ⓗ" helm)		
           ))

(setq flycheck-mode-line
      '(:eval
        (pcase flycheck-last-status-change
          (`not-checked nil)
          (`no-checker " -")
          (`running (propertize " ✷" 'face 'success))
          (`errored (propertize " !" 'face 'error))
          (`finished
           (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
                  (no-errors (cdr (assq 'error error-counts)))
                  (no-warnings (cdr (assq 'warning error-counts)))
                  (face (cond (no-errors 'error)
                              (no-warnings 'warning)
                              (t 'success))))
             (propertize (format " %s/%s" (or no-errors 0) (or no-warnings 0))
                         'face face)))
          (`interrupted " -")
          (`suspicious '(propertize " ?" 'face 'warning)))))

(setq projectile-mode-line '(:eval (format " :%s:" (projectile-project-name))))
```

Briefly, `powerline` let me customize the modeline a bit, while `window-numbering` allows me to jump to any window with `M-x [0-9]` where `[0-9]` is a number assigned to any new window. The [inbox.el](https://gist.github.com/gl-sergei/1986989ad3c2024f8150) file provides a handy minor mode that displays the number of unread messages from [mu](http://www.djcbsoftware.nl/code/mu/). I just replaced the default text by a tiny UTF-8 character. Finally, I rely on [delight](http://www.emacswiki.org/emacs/DelightedModes#toc3) (instead of [diminish](http://www.emacswiki.org/emacs/DiminishedModes)) to display a light indicator for minor and/or major modes in the modeline. All in one, I have access to the information I need when editing text files, and this basic setup works when Emacs run in a terminal.


