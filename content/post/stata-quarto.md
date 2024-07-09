---
title: "Stata and Quarto"
date: 2024-07-09T20:48:03+02:00
draft: false
tags: ["stata"]
categories: ["2024"]
---

I'm a bit late with [Quarto](https://quarto.org/), which I only started to use a few months ago. I've heard good news about this new rendering engine for literate coding on Frank Harrell's blog, but since I rarely write RMarkdown reports these days, I tested the command-line program and then just forgot about it.

However, a few days ago I came across a Neovim plugin which offers all the goodies you might expect to render and/or preview Quarto documents from Neovim directly. I think I found it when browsing about use cases for [molten-nvim](https://github.com/benlubas/molten-nvim) that I finally kept in my toolbox (I'm rather thrifty in this respect since I only have 8 plugins in my `pack` folder -- no plugin manager, no nvim-lspconfig!). I don't really care about the plugin itself since I manage to write a one-liner compiler for Vim:

```
silent CompilerSet makeprg=quarto\ render\ %\ --to\ $*
```
<small>I don't really care about messing up with the `erroformat` since quarto will stop running after the first error.</small>

And for the remaining stuff, I just add `set ft=markdown` and `runtime! ftplugin/markdown.vim` to my `after/ftplugin/quarto.vim` config. That's all folks!

Anyway, great news for Quarto users using Stata with version below 17: you can declare [stata_kernel](https://kylebarron.dev/stata_kernel/getting_started/) as a custom kernel rather than the default [nbstata](https://hugetim.github.io/nbstata/). Since I only owe a license for Stata 13 MP, I don't know what's new in the Stata world other than what I read on the www, but it works perfectly well, including graphical output. This was the most cumbersome thing I ahppened to deal with when I was writing my [Stata Starter Kit](https://aliquote.org/articles/stata-sk/) using org-mode some years ago. Since I'm using Stata 13, I needed to export graphics as encapsulated PS file, and then convert them to PNG files. Of course this was automated via a Makefile, but when you find that a version number (13 < 14) prevents you from exporting your figures as PNG or SVG files, it really sucks. Now it's all over, and I can just write Stata code and let Quarto produce a well-formatted PDF or HTML file using Pandoc. MRE follows.[^1]

    ---
    title: Hello Stata
    author: chl
    jupyter:
      kernelspec:
        display_name: Stata
        language: Stata
        name: stata
    format:
      html:
        toc: true
        html-math-method: mathjax
        highlight-style: monochrome
        embed-resources: true
        anchor-sections: true
        citations-hover: false
        footnotes-hover: false
        code-copy: true
    ---

    Trying out to run some Stata code:

    ```{stata}
    sysuse auto
    su mpg
    hist mpg
    ```

    That's it!

![img](/img/2024-07-09-21-14-17.png)

{{% music %}}Bauhaus • _Double Dare_{{% /music %}}

[^1]: You'll need to install [stata_kernel](https://kylebarron.dev/stata_kernel/getting_started/) first.
