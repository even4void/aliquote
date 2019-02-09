---
title: "Org mode versus Markdown"
date: 2019-02-09T16:48:00+01:00
draft: false
type: "tweet"
---

The more I use Org for authoring simple or more complex text documents, the more
I like. I like to think of it as Markdown with better markup for links, code
blocks, tables, and references, and of course there's Emacs inline preview.
Except for collaborating with colleagues or drafting short RMarkdown documents,
I mostly stopped using Markdown these days. Maybe I should just revisit some old
Md files and just [convert them to Org](https://emacs.stackexchange.com/a/41619).

```emacs-lisp
(defun markdown-convert-buffer-to-org ()
    "Convert the current buffer's content from markdown to orgmode format."
    (interactive)
    (shell-command-on-region (point-min) (point-max)
                             (format "pandoc -f markdown -t org -o %s"
                                     (concat (file-name-sans-extension (buffer-file-name)) ".org"))))
```

See also: [Org-Mode Is One of the Most Reasonable Markup Languages to Use for
Text](https://karl-voit.at/2017/09/23/orgmode-as-markup-only/).
