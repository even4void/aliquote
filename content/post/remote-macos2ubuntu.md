---
title: "Remote Desktop macOS -> Ubuntu"
date: 2026-09-21T15:36:05+02:00
draft: false
tags: ["apple"]
categories: ["2026"]
---

Here is a quick way to work using Remote Desktop from macOS (Golden Gate) to
Ubuntu (24.04 LTS, X11).

Ubuntu 24.04 removed the long term supported VNC protocol, and only RDP
connection are now allowed via System > Remote Desktop. We could use Windows App
(formerly MS Remote Desktop, available on the App Store), but if we want to
stick with Apple Screen Sharing utility, we can install x11vnc on the remote
machine:

```shell
$ sudo apt install x11vnc
$ x11vnc -storepasswd
```

This, of course, assumes you are running on x11 and not Wayland (check that with
echo $XDG_SESSION_TYPE). [^1] Now, let the app run in the background using the
following instruction:

```shell
$ x11vnc -usepw -display :0
```

If that doesn't work, we are better off leaving x11vnc guessing the host screen
for us:

```shell
$ x11vnc -usepw -auth guess
```

If that still doesn't work, e.g. we're getting a « denying additional client »
error message from Ubuntu, it's probably because we need to allow multiple
connections to the server:

```shell
$ x11vnc -usepw -auth guess -shared -forever
```

Now you be able to connect to your Ubuntu workstation using Spotlight
(vnc://<yourip>:5900) or the Screen Sharing app directly. Note that once you
connected using Spotlight, the distant machine will be available in the list of
available connections in the Screen Sharing app.

If you want to enable this permanently, you can simply write a service that will
start at login

```shell
# /etc/systemd/system/x11vnc.service
[Unit]
Description=Serveur VNC
After=multi-user.target

[Service]
Type=simple
User=<username>
ExecStart=/usr/bin/x11vnc -usepw -auth guess -forever -shared
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

Personally, I prefer to launch the VNC server upon connecting via ssh, for
security reasons. On top of that, you may add this Linux machine to your
Tailscale network and connect using its tailnet IP instead of your work network.

[1]: https://tigervnc.org/doc/w0vncserver.html

[^1]: It looks like newer versions of TigerVNC provide [w0vncserver][1] which
    allows to share native Wayland compositors, but I have no idea if that
    really works.

{{% music %}}Alan Walker • *Faded (Dash Berlin remix)*{{% /music %}}
