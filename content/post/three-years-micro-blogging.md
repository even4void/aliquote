---
title: "Three years micro-blogging"
date: 2021-06-20T16:00:38+02:00
draft: false
tags: ["this"]
categories: ["2021"]
---
And so, [two years](/post/one-year-micro-blogging/) later, we are about to exceed 3000 posts on the micro-blog.

```bash
~/Sites/aliquote master* % ls content/micro | wc -l
2753
```

When I added this section to the site I thought it would make a perfect fit for storing bookmarks and short quotes, much like a backlog. Later it evolved as a micro-journaling system, whereby I could pout both my readings and short life event, like what I was listening to or the TV shows I watched when I was alone or together with my son. This was also a good place to post pictures of flowers and dishes. Well, you get it. This has become a micro-blog of some sort. It's much better than Twitter since I own my data, I'm not limited by the number of characters or formatting issues, and there's no ads, trackers or statistics associated with any entry.

My personal setup has changed a bit: I use Neovim instead of Doom Emacs, I'm on Ubuntu and no longer use a MacBook, and so on. But the core idea remains the same: I can write a short note or quickly post a link by typing the following two words at my shell: `micro now`. This will create a file in the right directory, pre-populated with the corresponding header, and I'm good with writing whatever I like. Using `rsync` it can be synchronized almost immediately with my online server.

The crappy R script I used two years ago did not produce a very satisfactory word cloud this time. There's more content than last time and I really need to filter stop words, numbers and punctuation other than using a series of `gsub`s. Here's an [enhanced version](/pub/three-years-micro-blogging.r), which may be as crappy as the preceding one --- but with native pipes:

{{< figure src="/img/wc-micro-2.png" >}}

I intentionally left the "iTunes" keyword, which comes from an HTML tag I use to display the album I'm currently listening to on Apple Music, or nowadays from my ripped Music library. I also left the hashtags I use in some of my micro-posts, because I use few different tags like I did on Twitter and they help identify the content quickly. As can be seen, Emacs which was over-represented two years ago has left his place in favor of (mostly functional) programming languages (in addition to R and Python, which I still use for statistics and bioinformatics), and I suspect Emacs will keep fading over time now that I've found a new home for my main text editor. Let's see how it goes in the next few years.

{{% music %}}Branford Marsalis Quartet • _The Secret Between the Shadow and the Soul_{{% /music %}}
