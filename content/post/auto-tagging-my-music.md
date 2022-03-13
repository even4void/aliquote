---
title: "Auto-tagging my music library"
date: 2022-03-12T21:12:02+01:00
draft: true
tags: ["misc"]
categories: ["2022"]
---

I use [Cmus] as my main media player, and occasionally [mpv] although I mostly use the later for video playback (including [streamlink]). I'm pretty happy with my current setup. Everything runs from a terminal, there's no fancy UI nor unwanted distraction, just the raw output. My music library actually weighs about 62 Go and it's full of MP3, some OGG as well as some videos, but not everything is in order. I mean, I miss a lot of tags for some albums that I ripped from my personal CD collection. Here comes the idea of auto-tagging everything. I tried three solutions. Here are my very first impressions.

I tested all three software on a specific folder in my database, which I know is not the easiest one, since it features a mix of A Certain Ratio and Joy Division's live shows, among others. And I warmly recommend everything from [The Factory Records].

### Beets

At first, I was impressed by [beets], especially since it is a command-line only utility, which comes with many add-ons (aka plugins). I configured its settings based on the documentation and what I could find on the intertube.

```shell
Tagging:
    Various Artists - Live at Leigh Rock Festival 1979
URL:
    https://musicbrainz.org/release/e01790b2-77ba-4b7d-8383-118a6cdc700d
(Similarity: 47.9%) (missing tracks) (2xCD, 2006, GB, Ozit)
CD 1
Missing tracks (29/35 - 82.9%):
 ! Leigh Festival Stage Announcements/Disorder (# 1) (3:59)
 ! Leaders of Men                              (# 2) (2:35)
 ! Colony                                      (# 3) (3:56)
 ! Insight                                     (# 4) (3:39)
 ! Digital                                     (# 5) (2:48)
 ! Dead Souls                                  (# 6) (4:18)
 ! Shadowplay                                  (# 7) (3:30)
 ! She's Lost Control                          (# 8) (3:24)
 ! Transmission                                (# 9) (4:04)
 ! Interzone                                   (#10) (2:08)
 ! Intro of Sound of Music                     (#11) (0:25)
 ! Tony Wilson Fucker                          (#12) (3:01)
 ! Messages                                    (#19) (4:36)
 ! Bunker Soldiers                             (#20) (2:52)
 ! Julia's Song                                (#21) (4:16)
 ! VCBXL                                       (#22) (4:07)
 ! Almost                                      (#23) (3:56)
 ! Red Frame White Light                       (#24) (3:45)
 ! Mystery Reality                             (#25) (3:28)
 ! Electricity                                 (#26) (3:54)
 ! Second Head                                 (#27) (4:00)
 ! Brave Boys Keep Their Promises              (#28) (2:31)
 ! Sleeping Gas                                (#29) (3:45)
 ! Take a Chance                               (#30) (2:30)
 ! Ha Ha I'm a Drowning                        (#31) (4:16)
 ! Read It in Books                            (#32) (2:32)
 ! Straight Reigns                             (#33) (2:26)
 ! Camera Camera                               (#34) (3:07)
 ! Went Crazy                                  (#35) (3:20)
Apply, More candidates, Skip, Use as-is, as Tracks, Group albums,
Enter search, enter Id, aBort, plaY? M
Finding tags for album "Various Artists - Live at Leigh Rock Festival 1979".
Candidates:
1. Various Artists - Live at Leigh Rock Festival 1979 (47.9%) (missing tracks) (2xCD, 2006, GB, Ozit)
2. Joy Division - Leigh Rock Festival (21.6%) (tracks, id, missing tracks, ...) (12" Vinyl, 2008, GB, Ozit-Morpheus Records, OZITLP8796)
3. Whitesnake - Live at Reading Rock Festival 1979 (19.4%) (tracks, id, artist, ...) (CD, 2011, XE, EMI, 50999 679550 2 2)
4. Bernard O Neill - Zumzeaux Live at Edinburgh Folk Festival 1993 (15.6%) (tracks, id, missing tracks, ...) (bandcamp, Vinyl, 2021, FR, Bernard O Neill)
5. Betsy Bell & Mary Gray, Come A Maying, Gemma Khawaja - Live at Leigh Folk Festival 2014 (14.9%) (tracks, id, artist, ...) (bandcamp, Digital Media, 2014, GB, Gemma Khawaja)
6. H.E.A.T - Live at Sweden Rock Festival (14.9%) (tracks, missing tracks, id, ...) (Digital Media, 2019, XW, earMUSIC)
7. Various Artists - Rock On: 1979 (14.1%) (tracks, missing tracks, id, ...) (1996, US)
8. Various Artists - Suomi-rock 1979 (13.5%) (missing tracks, tracks, id, ...) (CD, 1994, FI, Poko Rekords, CDROCK 79)
9. Crazyhead - Live at Reading Rock Festival 1989 remastered audio. (13.3%) (id, unmatched tracks, artist, ...) (bandcamp, Digital Media, 2016, GB, Crazyhead)
10. Steel Pulse - Live at Montreux Jazz Festival 1979 (11.9%) (tracks, id, artist, ...) (1979, CH)
11. ETRON FOU LELOUBLAN - Live At The Rock In Opposition Festival, 1978 (11.8%) (tracks, id, artist, ...) (bandcamp, Vinyl, 2015, FR, Replica Records)
12. 1978, Etron Fou Le Loublan,  “ Live At The Rock In Opposition Festival - New London Theatre »
par Dino (6.4%) (id, unmatched tracks, artist, ...) (bandcamp, Digital Media, 2018, FR, Revue & Corrigée)
# selection (default 1), Skip, Use as-is, as Tracks, Group albums,
Enter search, enter Id, aBort, plaY?
```

