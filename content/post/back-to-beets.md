---
title: "Back to Beets"
date: 2024-11-10T20:36:11+01:00
draft: false
tags: ["misc"]
categories: ["2024"]
---

It's a been a few weeks with ncmpcpp as my [daily driver](/post/mpd-and-ncmpcpp/) to the mpd daemon. So far so good, it's lightweight and it allows you to make very precise settings. Once I learned how to [remove all the fancy colors](/micro/2024-10-29-18-16-40/) (this is simply `colors_enabled = no`), I think I got a very decent music player and I no longer miss Cmus since it covers the same set of features plus many additional options (tag editor, display information on tracks or artists, fetching lyrics, among others).

Now I wanted to cleanup my database, and soon after I started using mpd I configured Beets to import and auto-tag my whole music directory. Other authors already described [their](https://whine.fr/beets-mpd-ncmpcpp/) [workflow](https://ssrubin.com/posts/music-library-with-mpd-ncmpcpp-beets.html), mostly as a way to bypass Apple Music (aka iTunes). Last time I used Beets I was left with a [mixed impression](/post/auto-tagging-my-music/#beets). This time I took some time to think about it. First I did not import everything (18k tracks) at once and I disabled the auto-tagging and moving option. I simply gathered all my albums in a dedicated folder, and likewise I kept separate folders of playlists in another parent directory. In the end I only have two directories (collection and playlists which hold all my music). Incoming music is stored in a temporary folder which is ignored by mpd (thanks to an `.mpdignore` file). Playlists were imported as is (they are supposed to be well crafted since they dated back from my time with Apple and iTunes). Albums were also imported as is, and I tagged them later in sort of a batch mode, i.e. albums I ripped from my own CDs or albums I fetched from the interwebz. I assumed that albums downloaded from Bandcamp were already well annotated. It took me a week or so to get a clean `beet update`.

{{% alert note %}}
<small>[2025-01-12]</small><br>
See also [Enjoying music curation again](https://blog.yossarian.net/2022/02/21/Enjoying-music-curation-again) to learn more about others' config (I learned about the scrub plugin, for instance.

> MusicBrainz has accurate metadata for well over 95% of the albums that I’ve passed through beet import, meaning that normalizing and checking everything is as simple as pressing “Enter” a handful of times.
{{% /alert %}}

I learned a few things along the way. First, it's good to add Discogs as a source for auto-tagging in addition to MusicBrainz and Bandcamp. In case you already have cover art, disable auto-fetching album art otherwise you're likely to end up with a cover.jpg and cover.1.jpg (on Linux) file for each album. I had to cleanup the SQLite database manually. Take your time to review the suggested options when album matches aren't very high (< 50%); sometimes it's good time to look for a Discogs ID rather than trust the low confidence matches (especially for special or deluxe edition, particular rare LP or collaborative work). Several pass of `beet update` may be necessary in order to get a cleaned database. A final note: you may notice that audio tags seem to not be updated right after running Beets (e.g., if you use id3 like me) but [Beets relies on ID3v2.4](https://docs.beets.io/en/latest/faq.html#not-change-my-id3-tags). I was disappointed for a long seeing the correct annotation in ncmpcpp but not when querying audio file properties using `id3info`.

I gathered a fair amount of live, EPs and LPs from the web archives a few months ago. Most of the records are of acceptable quality (usually 128 Kbps) bur for live events don't except more than bad broadcast FM recordings! We all miss Napster, right? However, despite my aversion to Google products, I realized that YouTube Music is quite a decent option to complete missing tracks from albums you like or to fetch whole albums. Things to keep in mind is that oftentimes album are not complete or need you to be logged in to download specific tracks. Finally, all tracks need to be retagged (e.g., default track number is 63 for all tracks related to the same album if I trust Beets). I use [yt-dlp](https://github.com/yt-dlp/yt-dlp) with the following settings (as a Bash script) to fetch music from YT:

```shell
for i in "$@"; do
    yt-dlp -f bestaudio \
	-x --audio-format mp3 \
	--audio-quality 320k \
	--embed-thumbnail \
	--add-metadata \
	--postprocessor-args "-id3v2_version 3" \
    --output "$HOME/Media/Music/tmp/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" \
	"$i"
done
```

{{% alert note %}}
<small>[2025-01-12]</small><br>
Slightly updated yt-dlp config follows: (we barely need to require 320k when quality is around 256k or less on YT.)

```shell
# $HOME/.config/yt-dlp/config
-o '/Users/chl/Music/downloads/%(album_artist)s/%(album)s/%(playlist_index)s - %(title)s.%(ext)s'
--no-mtime
-f 'ba*'
-x --audio-format mp3 --audio-quality 0
--embed-thumbnail
--embed-metadata
--parse-metadata '%(album_artist,channel,creator,artist|Unknown)s:%(album_artist)s'
```

Then put your URLs in a dedicated text file and just call Bash:

```shell
while read url; do yt-dlp "$url"; done <youtube
```
{{% /alert %}}

I then import YT audio tracks with Beets to get automagically tagging and renaming. It is also able to automagically fetch cover art, or you may disable it and download an image file yourself. I must admit YT music is amazing. I was able to find quite old OSTs like the one for The Crow with Brandon Lee, as well as Delux edition for some album I own.

Even after you get a clean output from `beet update` you may still want to manually curate some artifacts like incorrect dates (original date are usually fine, but dates are often wrong -- for instance, because they are for a deluxe or remix) or missing genres. I used the lastgenre plugin to get a more consistent classification (from lastfm), and I manually edited the 1000 tracks that were still missing genre information. I still have to fix the issue with improper tagging of date. Note that `beet summarize` and `beet list` are very handy to catch incorrect dates and find relevant tracks.

Along the way, I removed the [mscout](https://github.com/hardfau1t/mscout) service I set up earlier since I'm now using the [mpdstats](https://docs.beets.io/en/stable/plugins/mpdstats.html) plugin. It will be more convenient to store the play counts in the Beets database itself rather than mpd sticker databasE. Initially I started writing a shell script to retrieve my old listening statistics (which I first converted from Cmus to mscout) and integrate them in the Beets database, until I realized that Beets completely changed hundred of pathnames during importation. I'm too lazy to write a script relying on a hash for each track, so I will update the play count manually (this is already done for all my playlists, but this was the easy part!).

{{% music %}}Blue Cranes • _I Forgive You_{{% /music %}}
