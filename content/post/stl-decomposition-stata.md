---
title: "STL decomposition using Stata"
date: 2026-11-25T20:40:40+01:00
draft: true
tags: ["statistics", "stata"]
categories: ["2026"]
---

I was working with Mathematica on some time series with billions of observations
which I stored in a single Parquet file so that I don’t have to wade through all
the individual CSV files one by one. MMA shocked on `DateListPlot`ìng a single
variable comprised of about 2 billions values.[^1] So I switched to Stata to
perform my macro-analysis.

I was basically aiming at separating the general trend from the day-night
cycles, which is what STL decomposition is for to my understanding.
Unfortunately, there's no STL decomposition available in Stata, and the only
recommendation I found with my Googling fu was to rely on the Python
integration, which is available since Stata 16. Please forgive me, but I’ve only
ever used Stata up to version 15, and I don't really want to use Python for that
very specific purpose.

Let's consider the [nottem][2] dataset use in R `stats::stl`, for which the
command `plot(stl(nottem, s.window = 7, t.window = 50, t.jump = 1))` produces
the following decomposition into trend, seasonal, and remainder:

{{< figure src="/img/2026-11-26-13-17-23.png" >}}

Data were collected each month between 1920 and 1939 (240 observations in
total).I will use a moving average (via `tssmooth`) and the same parameters for
the smoothing window (seasonal = 7 lags; trend = 50 lags) and forget about the
linear interpolation.

```stata
import delimited nottem.csv
gen time = tm(1920m1) + _n - 1
format time %tm
tsset time
quietly ucm x, model(llevel) seasonal(12)
predict trend, trend smethod(smooth)
predict seasonal, seasonal smethod(smooth)
predict remainder, residuals smethod(smooth)
tsline x, title("") xtitle("") ytitle("Raw data") xlabel(,nolabels) name(g1, replace)
tsline trend, title("") xtitle("") ytitle("Trend") xlabel(,nolabels) name(g2, replace)
tsline seasonal, title("") xtitle("") ytitle("Seasonal") xlabel(,nolabels) name(g3, replace)
tsline remainder, title("") xtitle("") ytitle("Remainder") xlabel(,format(%tmCY)) name(g4, replace)
graph combine g1 g2 g3 g4, cols(1) ysize(8)
```

```stata
gen month = month(dofm(date))
tssmooth ma trend = x, window(50 1 49)
gen detrended = x - trend
bysort month: egen seasonal = mean(detrended)
gen remainder = x - trend - seasonal
```


{{% music %}}Sixth June • *Fear of Money*{{% /music %}}

[^1]: With a sampling rate of 1 minute, I have about 1440 observations per day,
    with a RAM footprint of about 8 bytes for the timestamp stored as 64-bit
    datetime, and additional 8 bytes per measurement variables. Using 64-bit
    standard precision, which I assume MMA relies on, I'm in the order of 92 KB
    for 7 floats and a 64-bit timestamp, for a single day. I have 4,084,598
    observations in total, which means about 245 MB in RAM. The Parquet file
    loads fine, single-day analysis (plot + cross-correlation and the like) as
    well, but I didn’t have the patience to wait for MMA to display a
    `DateListPlot`.

[2]: /pub/nottem.csv
