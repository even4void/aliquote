---
title: "The unquantified self #36"
date: 2026-10-09T15:06:24+02:00
draft: false
tags: ["self"]
categories: ["2026"]
---

The Summer is over and temperatures have dropped significantly.

My son and I are currently watching House of the Dragons. I already watched the
first two seasons two years ago, and these were the last [TV shows][1] I watched
before taking a break for two years. But I thought it would be great to watch
those two seasons again, before tackling season 3. First, it helps recalling the
sequence of events, and second, of course, it means spending more time with my
son.

A few days ago, I came across this blog post, [Resurrecting ichat audio and
video conferencing][2], which comes with a nice picture of an iSight.[^1] I have
fond memories of those early devices, although I never got one. However, I still
have this Mighty Mouse (bluetooth), and it still works with my MacBook M4 Pro.

{{< figure src="/img/IMG_1775.jpeg" >}}

I still rely on [Beets][3] to process all my music. Actually, my workflow is
quite simple: once I grabbed some MP3s from YT or Bandcamp, I let Beets analyze
them and add tag, cover and lyrics, before I store them on an external HD. New
songs are added to Apple Music afterwards, ready to play. I occasionally use
Apple Music or [Meta][4] (easier to use for batch processing) to edit metadata
directly. Since Beets store everything that was processed in a database I can
query almost everything, from album present in my library to summary of my
library itself. Looking at a recent summary, I noticed that I got a bunch of
electro lately. Here's the top 10 from `beet summarize`:

<small>
<table border="0">
<tbody>
<tr>
<td><em>Genre</em></td>
<td><em>Count</em></td>
</tr>
<tr><td>Rock</td><td>4105</td></tr> 
<tr><td>Post-Punk</td><td>3690</td></tr> 
<tr><td>Electronic</td><td>2342</td></tr> 
<tr><td>Jazz</td><td>1502</td></tr> 
<tr><td>New Wave</td><td>1138</td></tr> 
<tr><td>Indie Rock</td><td>871</td></tr> 
<tr><td>Classic Rock</td><td>835</td></tr> 
<tr><td>Pop</td><td>730</td></tr> 
<tr><td>Alternative Rock</td><td>709</td></tr> 
<tr><td>Indie Pop</td><td>528</td></tr> 
</tbody>
<tfoot>
<tr>
<td colspan="2">
<small>
Tracks: 27146, Artists: 2198, Albums: 2240
</small>
</td>
</tr>
</tfoot>
</table>
</small>

The totals were obtained by `beet stats` (separate plugin), not sure this is
fully in agreement with Apple Music own statistics since I happened to remove
some albums after the fact, and probably forgot to add some records in Beets
database. I don't think I am looking to get more tracks at this point. I
collected almost all the albums I've been listening to during the past 30 years.
Now it's time to listen to them again and again.

I'm writing this post in BBEdit. Now that I managed to get a decent colorscheme,
handy scripts and a comfortable set of keybindings, I think it's time to try to
use it as my default text editor for some weeks. By the way, I created a minimal
`vimrc` that I installed on remote machines I interact with, so there's less
friction compared to my default Neovim config that was hardly in sync across all
machines. And I happen to use bare Vim 9 with pleasure on macOS.

{{< figure src="/img/2026-10-09-17-54-22.png" caption="My desktop at the time of this writing" >}}

I read zero book since August. I do not feel ashamed, but I must admit I miss
those quiet moments. In the meantime I did a lot of archiving on my MacBook,
took some time to get up to speed with Wolfram 15 as well as to brush my skills
with Stata 19. There are still so many exciting things to discover and get to
grips with that I reckon I'll be busy with them right up until Christmas.

{{% music %}}Cocteau Twins • *The Hollow Men*{{% /music %}}

[1]: /articles/movies
[2]: https://blog.pipetogrep.org/2026/09/11/resurrecting-ichat-audio-and-video-conferencing/
[3]: https://beets.io
[4]: https://www.nightbirdsevolve.com/meta/
[5]: https://blog.colinbreck.com/i-dont-want-to-read-what-you-didnt-write/

[^1]: It's still an item that comes from HackerNews, but I am becoming
    increasingly disappointed with the quality of the content posted on this
    front page ever since all the AI crap first appeared. I'm increasingly
    relying on my curated RSS feeds nowadays. See also [I Don't Want to Read
    What You Didn't Write][5].
