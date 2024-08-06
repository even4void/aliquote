---
title: "Discord on Emacs"
date: 2020-05-27T07:21:57+02:00
draft: false
tags: ["emacs"]
categories: ["2020"]
---

I've been using Discord quite regularly during the quarantine, and I am quite happy with it. I never get used to Slack in the past, and I no longer use Skype. However, Discord is useful for quick appointment or to simply record progress on a project shared with students or colleagues. Moreover, the fact that we can just have quick vocal chat without necessarily using face to face conversation using a camera is more to my liking. This is not that I'm a shy guy (okay, just a bit of an introvert) but who needs video call when you just want to chat using a reliable channel?

Anyway, while I love the Discord UI, it is definitely an Electron app, which means around 350 Mo of RAM consumption as soon as it is launched. Nothing to worry about when it is just to have text messaging, though. The great advantage is that you can just use the very same app on your phone, which is what I do most of the time. But what if we could simply use our good old IRC client to chat on Discord server? I have reviewed a few possibilities on using Emacs to chat on Discord, and I found several standalone projects, mostly based on Node and Javascript. This includes [rdircd](https://github.com/mk-fg/reliable-discord-client-irc-daemon), [discordIRCd](https://github.com/creesch/discordIRCd), or [discord-irc](https://github.com/reactiflux/discord-irc). Some are pretty old, other warrant against Discord TOS violations. This was until I stumble across [bitlbee](https://www.bitlbee.org/main.php/news.r.html), which I certainly have used in the past but forgot about at some point. Interestingly, there's a plugin for Discord (actually there are [two plugins](https://wiki.bitlbee.org) but I only tested the non purple one) that seems to do the job well: [bitlbee-discord](https://github.com/sm00th/bitlbee-discord/).

The installation instructions are pretty simple. First, you will need to installed bitlbee via Homebrew. By default this will install the dev version, which is what we need since we want to use some plugin. Then, you just have to grab the plugin [released](https://github.com/sm00th/bitlbee-discord/releases) on Github (version 0.4.3 at the time of this writing) and compile it. I had to reinstall `libtool` as I got stuck with the following error message when generating the configure script:

```shell
undefined macro: AC_DISABLE_STATIC
```

Other than that everything went fine. Don't forget to launch the Bitblee daemon using, e.g., `brew services start bitlbee`. You can check that it is running in the background using the following command:

```shell
Name       Status  User Plist
$ brew services list
bitlbee    started chl  /Users/chl/Library/LaunchAgents/homebrew.mxcl.bitlbee.plist
emacs-plus stopped
emacs-plus stopped
isync      stopped
lighttpd   stopped
mysql      stopped
nginx      stopped
redis      stopped
unbound    stopped
```

I was able to access all my Discord channels in Emacs using [Circe](https://github.com/jorgenschaefer/circe) client, which is the [default one](https://github.com/hlissner/doom-emacs/tree/develop/modules/app/irc) in Doom Emacs. Note that you don't necessarily need to start Circe using the dedicated function `=irc` in Doom, except if you want to configure IRC servers yourselves. In my case, I just run `circe` and get a prompt where I can choose to connect to Freenode or Bitlbee running locally as a daemon. Assuming you configured Discord access correctly (I don't know why but I didn't need to register a Discord token) and saved your configuration, you should be ready to chat immediately. At a glance, here are a few commands that are useful to navigate in your Discord channels: `chat list discord` and `chat add discord !4 #borabora` are used to list all channels and add one using a dedicated alias given its rank number; `/join #borabora` will obviously let you land in, like in IRC. Finally, note that `chat list` won't list your private conversations, and you will need to `/msg` your buddy directly.

{{< figure src="/img/2020-05-26-10-47-39.png" >}}
