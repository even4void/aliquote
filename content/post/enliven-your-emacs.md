---
title: "Prettify your Emacs"
date: 2019-09-11T14:48:31+02:00
draft: false
tags: ["emacs"]
categories: []
---

Here are a few tips to brighten up your symbols in Emacs.

<!--more-->

As I am using Doom Emacs, there is now a nice option to use Iosevka with full support for ligatures. Note, however, that you will need to install a [patched version of Iosevka](https://github.com/hlissner/doom-emacs/issues/695), which may not harm your system or other configuration: I use the standard Inziu Iosevka CL in a terminal, and the patched Iosevka in GUI Emacs. Once the font is installed, it is just a matter of adding `(pretty + iosevka)` to your `init.el` to get `pretiffy-mode` in all programming modes, with correct ligatures. The same option is available for Fira Code but I haven't tested it, though.

Now, if you want to add some custom symbols in the `prettify-symbols-alist` variable like, e.g., Eric Kaschalk did ([Mathematical notation in Emacs](http://www.modernemacs.com/post/prettify-mode/)), you could simply use his approach or the one below (which is what I used to use in Spacemacs a few months ago):

```Lisp
(defun my/pretty-symbols ()
  (setq prettify-symbols-alist
          '(("lambda" . 955)
            ("->" . 8594)
            ("=>" . 8658)
            ("map" . 8614)
            ("<=" . 8804)
            (">=" . 8805)
            ("<-" . 8592)
            ("!=" . 8800))))
(add-hook 'clojure-mode-hook 'my/pretty-symbols)
(add-hook 'racket-mode-hook 'my/pretty-symbols)
(add-hook 'ess-mode-hook 'my/pretty-symbols)
```

Most of the above has become useless since `modules/ui/pretty-code/+iosevka.el` in your `.emacs.d` directory handles this for you. However, `+pretty-code-iosevka-font-ligatures` is a`defvar`, which means you cannot update its default values unless you append to it using a `setq`. This is what I finally did, and it went quite smoothly. I also use a [nice trick](https://blog.jft.rocks/emacs/unicode-for-orgmode-checkboxes.html) found on one of Huy Tran's websites,[^1] namely replacing Org checkboxes with Unicode characters. By the way, you may also like his other posts on Emacs, for example [Emacs from scratch](https://blog.jft.rocks/emacs/emacs-from-scratch.html). Other types of customization are discussed on [SO](https://emacs.stackexchange.com/a/45304).

Here is finally what I added to my `config.el` file:

```Lisp
;; -- pretty-code ------------------------------------------------------------
;; Best with custom Iosevka font. See, e.g., https://is.gd/L67AoR
(setq +pretty-code-enabled-modes '(emacs-lisp-mode org-mode clojure-mode
                                   latex-mode scheme-mode racket-mode ess-r-mode))
(setq highlight-indent-guides-responsive 'top
      highlight-indent-guides-delay 0)

;; Org and R additional symbols
;; hex code ▷ (9655), ◇ (9671), ▶ (9654), ƒ (402)
(setq +pretty-code-iosevka-font-ligatures
      (append +pretty-code-iosevka-font-ligatures
              '(("[ ]" .  "☐")
                ("[X]" . "☑" )
                ("[-]" . "❍" )
                ("%>%" . ?▷)
                ("%$%" . ?◇)
                ("%T>%" . ?▶)
                ("function" . ?ƒ))))

;; https://is.gd/3VuSXj
(defface org-checkbox-done-text
  '((t (:foreground "#5a637b")))
  "Face for the text part of a checked org-mode checkbox.")

(font-lock-add-keywords 'org-mode
                        '(("^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
                           1 'org-checkbox-done-text prepend))
                        'append)
;; (custom-set-faces '(org-checkbox ((t (:foreground nil :inherit org-todo)))))
```

If you want to highlight checkboxes using the same color as your TODO header, uncomment the last line.

Overall, I found that my daily log book looks much prettier now.

![](/img/2019-09-11-15-36-04.png)

Likewise, here is some R code stolen from the [magrittr](https://magrittr.tidyverse.org) website and the pipe chapter of [R for data science](https://r4ds.had.co.nz/pipes.html) -- which doesn't mean I became a fan of using pipes in R, but let's pretend we have a decent unicode replacement for `%>%`, `%T>`, and the like:

![](/img/2019-09-11-15-40-16.png)

[^1]: I also found a similar suggestion on [SO](https://emacs.stackexchange.com/a/33402).
