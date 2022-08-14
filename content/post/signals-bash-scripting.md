---
title: "Signals and shell scripts"
date: 2022-08-14T22:54:54+02:00
draft: true
tags: ["unix"]
categories: ["2022"]
---

I was reminded of signals in shell scripts, after reading some arcane Bash code a few months ago. What are signals, and how can they be used in shell scripts. I don't remember what script caught my attention, but the gist of it is that you can easily monitor `SIGHUP` or `SIGINT` signals in a shell script, as you would do with other environmental variables or user input.

{{% music %}}XXX • _XXX_{{% /music %}}
