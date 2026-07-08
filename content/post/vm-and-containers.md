---
title: "Running virtual machines and containers on macOS"
date: 2026-07-06T19:49:39+02:00
draft: true
tags: ["apple"]
categories: ["2026"]
---

On macOS you can now create and manage virtual machines and containers without
VirtualBox or Docker/Podman. While UTM is a (nice) wrapper around QEMU, the
newly released container facilities that I [mentioned a while
ago](/micro/2025-06-10-14-55-38) offer a more flexible way to run containers
without the hassle of setting up and running in the background Docker.

To get started, jut run `brew install container && container system start`. Each
container runs in its own VM, unlike Docker, with a dedicated IP available from
your preferred web browser.[^1]

The following will list running and stopped containers, then launch an
interactive shell in an alpine distro:

```shell
container ls -a
container run -it alpine sh
```

To run a command in a container directly, just run `container exec (...)`. To
check resource usage, just run `container stats`, or use [orchard]().

I don't have any application in mind at this time, but I can imagine how useful
such containers might be to test and/or debug web apps or statistical APIs.

\[^1\]: Of note, you'll need macOS Tahoe and an ARM processor, and there's no
equivalent to Docker compose.

{{% music %}}Marta Zlakowska • *When It's Going Wrong*{{% /music %}}
