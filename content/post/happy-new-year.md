---
title: "Happy New Year"
date: 2021-01-01T20:48:00+01:00
draft: false
tags: ["this", "unix", "stata"]
categories: ["2021"]
---

In which we wish our readers a happy new year.

Let's not lie to ourselves, the year will not have been glorious and does not deserve a real retrospective, so let's continue our adventures in the Ubuntu universe.

Before that, I wanted to mention two things: First, I no longer use a JS tracker (Matomoto) to record site statistics (visit counts and the like, nothing sensitive) --- I expect between 30 and 70 visits each day, from my review of the past two years, and that's all I wanted to know; second, this site has been up for 13 years now, at least the blog section. It's been a long time, really, especially given the fact that I almost lost control some years ago. In spite of the events I continued to write, on the one hand to maintain the habits and on the other hand not to let this blog die on its own. I am glad that these efforts were not in vain since I will have written some 250 posts in the last three years. And thank you for reading, if you're a regular user of this site.

Let's go back to Ubuntu. I'm still setting up things the way I like and adding packages here and there. Lastly, I was happy to get Stata 13 MP working on my Linux machine. Overall, I would say the UI is quite better than what it is on macOS Mojave (with its default management of popup windows on screen), but you have to perform a bit of additional configuration to get it feel the right way. This is mostly about the icons (and default color scheme, but let's not talk about that since the same applies to default 8-bit colors), which are totally missing upon the basic installation, as can be seen below:

{{< figure src="/img/2020-12-30-16-30-52.png" >}}

Fortunately, there's an easy solution to [fix missing Stata icons on Linux](https://github.com/kylebarron/stata-png-fix). Also, if you want to upgrade, you will probably need to downgrade permissions in `/usr/local/stata` or ̀̀`/usr/local/stata13` (which is where we usually install Stata, here `/usr/local/stata` is just a symlink to `/usr/local/stata13` on my machine), e.g., 777 instead of 755, since downloaded files are saved in `.tmp/` folder under that directory. Finally, your `profile.do` file may be stored either as `$HOME/profile.do` or `$HOME/bin/profile.do`. I prefer the latter since I don't like dangling files in my HOME directory. Further customizations are discussed in the following blog post: [Installing Stata in Linux](https://acarril.github.io/posts/install-stata-linux). This is especially relevant if you plan to use the graphical frontend and want a tight OS integration (i.e., MIME type and shortcut in the activity menu bar). And here we go:

{{< figure src="/img/2021-01-01-21-15-49.png" >}}

Funny first ticket for 2021 but let's hope that this year will be as productive as the last years.
