---
title: "Zathura viewer"
date: 2022-08-17T10:51:22+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

Last year I briefly mentioned [Zathura] as my default PDF viewer. Since my last upgrade to Ubuntu 22.04 LTS, I reverted back to Gnome default settings for most things. I still have Zathura defined as my PDF viewer for BibTeX entries[^1] and TeX documents, and I customized it a lot since then. I just reenabled it as my default PDF/PS viewer for a couple of reasons:

- a single plain text configuration file
- support for EPUB format
- a nice index accessible via <kbd><tab></kbd>
- easy bookmarks
- synctex support for $\LaTeX$ editing in Neovim with [vimtex]
- copy/pasting via mouse selection
- keyboard-driven navigation, including zooming, adjusting, and page navigation
- a jump list like in Vim (<kbd>C-o</kbd>/<kbd>C-i</kbd>)
- and many other Vim-like features accessible form, e.g., the input bar.

Here are my personal settings in `$HOME/.config/zathura/zathurarc`:

```
set default-bg                  "#2E3440"
set default-fg                  "#D8DEE9"

set statusbar-fg                "#D8DEE9"
set statusbar-bg                "#2E3440"

set index-bg                    "#2E3440"
set index-fg                    "#D8DEE9"

set index-active-bg             "#81A1C1"
set index-active-fg             "#D8DEE9"

set inputbar-bg                 "#2E3440"
set inputbar-fg                 "#D8DEE9"

set notification-warning-bg     "#EBCB8B"
set notification-warning-fg     "#2E3440"

set highlight-color             "#81A1C1"
set highlight-active-color      "#81A1C1"

set completion-highlight-fg     "#BF616A"
set completion-highlight-bg     "#2E3440"

set completion-bg               "#2E3440"
set completion-fg               "#D8DEE9"

set notification-bg             "#D8DEE9"
set notification-fg             "#2E3440"

set recolor-darkcolor 		"#D8DEE9"
set recolor-lightcolor          "#2E3440"
set recolor                     "true"

set incremental-search          "true"
set adjust-open                 "best-fit"

set window-title-home-tilde     "true"
set selection-clipboard         "clipboard"

set statusbar-basename          "true"
set statusbar-home-tilde        "true"
set statusbar-h-padding         "5"
set statusbar-v-padding         "5"

set window-height               3000
set window-width                3000

set save_position               "true"
set zoom_level                  "false"
set synctex-editor-command      "nvim"

set font                        "Ubuntu Mono 13"

map <C-b> feedkeys ":bmark "
map D set "first-page-column 1:1"
map <C-d> set "first-page-column 1:2"
```

The color scheme follows the Nord dark theme, and it is on by default. If I want a light background as in Evince, I can `C-r` to disable recoloring. The window height and width are defined such as Zathura looks maximized on my screen. I think the remaining options speak for themselves.

![img](/img/2022-08-17-11-52-45.png)

{{% music %}}Jewel • _Hands_{{% /music %}}

[zathura]: /post/nyxt-browser/
[vimtex]: https://github.com/lervag/vimtex

[^1]:
    I wrote a helper function in Vimscript that can `xdg-open` the PDF or Postscript or DJVU file associated to a BIbTeX entry, which I can trigger using `gf` shortcut.

    ```
    function! text#open_bibtex_key() abort
      let s:uri = split(split(expand('<cWORD>'), '{')[1], ',')[0]
      if s:uri !=# ''
        silent exec "!xdg-open ~/Documents/papers/'".s:uri."'.* &"
      else
        echo 'No match found.'
      endif
    endfunction
    ```
