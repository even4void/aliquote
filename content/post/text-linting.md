---
title: "On text linting"
date: 2020-05-29T10:33:29+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

Doom Emacs comes with a lot of predefined customizations for writing prose using Markdown or Org. This ranges from highlighting or hiding (concealing) elements of the markup language itself, like replacing header marks with custom bullets in Org mode, to handy utilities for syntax and spell checking. The later are now available in a custom layer:

       :checkers
       spell
       grammar
       (syntax +childframe)

The `spell` module takes care of activating Flyspell in `text-mode`, while `grammar` adds [languagetool](https://languagetool.org/) and [writegood-mode](https://github.com/bnbeckwith/writegood-mode) to the spell checker. I added the [guess-language](https://github.com/tmalsburg/guess-language.el) package because I was tired of switching from one dictionary to the other depending on the buffer I was editing. It works pretty well, although this package doesn't honor local variable, e.g. `# -*- ispell-dictionary: "french" -*-` on the first line of an Org buffer to switch to a French dictionary. Enough for spell checking, let's see what's going on with syntax checkers.

Of course, syntax checkers are mostly used in `prog-mode`, think of [eslint](https://eslint.org) or [lintr](https://github.com/jimhester/lintr), for instance. They are well integrated into Flycheck nowadays. Note that some of the available linters offer both a checker and a way to automatically fix any error that was encountered during the checking stage. Anyway, syntax checkers are also available for `text-mode`, e.g. Markdown and Org (but also ResT or Asciidoc). In Doom Emacs, [proselint](https://github.com/amperser/proselint) is the default checker for Org mode, while for Markdown you can install [markdownlint](https://github.com/DavidAnson/markdownlint) -- this is what I use at the moment -- or [mdl](https://github.com/markdownlint/markdownlint).

![markdownlint](/img/2020-05-29-15-06-16.png)

Proselint is great,[^1] but there's another option for text processing, namely [textlint](https://textlint.github.io). It is a Node-based package, and you need to define your own set of rules and to install each component manually, but it is more versatile than Proselint in my view. You can even install plugin for `languagetool,` weasel-related stuff (like `writegood-mode`), or [proselint](https://github.com/textlint-rule/textlint-rule-proselint) itself. The config file is where you define rules and plugins to use. If you want to make textlint recognize Org document as text file, you will need to add these lines in you `.textlintrc` file:

    "plugins": {
        "@textlint/text": {
            "extensions": [".org"]
        }
    }

The full [list of rules](https://github.com/textlint/textlint/wiki/Collection-of-textlint-rule) is available on Github, and you can define your own rules if you like. Of course, specific rules can be defined on a per project basis. Here are the rules that I find particularly useful: abbr-within-parentheses, max-comma, no-todo, unexpanded-acronym, en-max-word-count, diacritics, @textlint-rule/no-invalid-control-character", terminology, max-doc-width, stop-words, common-mispellins. Here are other suggestions: [A textlint flycheck checker in Emacs](https://www.macs.hw.ac.uk/~rs46/posts/2018-12-29-textlint-flycheck.html). Textlint is also able to check invalid URLs for you, see [textlint-rule-no-dead-link](https://github.com/textlint-rule/textlint-rule-no-dead-link). As a final note, consider adding the option `"severity" : "warning"` to some of the "minor" rules, otherwise you're likely to end up with a lot of errors which aren't truly errors (at least in my opinion).

[^1]: At the time I write this post, it sucks with `org-capture` and throws an error that I was not able to resolve, but it works with standard Org buffers.
