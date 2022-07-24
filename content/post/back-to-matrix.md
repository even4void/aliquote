---
title: "Back to Matrix"
date: 2022-07-23T21:26:51+02:00
draft: false
tags: ["app"]
categories: ["2022"]
---

I'm back to Matrix, finally. Last time I interacted on the network was in 2021, from the web app, Element. Previously, I tried Riot.im on my MacBook. Now that Element is available as a Desktop app for Linux, I see no reason to use the web app and I happily spent a few time configuring Element on my Linux laptop. I had to quit the channels I joined through my IRC bouncer to avoid duplicating my identities on the IRC channels I'm usually following (#scheme, #chicken, #lisp, #commonlisp, #haskell, #clojure), and joined them again from Element after having being authentified on the IRC network (Libera.chat). The process is well described on various blogs or the Matrix documentation itself. From what I understood, a bot is spawned from the Matrix network onto the IRC network, and from there on acts as if it was you.

It's been two years now that I'm logged on IRC every day. Although I have few interactions with others, I like it a lot better than all other chat applications I used before, except maybe chat rooms on Cross Validated from those days where I was still active there. I also deleted my Twitter account a few weeks ago. I haven't had any interaction in years, and I think it simply wasn't for me anymore. The only things left in the cloud are my Apple account and my Gmail which I only use as a catchup email service for some external providers now. Everything else has been deleted. There're some online account that I probably forgot but they will be too, soon or later.

So, why Matrix? As I said I like to stay using IRC but to keep up to date you either have to set up your own bouncer or rely on third-party ones. I've been very happy with BNC4FREE: you keep being logged in and get a backlog for the past 24 hours. You only need to connect once in a month, but of course you can launch your IRC application in the background on your local machine or a host server. I used both solutions, but finally I ended up spawning Irssi on my lab computer so it stays connected all time. The advantage of using the Matrix protocol is that you also stay connected all day and get a history of all messages (starting from the time you joined a channel). This also means you don't need to have the application running in the background. And you get notification for free, via libnotify on Linux.

About Element itself. The UI is nicely set up. Nothing too fancy, especially after it is configured using the IRC layout (this can be found in the general settings). I haven't explored all settings since I just installed the app yesterday, but it looks promising, especially the additional features (see below). Here's a screenshot of Element on my desktop:

![element](/img/2022-07-24-16-45-49.png)

Compared to the previous version of Element, there's now a "[lab features]" of some sort, so that you can enable further options. For instance, you can define your custom UI theme or use of from [GitHub]. Note that you will need to add a configuration file, `$HOME/.config/Element/config.json`, and not use the existing one (`$HOME/.config/Element/electron-config.json`), including the option `"showLabsSettings": true` (camel case here, and not snake case as shown on GH). Here's mine:

```json
{
  "settingDefaults": {
    "custom_themes": [
      {
        "name": "Nord dark theme",
        "is_dark": true,
        "colors": {
          "accent-color": "#a3be8c",
          "primary-color": "#88c0d0",
          "warning-color": "#bf616a",
          "sidebar-color": "#2e3440",
          "roomlist-background-color": "#3b4252",
          "roomlist-text-color": "#ebcb8b",
          "roomlist-text-secondary-color": "#e5e9f0",
          "roomlist-highlights-color": "#2e3440",
          "roomlist-separator-color": "#434c5e",
          "timeline-background-color": "#434c5e",
          "timeline-text-color": "#eceff4",
          "secondary-content": "#eceff4",
          "tertiary-content": "#eceff4",
          "timeline-text-secondary-color": "#81a1c1",
          "timeline-highlights-color": "#3b4252",
          "reaction-row-button-selected-bg-color": "#bf616a"
        }
      }
    ]
  },
  "showLabsSettings": true
}
```

{{% music %}}BADBADNOTGOOD • _Signal from the Noise_{{% /music %}}

[lab features]: https://github.com/vector-im/element-web/blob/develop/docs/labs.md
[github]: https://github.com/aaronraimist/element-themes/
