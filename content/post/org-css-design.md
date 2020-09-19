---
title: "Org custom CSS"
date: 2020-09-18T10:05:21+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

I redesigned the Org CSS default settings I used to use when I worked on my [Stata handouts](/articles/stata-sk/) two years ago. I've been looking for a clean and responsive CSS sample for a while now. There exist some nice implementations here and there, but I never found one I really like. This was not really a problem when I was using Pandoc as my main exporter for Org documents, but Pandoc template generally do not support Org specific keyword (e.g., todo items) and this never works with Babel, so this is not a valid option when exporting evaluated code block.

Since I lifted my Emacs packages and remove `ox-pandoc`, I'm left with basic HTML and PDF export. I'm done with PDF export settings since I now use a customized [Tufte handout](/post/emacs-org-tufte-handout/) template. The Github-inspired CSS I was using for HTML was less polished than the one we have for Pandoc, so I'm left with this default template that I hope you will find good enough, but see below (left is on full screen, right is for mobile device). The table of contents is managed using code found on the [Worg](https://orgmode.org/worg/) site, but only for large displays. In case you're interested, here is the [source file](/pub/worg.css).

{{< fluid_imgs
"pure-u-1-2|/img/2020-09-18-17-22-23.png"
"pure-u-1-2|/img/2020-09-18-17-22-33.png" >}}

So far so good. There are still things I'm working on, but for the moment it's usable. Regarding tables, I devised a simple scheme to make them look close to booktabs-style table in Latex. Here is a comparison of HTML (left) and PDF (right) rendering:[^1]

{{< fluid_imgs
"pure-u-1-2|/img/2020-09-19-16-15-50.png"
"pure-u-1-2|/img/2020-09-19-16-27-44.png" >}}

I was also wondering whether this stylesheet could be used with RMarkdown-like document --- I don't really know how we would call this when we are using Org babel: ROrg? BabelR? Several [years ago](/post/org-mode-literate/) I was already thinking of replacing RMarkdown with Org, and now I am about to replace everything Markdown with Org.

So I quickly rewrote one of my old Markdown [handout](https://github.com/even4void/rstats-biostats/blob/master/handout/practical01.Rmd) in Org format. I used Pandoc to convert the original Md file into an Org file, which I edited afterwards. This means replacing `BEGIN_EXAMPLE` with `BEGIN_SRC` where appropriate and adding a bit of options to process each chunk. In org, we can define a global header that will apply to all SRC block, then refine individual ones with additional options. This is particularly useful to mimic part of [knitr](https://yihui.org/knitr/) setup.

```
#+PROPERTY: header-args:R :session *R* :exports both :results output
```

This means that instead of adding `:session *R* :exports both :results output` to each SRC header, we can just apply this globally. Images are handled quite nicely when using RMarkdown, but we have some options in org as well. here is the basic ones I use:

```
#+BEGIN_SRC R :file 001.png :results graphics file
--%<--- (snip) --->%--
#+END_SRC
```

A final note: The HTML `pre` block behave strangely in some case (e.g., you'll get a lot of whitespaces before the first instruction in the SRC block), so I added the following piece of code in the CSS template:

```css
pre.src {
  background-color: #f8f5ec;
  white-space: pre-line;
}
```

The final output is [here](/pub/practical01.html) ([source](/pub/practical01.org) file). Now the only thing left is to implement my custom [Beamer template](/post/latex-beamer-21-century/) in Org.

[^1]: I know [booktabs](https://www.ctan.org/pkg/booktabs/) use different line heights for the header (i.e., the top line is thicker), but it's quite difficult to replicate this behavior in CSS unless we are sure we have a footer: In this case we don't need to apply a `table tr:last-child` rule to manage the bottom line of the Table since it could be handled by etting a `border-top` property in the `tfoot` rule.
