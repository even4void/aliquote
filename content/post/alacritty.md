---
title: "Alacritty"
date: 2022-10-06T18:48:43+02:00
draft: false
tags: ["app", "unix"]
categories: ["2022"]
---

Three weeks ago, I managed to solve a recurring problem on my Ubuntu workstation: using reliable and portable settings for Bash, Zsh and Tmux. I don't use Bash as an interactive shell that often but I like having it configured anyway. Since most of my aliases and functions are written for Zsh, which is the shell I use all day, I needed to make them available for Bash, as well various environment variables and `PATH` settings. I ended up using a common `$HOME/.config/profile.d` directory, easy to stow or to version control, to store all my login settings, and keep using `$HOME/.config/zsh` for interactive shell stuff, with appropriate links from `$HOME/.bashrc`. Since I use [starship] to define my prompt, it applies equally well to Bash or Zsh. Problem solved.

Even if I find Gnome terminal really great, I wanted to get ride of window decorations to really benefit from the [Tactile] shell extension. To my knowledge, only Kitty and Alacritty allow to remove window decoration. I decided to give Alacritty a try since I already know Kitty quite well but I don't need an additional level of multiplexing since I am already happy with Tmux.[^1] Those who don't use Screen or Tmux are probably less happy with Alacritty alone, except for its responsiveness. Because it is really fast, indeed. The very first days, I was kind of annoyed by the rendering process, which is far better than any other terminal I experienced in the past. Try to autocomplete path or command in Zsh and you will understand what I mean.

The other nifty feature of Alacritty is that it has a scrollback buffer (activated with <kbd>Shift+Ctrl+Space</kbd>) where you get Vim keybindings at your finger tip to navigate, select and yank any portion of text. That's even better than under Tmux, to the point that I now often switch to this mode of selection inside Tmux itself. It also looks like there's something called hint that allow to automagically highlight some regexed part of the screen, but I didn't get into it at the time of this writing.

{{< figure src="/img/2022-10-06-21-48-23.png" >}}

Like Kitty, Alacritty allows to define your own color scheme (the structure is quite identical, in fact -- just a plain text file with foreground/background colors, and all 16 terminal colors in Hex format) as well as a custom set of fonts. I switched to Fira Code (after Iosevska, JetBrains Mono and Ubuntu Mono, respectively) because I like it and it comes with SemiBold font shape, which I find less intrusive than plain Bold. There's not italic font shape, though, but it can be overcomed by using a variant of the regular font shape, as shown below:

```
font:
  normal:
    family: Fira Code
    style: Regular
  bold:
    family: Fira Code
    style: SemiBold
  italic:
    family: Fira Code
    style: Medium
  size: 11.0
```

John Cook discussed font that come with ligatures, like Fira Code, on [his blog]. He seems to prefer plain text (i.e., no ligature) for code, and I tend to agree with him except that now that I mostly code in Python, Scheme or Haskell I find them convenient, especially for Haskell or Purescript. We both agree that ligatures add some values to prose documents, though:

> There’s one place where I believe Fira Code would be ideal: code examples inside a prose document. In that context you care about aesthetics and you want a monospaced font.

{{< figure src="/img/2022-10-06-21-51-38.png" >}}

{{% music %}}The Psychedelic Furs • _Love My Way_{{% /music %}}

[^1]: I stopped using Kitty on Ubuntu when I realized that it will probably never add support for terminal activity as what's available in Tmux. I had other problems I don't remember, but they may well be related to backward search in the scrollback buffer not available unless we had an extra Python plugin.

[starship]: https://starship.rs/
[Tactile]: https://extensions.gnome.org/extension/4548/tactile/
[his blog]: https://www.johndcook.com/blog/2022/10/03/ligatures-for-logic/
