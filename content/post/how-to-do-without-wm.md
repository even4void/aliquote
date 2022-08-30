---
title: "How to get by without using a tiling WM"
date: 2022-08-30T09:36:19+02:00
draft: false
tags: ["unix"]
categories: ["2022"]
---

How do I do without a tiling Window Manager, after several months of using i3 and Regolith? A few weeks ago I started wondering whether I should give Sway a try now that Ubuntu defaults to Wayland and Gnome 42. However, I held back with the idea of better familiarizing myself with Ubuntu's default WM. After all, I don't have big requirements in terms of desktop management: I use a single workspace most of the time, I prefer to have windows maximized on screen or split side by side full-screen, there's a launcher right under `Super+S` or `Super+A` which means I can just start typing the name of the application I want and press Enter, and the `Super+Tab` hot key allows me to switch between applications very easily. This is very much in spirit with points raised by [Josh Sherman] some time ago.

Yet I do not like the Snap system (nor the idea of sandboxed applications tied to an OS, as Apple did) and I removed all components on my previous install. They were not reinstalled when I upgraded to LTS 22.04. And I still feel more comfortable with terminal-oriented applications, or TUIs.

Anyway, here are some of the settings on my machine. First, as I said, I stand by maximized windows most of the time. When the application is up, if it is not maximized I can simply `Super+Up` to make it so. When I have two windows on screen, I can arrange them maximized and side by side using `Super+Left` and `Super+Right`. I yet have to find a way to automate this a little since at present I must hover on each window separately.

- I use "focus follow mouse" (`gsettings set org.gnome.desktop.wm.preferences focus-mode 'mouse'`) and Emacs keybindings (`gsettings set org.gnome.desktop.interface gtk-key-theme "Emacs"`) for graphical applications like Firefox.
- I modified the Caps lock key so that it acts as an Escape key (easier for me when using (Neo)vim) using `gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"`. Previously, I was relying on `setxkbmap -option caps:escape`, which no longer works under Wayland. See also [Remapping keys under Wayland].
- I use two extensions for Gnome shell: auto-move windows, which allows to assign specific workspace to any applications, and simply workspace, which adds a workspace block in the menu bar, like i3bar or polybar.
- I hided the dock entirely can probably be done by either removing Gnome dock from the system or through the extension preference panel. I choose to use a [terminal incantation], instead.[^1]
- I defined some shortcuts to make navigating workspaces (`Ctrl+Super+Left` and `Right`) and moving windows from one workspace to the other easier (`Shit+Super+Left` and `Right`). Since I learned recently that we can also [move and resize] window using keyboard shortcuts, I'm done with window and workspace management for now.
- I generally try to limit myself to two windows per workspace (easier to tab switch, and in case you have more than two applications opened on your desktop they keep being sorted by most recent use which means they should end up one after the other in the app switcher), and likewise to two pane per Tmux or Neovim window (again, easier to `M-o` -- a specific shortcut of mine -- or `C-w C-w`).
- Originally, I updated the default applications for specific filetypes (PDF, images, etc.), but finally I reverted to default settings and I launch Zathura (PDF), ranger (Files) or Feh (Images) from a running terminal.

I also use the gorgeous [Nord theme] for Gnome, which you can activate as follows:

```shell
% gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
% gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
```

It goes without saying that this changes the visual experience a lot.

Overall, I find that Gnome shell has been greatly improved over time, and it is now good enough for intensive daily use. I could hide Gnome terminal[^2] window border as well (e.g., `gsettings set org.gnome.Terminal.Legacy.Settings headerbar false`), but I found that just going fullscreen (`F11`) is usually enough. I like the system tray icons, which is compact and remains interactive, and, contrary to polybar, I don't have to bother configuring brightness, sound control, battery status, network settings and VPN myself.

{{% music %}}Foals • _My Number_{{% /music %}}

[^1]: This can be done as follows: (forgot where I found the trick, sorry!)

    ```shell
    gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
    gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false\
    gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
    ```

[^2]: By the way, you can see or backup all your Terminal settings using `dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt`.

[josh sherman]: https://joshtronic.com/2018/09/09/why-i-dont-use-a-tiling-window-manager/
[remapping keys under wayland]: https://blog.debiania.in.ua/posts/2021-06-10-remapping-keys-under-wayland.html
[terminal incantation]: /micro/2022-08-28-19-36-44/
[move and resize]: /micro/2022-08-29-11-27-05/
[nord theme]: https://github.com/EliverLara/Nordic