It is nice that it asks us to decide what to do next. However, it may soon become cumbersome for mass retagging. Moreover, the returned results are not always very accurate, even if the above example doesn't exemplify this claim. On the first run, the correct 2 CD set did not figure on the first position, although I don't why it is the case when I replicated the import process later.

### Onetagger

I came across this software by chance. I was surprised there was a Linux ready binary to download. The UI is quite nicely done, and it is easy to start the auto-tagging process. You must select one or more external sources, including iTunes (with limited queries) or Spotify (needs a free account). The results were quite deceptive. I got a lot of failed download from one source, and even if all queries to Apple Music were successful, I ended up with all ID3 infos removed from my tracks. Don't know why.

```shell
--8<--------
Mar 12 20:57:18.106 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-17 Crippled Child.mp3, module: onetagger::tagger
Mar 12 20:57:18.106 INFO iTunes rate limit delay: 2956, module: onetagger::tagger::itunes
Mar 12 20:57:21.489 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-15 All Night Party.mp3, module: onetagger::tagger
Mar 12 20:57:21.490 INFO iTunes rate limit delay: 2952, module: onetagger::tagger::itunes
Mar 12 20:57:24.748 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-13 Faceless.mp3, module: onetagger::tagger
Mar 12 20:57:24.748 INFO iTunes rate limit delay: 2963, module: onetagger::tagger::itunes
Mar 12 20:57:28.075 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-18 Flight.mp3, module: onetagger::tagger
Mar 12 20:57:28.076 INFO iTunes rate limit delay: 2954, module: onetagger::tagger::itunes
Mar 12 20:57:31.489 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-14 I Feel.mp3, module: onetagger::tagger
Mar 12 20:57:31.491 INFO iTunes rate limit delay: 2955, module: onetagger::tagger::itunes
Mar 12 20:57:35.100 INFO [ITunes] State: Ok, Accuracy: Some(1.0), Path: /home/chl/Media/Music/Albums/A Certain Ratio/Live At Leigh Rock Festiv
al '79 [Disc 1]/1-16 The Choir.mp3, module: onetagger::tagger
Mar 12 20:57:35.101 INFO iTunes rate limit delay: 2957, module: onetagger::tagger::itunes
Mar
-------->8--
```

### Picard

MusicBrainz is a recognized platform for tagging.

[Cmus]: /post/cmus/
[mpv]: https://mpv.io/
[streamlink]: https://streamlink.github.io/
[beets]: https://beets.io/
[The Factory Records]: https://www.ilikeyouroldstuff.com/news/40-years-of-factory-records

{{% music %}}XXX • _XXX_{{% /music %}}
