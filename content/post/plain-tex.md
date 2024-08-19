---
title: "Plain tex'ing again"
date: 2024-08-18T21:38:06+02:00
draft: false
tags: ["tex"]
categories: ["2024"]
---

Lately I've been interested in plain $\TeX$ again. I briefly talked about my own customization in Neovim with vimtex in a [preceding post](/post/vimtex-plaintex/) but since then I stopped using [vimtex](https://github.com/lervag/vimtex) because reasons.[^1]

I want to be able to write in English, with all the typos and grammatical errors you know me capable of, and in French with easy input of accented characters. I started writing in $TeX$ a long time ago and I remember the days where I had to type `\'e` to get an accented *é*. Then we had latin1, ucs, babel with french/francais, etc. Finally I switched to Context for several years, and came back to $\LaTeX$ because of Sweave and knitr. There used to be a Context filter to process inline code chunk but it was not on par with Sweave, Statweave or Pweave. Anyway, these were old days but plain $\TeX$ is still a thing, right?

I offered a solution for accented letters via luatex last time. It's okay, we just need to find an appropriate OTF font (there are plenty of them in `/usr/share/fonts/opentype` and you can probably install more from your package manager), and run luatex. You'll get a nicely formatted PDF output, and above all it comes with synctex support which means you'll get forward and reverse synchronization between your text editor and your PDF viewer. If you're using Vim or Neovim, set your compiler as `luatex`, as defined below, and you're good to go.

```vim
-- compiler/luatex.vim
if exists("current_compiler") | finish | endif
let current_compiler = "luatex"

let s:cpo_save = &cpo
set cpo&vim

silent CompilerSet makeprg=luatex\ --interaction=\"nonstopmode\"\ --file-line-error\ --synctex=15\ %
CompilerSet errorformat=%f:%l:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
```

Yet there's another option to alleviate the need for obscure typing of accented letters, namely xetex. As far as I know it cannot be called from latexmk (well, latexmk is for $\LaTeX$ backend after all), and it doesn't support synctex. I used to use the $Xe\LaTeX$ backend a lot because after Context this was the easiest solution to get extra fonts incoporated in our PDFs. Using xetex as compiler also means that we need to handle bibtex (or makeindex) and the whole compilation toolchain. Usually, I would use texi2dvi for plain $\TeX$ (the texi2* suite is really handy and I relied on it a lot when I was using Sweave or knitr for my statistical reports) but it doesn't support xetex either.

A third option to use xetex is [arara](https://islandoftex.gitlab.io/arara) and it works right out of the box. If you are curious about it all works, the rules that arara relies on are located under `/usr/share/texlive/texmf-dist/scripts/arara/rules`. If we add the following directives at the top of our document, we'll get xetex + bibtex and a nicely formatted PDF.


```tex
% vim: set ft=plaintex:
% arara: xetex: {synctex: yes}
% arara: bibtex: { options: [ '-terse' ] }
% arara: xetex: {synctex: yes}
% arara: xetex: {synctex: yes}
\ifx\eplain\undefined \input eplain \fi

\font\bodyfont="Fontin"
\bodyfont

\parindent 0pt

Bienvenue aux caractères accentués français grâce à $\TeX$.

Here's a test for eplain: \cite[note]{knuth-1984-texbook}.

\beginsection{References.}\par
\bibliography{references}
\bibliographystyle{plain}
```

Here's the output on my machine:

```shell
~/tmp                                                                                                                                    1m12s
» arara plain.tex
  __ _ _ __ __ _ _ __ __ _
 / _` | '__/ _` | '__/ _` |
| (_| | | | (_| | | | (_| |
 \__,_|_|  \__,_|_|  \__,_|

Processing "plain.tex" (size: 3.3 kB, last modified: 2024-08-18
20:05:35), please wait.

(XeTeX) XeTeX engine .................................... SUCCESS
(BibTeX) The BibTeX reference management software ....... SUCCESS
(XeTeX) XeTeX engine .................................... SUCCESS
(XeTeX) XeTeX engine .................................... SUCCESS

Total: 1.744 seconds
```

If it looks a bit tedious to add so many directives at the top of our document, we can rely on a global or local [configuration file](https://islandoftex.gitlab.io/arara/manual/configuration/). For instance, this allows to pass a default preamble when calling arara on a $\TeX$ document. The exact structure of the configuration file may not be obvious when reading the manual, but after some trials I got something working as expected. Put the following in a file named `$HOME/.araraconfig.yaml`:

```yaml
!config
defaultPreamble: xetex-mp
preambles:
  xetex-mp: |
    % arara: xetex:  {options: ["-synctex=15"]}
    % arara: bibtex: {options: ["-terse"]}
    % arara: xetex:  {options: ["-synctex=15"]}
    % arara: xetex:  {options: ["-synctex=15"]}
```

You may notice that I expanded the synctex option to benefit from all optimizations, especially better compression support. You can add as many compilation directives as you want, and of course define other preambles which may then be called with the `--preamble` option. In this case, setting a default one ensures that we can simply call `arara ourdoc.tex` and that all the above directives will be proceeded.

Bonus point: You can use whatever tool you like to cleanup the artifacts generated by arara, e.g. `latexmk -C`, but there's a specific rule for that in arara as well so it's up to you:

```latex
% arara: latexmk: { clean: partial }
% arara: clean: { extensions: [ aux, log ] }
```

I perfer keeping the log files around in case something went wrong during the compilation, but at least you know.

{{% music %}}Warsaw • _As You Said_{{% /music %}}

[^1]: This really is a great plugin, and it's probably better than Texlab or other competitors that I never tried. But to be honest I don't really need all of these goodies. I have my own way of fetching bibliographic entries via fzf, latexmk takes care of cleaning up the mess after a PDF has been produced. I wrote a quite complete interface to Texlab in Lua (i.e., similar to what you'll get from nvim-lspconfig), which provides me with omni-completion and goto definition/reference. That's really all what I need.
