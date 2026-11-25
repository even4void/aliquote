---
title: "STL decomposition using Stata"
date: 2026-11-25T20:40:40+01:00
draft: true
tags: ["statistics", "stata"]
categories: ["2026"]
---

I was working with Mathematica on some time series with billions of observations
which I stored in a single Parquet file so that I don’t have to wade through all
the individual CSV files one by one. With a sampling rate of 1 minute, this
means I have about 1440 observations per day, with a RAM footprint of about 8
bytes for the timestamp stored as 64-bit datetime, and additional 8 bytes per
measurement variables. Using 64-bit standard precision, which I assume MMA
relies on, I'm in the order of 92 KB for 7 floats and a 64-bit timestamp, for a
single day. I have 4,084,598 observations in total, which means about 245 MB in
RAM. The Parquet file loads fine, single-day analysis (plot + cross-correlation
and the like) as well, but I didn’t have the patience to wait for MMA to display
a `DateListPplot` for a single variable based on half the data. So I switched to
Stata to perform my macro-analysis.

I was basically looking to separate the general trend from the day-night cycles,
which is what STL decomposition is for to my understanding. Unfortunately,
there's no STL decomposition available in Stata, and the only recommendation I
found with Google fu was to rely on the Python integration, which is available
since Stata 16. Please forgive me, but I’ve only ever used Stata up to version
15, and I won't rely on Python for that very specific purpose.

{{% music %}}Sixth June • *Fear of Money*{{% /music %}}
