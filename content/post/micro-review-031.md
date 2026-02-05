---
title: "January in review"
date: 2026-02-05T09:32:43+01:00
draft: false
tags: ["readings"]
categories: ["2026"]
---

Here's a bunch of links that I didn't manage to post on the micro blog in due time.

- [Time Machine-style Backups with rsync](https://samuelhewitt.com/blog/2018-06-05-time-machine-style-backups-with-rsync): I always forget about hard links and this post explains how to take advantage of rsync's `--link-dest` option.

- Yet another blog post about rsync: [4x faster network file sync with rclone (vs rsync)](https://www.jeffgeerling.com/blog/2025/4x-faster-network-file-sync-rclone-vs-rsync/). I once complained that rsync was very slow on my MacBook for my own backups, and it looks that I may need to rely on [rclone](https://rclone.org).

- [Maze Algorithms](https://www.jamisbuck.org/mazes/): Astonishing online demo and algorithms. All the code is available on GitHub. It's Coffeescript, long time I never heard of this.

- Rust-like typedef for C as a short way of referring to fixed-length types: [some C habits I employ for the modern day](https://www.unix.dog/~yosh/blog/c-habits-for-me.html).

- [Bad apple but it's 6,500 regexes that i search for in vim](https://eieio.games/blog/bad-apple-with-regex-in-vim/), if you want to give vim golfing another try... On a related note, Evan Hahn explains how he [set all 376 Vim options and I'm still a fool](https://evanhahn.com/i-set-all-376-vim-options-and-im-still-a-fool/).

- [Notes on Apple’s Nano Texture](https://jon.bo/posts/nano-texture/): I do not work outside but I can confirm that the Nano texture display on my MacBook looks way better compared to the previous glossy displays I used to use.

- [Why DuckDB is my first choice for data processing](https://www.robinlinacre.com/recommend_duckdb/). I've tried it in the past and I always forget that often times it may provide a better alternative to SQLite, if only for dynamic column selection, queries that start with the FROM clause, function chaining, and list comprehensions, but see [Even Friendlier SQL with DuckDB](https://duckdb.org/2023/08/23/even-friendlier-sql#function-chaining). For a more challenging review, see Andy Pavlo's [Databases in 2025: A Year in Review](https://www.cs.cmu.edu/~pavlo/blog/2026/01/2025-databases-retrospective.html), although it does not deal with DuckDB.

- [OpenBSD-current now runs as guest under Apple Hypervisor](https://www.undeadly.org/cgi?action=article;sid=20260115203619). I need to give it a try with UTM at some point.

- [Python Numbers Every Programmer Should Know](https://mkennedy.codes/posts/python-numbers-every-programmer-should-know/): interesting summary of latencies as found in web framework, coroutines, list and dict operations, etc.

- [Effective Simulated Annealing with Python](https://nry.me/posts/2020-05-14/simulated-annealing-with-python/), with zero dependencies.

- [The fastest way to detect a vowel in a string](https://austinhenley.com/blog/vowels.html). On the importance of trying to swap the inner and outer loops.

> Replicating human perception is hard, and it's made harder when constrained to the limitations of display technology or printed images. You don't have to be ashamed about adjusting a photo when automated algorithms make the wrong call. --- [What an unprocessed photo looks like](https://maurycyz.com/misc/raw_photo/)
{{% music %}}Front 242 • _First In/First Out_{{% /music %}}
