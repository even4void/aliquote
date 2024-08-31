---
title: "Ubuntu 24.04: The sequel"
date: 2024-08-16T17:37:19+02:00
draft: false
tags: ["unix"]
categories: ["2024"]
---

Quickly jotted post-install steps of my previous post. It was a joy, really.

### Node

I know there are various way to install the full-stack on Ubuntu, either via apt, dedicated PPAs, or [nvm](https://github.com/nvm-sh/nvm). Previously I was using an imported deb repository. Ubuntu is known to be somewhat lagging a little behind the latest versions, so this was the best chance to get a decent nodejs with the 22.04 LTS at some point. I'm not particularly interested in managing multiple versions of Node since I barely do any serious stuff in JS for web dev.

Currently, the official Ubuntu repository offers nodejs/noble 18.19.1+. That's okay, but if you try to install npm, unless  you'll end up with a giant list of packages! Installing the combo nodejs + npm, with nodejs-doc (because we like to read the doc, right?) results in a mess:

```
0 mis à jour, 394 nouvellement installés, 0 à enlever et 2 non mis à jour.
Il est nécessaire de prendre 28,0 Mo dans les archives.
Après cette opération, 169 Mo d'espace disque supplémentaires seront utilisés.
```

Note that you would get almost nothing by asking apt for `--no-install-recommends` (about forty packages less at best).

Let's try with the NodeSource repo instead, with the LTS release. Notice that several blog posts suggest <https://deb.nodesource.com> as a primary repo, but this is not from the NodeJS organization, AFAICT. In retrospect, this is probably what I installed last time:[^1]

```
nodejs/nodistro,now 20.12.2-1nodesource1 amd64  [installé]
```

Anyway, there are prebuilt binaries available on <https://nodejs.org>, as well as a suggestion to use nvm. I finally choose the later. Everything went fine except that I lost my custom lib directory (so-called "prefix" in Node parlance). I'll check back later!

```shell
» nvm install 20
Downloading and installing node v20.16.0...
Downloading https://nodejs.org/dist/v20.16.0/node-v20.16.0-linux-x64.tar.xz...
################################################################################# 100.0%
Computing checksum with sha256sum
Checksums matched!
Your user’s .npmrc file (${HOME}/.npmrc)
has a `globalconfig` and/or a `prefix` setting, which are incompatible with nvm.
Run `nvm use --delete-prefix v20.16.0` to unset it.

» nvm use --delete-prefix v20.16.0
Now using node v20.16.0 (npm v10.8.1)

» node -v
v20.16.0

» npm -v
10.8.1
```

### Python

Canonical apparently wants to use Python more and more for the back office. It is now harder to pip install a Python package. If you try to install Poetry using their online shell script, you will be redirected to an error message about installing packages outside a virtual environment. Same goes with pip in your `$HOME` directory:

```shell
» pip install --user poetry
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.

    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.

    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.

    See /usr/share/doc/python3.12/README.venv for more information.

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.
```

I'm not against banning system-wide installations, on the contrary. But it seems to me that user install don't really harm. I personally use virtual environments for every projects, but keep installing in my $HOME directory packages that I use regularly when firing up an IPython shell, e.g. numpy, scipy, statsmodels, plotnine, biopython, networkx. I don't want to override the official policy in this case, and I note that I could install most of those package from Ubuntu repos as well, meaning I may even benefit from Ubuntu package management itself, which reminds me of this:

> I manage my Python packages in the only way which I think is sane: installing them from my Linux distribution’s package manager. I maintain a few dozen Python packages for Alpine Linux myself. It’s from this perspective that, throughout all of this turmoil in Python’s packaging world, I have found myself feeling especially put out. --- [Python: Please stop screwing over Linux distros](https://drewdevault.com/2021/11/16/Python-stop-screwing-distros-over.html)

Quick fact checking: There are a lot of R (thanks to [r2u](https://eddelbuettel.github.io/r2u/)) and Python packages (this includes documentation packages) already available on Ubuntu 24.04![^2]

```shell
» apt search r-cran- | wc -l
3428

» apt search python3- | wc -l
13580
```

I'm waiting to see how I'll proceed, but frankly I think I'll just install the deb packages I use frequently and create a sandbox for the rest.

In the meantime, I just deleted my Python 3.10 library and everything that was installed under `$HOME/.local/bin` with pip (`rg -l "\#\!/usr/bin/python3" | xargs rm`).

### R

After reinstalling R from the official Ubuntu source list, I got R 4.3. I was running v4.4.0 but it is not a big deal. I had a total of 498 packages (2.4 Go) in my personal library. Rather than keeping stuff compiled with another version, I took the opportunity to shorten the list of packages I will have installed by default, and use [renv](https://rstudio.github.io/renv/) to manage additional packages on a per-project basis. This is in line with the approach usually taken in other PLs I use.

I selected the following list of "essential" packages, meaning I will probably use two or three of them each time I fire up R for a quick statistical investigation, excluding LSP and editor stuff, i.e. languageserver, lintr and styler: car, coin, cowplot, data.table, directlabels, ggplot2, glmnet, haven, Hmisc, languageserver, lintr, lme4, mclust, multcomp, patchwork, plotly, remotes, reshape2, renv, readxl, rms, skimr, styler, tinytest, vegan. Skimr is surely the only exotic piece of a package in this list, and it adds little to the bill after all.

This whole set of packages is going to install a bunch of additional software, but not that much compared to what testthat alone would require:[^3]

```
‘bit’, ‘rappdirs’, ‘sys’, ‘Deriv’, ‘modelr’, ‘microbenchmark’, ‘bit64’, ‘cachem’, ‘memoise’, ‘sass’, ‘ps’, ‘pkgbuild’, ‘askpass’, ‘broom’, ‘numDeriv’, ‘doBy’, ‘MatrixModels’, ‘farver’, ‘labeling’, ‘munsell’, ‘fansi’, ‘pkgconfig’, ‘iterators’, ‘clipr’, ‘crayon’, ‘vroom’, ‘tzdb’, ‘checkmate’, ‘rstudioapi’, ‘fastmap’, ‘bslib’, ‘evaluate’, ‘fontawesome’, ‘jquerylib’, ‘tinytex’, ‘xfun’, ‘yaml’, ‘highr’, ‘processx’, ‘brew’, ‘commonmark’, ‘desc’, ‘pkgload’, ‘remotes’, ‘zoo’, ‘curl’, ‘mime’, ‘openssl’, ‘generics’, ‘later’, ‘rematch’, ‘prettyunits’, ‘utf8’, ‘R.methodsS3’, ‘R.oo’, ‘R.utils’, ‘carData’, ‘abind’, ‘pbkrtest’, ‘quantreg’, ‘scales’, ‘libcoin’, ‘matrixStats’, ‘modeltools’, ‘mvtnorm’, ‘gtable’, ‘rlang’, ‘quadprog’, ‘cli’, ‘glue’, ‘isoband’, ‘lifecycle’, ‘tibble’, ‘vctrs’, ‘withr’, ‘foreach’, ‘shape’, ‘Rcpp’, ‘RcppEigen’, ‘forcats’, ‘hms’, ‘readr’, ‘tidyselect’, ‘cpp11’, ‘gridExtra’, ‘htmlTable’, ‘viridis’, ‘htmltools’, ‘base64enc’, ‘colorspace’, ‘rmarkdown’, ‘knitr’, ‘Formula’, ‘callr’, ‘collections’, ‘fs’, ‘jsonlite’, ‘R6’, ‘roxygen2’, ‘stringi’, ‘xml2’, ‘xmlparsedata’, ‘backports’, ‘cyclocomp’, ‘digest’, ‘rex’, ‘minqa’, ‘nloptr’, ‘TH.data’, ‘sandwich’, ‘httr’, ‘magrittr’, ‘viridisLite’, ‘htmlwidgets’, ‘tidyr’, ‘RColorBrewer’, ‘dplyr’, ‘lazyeval’, ‘crosstalk’, ‘purrr’, ‘promises’, ‘plyr’, ‘stringr’, ‘cellranger’, ‘progress’, ‘SparseM’, ‘polspline’, ‘pillar’, ‘repr’, ‘R.cache’, ‘rprojroot’, ‘permute’
```

Results: 157 packages, 408 Mo.

In summary, I just installed and deleted a total of xxx packages (where xxx > 500) on various places on my laptop, from various sources on the internet, using various package manager (having almost zero reverse or orphaned dependencies management,[^4] unless you use your distro own package manager). [Everything is HUUUUGE](https://tonsky.me/blog/disenchantment/).


{{% music %}}Tindersticks • _My Sister_{{% /music %}}

[^1]: I've long been using a simple Makefile to keep track of my packages list:

    ```
    all:
            @echo "\033[0;32m[+] Staging local changes\033[0m"
            (apt list --installed > packages) >/dev/null 2>&1
            git add .
            git diff-index --quiet HEAD || git commit -m "Update packages"
    ```


[^2]: Sadly, no [plotnine](https://plotnine.org/)!
[^3]: Installing testthat on a fresh and empty libPath means a mare addition of packages (35 Mo) already : ‘utf8’, ‘crayon’, ‘pillar’, ‘pkgconfig’, ‘vctrs’, ‘glue’, ‘fs’, ‘pkgbuild’, ‘rprojroot’, ‘diffobj’, ‘fansi’, ‘rematch2’, ‘tibble’, ‘brio’, ‘callr’, ‘cli’, ‘desc’, ‘digest’, ‘evaluate’, ‘jsonlite’, ‘lifecycle’, ‘magrittr’, ‘pkgload’, ‘praise’, ‘processx’, ‘ps’, ‘R6’, ‘rlang’, ‘waldo’, ‘withr’. Remember the [tinyverse](https://www.tinyverse.org/)?
[^4]: While r2u is a great initiative, I keep the habits of [compiling everything from source](https://gist.github.com/even4void/99e40b772ec84b82eaef9bd2e5de0ace), at least on my machine. And please note that using bspm to get native binary via the r2u apt repo doesn't work with renv, rig (and probably pak).
