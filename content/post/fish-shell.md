---
title: "Enter the Fish shell"
date: 2019-08-16T20:30:49+02:00
draft: false
tags: ["misc", "apple"]
categories: ["2019"]
---

Recently I decided to switch to the Fish shell, after several years of zsh'ing everythings in a terminal on my Mac, mostly iTerm by the way. Here are some thoughts after some days of use.

<!--more-->

I have been an happy Zsh user for several years, and zsh has been my main shell on my last three laptops. I used the nice [Oh-my-zsh](https://ohmyz.sh) framework to add plugins and themes, although I ended up building my own PS1 prompt since none of those provided by the existing themes was to my liking. My `.zshrc` config file evolved over time, but I never took the time required to update it to the latest updates of Zsh or Oh-my-zsh. All I did was to remove several plugins that I was barely using, notwithstanding the fact that sometimes there were some conflicts between aliases or functions defined in there and shell builtins or other config files (e.g., `.gitconfig`).

![](/img/2019-08-16-20-03-46.png)

Yesterday, I decided to try [Fish](https://fishshell.com) and I must say this was quite an happy move, especially when I found my way with setting the `$PATH` variable correctly. Beware not to put tilde to indicate your home directory, but use an aboslute path or a predefined `$HOME`.

Some of my Bash/Zsh functions needed some updates, e.g., to accomodate the fact that variable substitution (`$(var)` becomes `(var)`) and function arguments works differently in Fish. For instance, instead of `$1` to capture the first argument that was passed to a function, you have to use `$argv`, and so on. That being said, you can attach sort of docstring to your function and they will be printed in the terminal when you ask for completion using `TAB`. Aliases are simply displayed as is in the completion menu. Here is an example with a custom function (`stata_help`) and alias (`statadocs`):

![](/img/2019-08-16-20-47-12.png)

Other nice features of Fish: syntax highlighting and automatic indentation is enabled when writing inline functions at the prompt; command arguments are colorized which makes it easier to identify the name of the command from its arguments when looking at the terminal at a glance; Fish is aware of your man pages (just run `fish_update_completion` and let Fish index all of them); correct paths are highlighted (underlined) as you type, incorrect paths or commands are highlighted using a different color. Other features worth mentioning: the history is easier to use compared to the one you get with zsh (up/down arrow with a combination of `ALT`); default themes (prompt and color scheme) are quite good--actually I stopped on the "VCS informative" shell prompt and the "Just a Touch" color scheme, with [Nord theme](https://www.nordtheme.com) on iTerm (as the default theme for NVim and Emacs, and VS Code, because this is the only dark theme I seem to support for syntax highlighting of code). I know there's a [Nord theme](https://github.com/arcticicestudio/nord/issues/102) in progress, but I am quite happy with the current color scheme actually. And of course, frameworks ([Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)) and package manager ([Fisher](https://github.com/jorgebucaran/fisher)) are available as well.

All those features make working in a terminal a really pleasant experience. The little [status bar](https://www.iterm2.com/3.3/documentation-status-bar.html) that you see in the above screenshots is from iTerm. Together with [shell integration](https://iterm2.com/documentation-shell-integration.html), it adds extra power to this wonderful terminal app, which already provided close to Tmux experience, but natively. I am trying to add some useful items in the status bar, e.g., displaying number of running and stopped jobs, whether we are on ssh or not, if a Python virtual env can be detected in the current working directory.

My Fish config files are [available on Github](https://github.com/even4void/dotfiles) if you are interested. For the time being, this is just basic stuff, with pieces stolen here and there on the web
