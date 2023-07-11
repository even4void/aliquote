---
title: "Data frames for Racket"
date: 2023-07-10T14:02:08+02:00
draft: true
tags: ["racket"]
categories: ["2023"]
---

Lately, I've been playing with two implementation of data frames in Racket: [uke](https://github.com/samdphillips/uke) and [data-frame]. The data-frame package by Alex Harsányi is the first one I used (one or two years ago) and I found it comfortable to use except it doesn't handle categorical variables, but see my preceding [review](/post/quick-csv-reader/).

Here is a toy example inspired by Travis Hinkleman's [recent post](https://www.travishinkelman.com/data-transformation-scheme/) about his own implementation of data frame for Chez Scheme. Note that the NYC flights dataset is a 29 Mo file, so it stands for a relatively honest benchmark for Racket's data processing capabilities.

First, here is the default CSV reader in action:

```racket
(require csv-reading)
(require net/url)

(define file
  (get-pure-port (string->url "https://www.travishinkelman.com/data/nycflights.tsv")))

(time
  (define data (csv->list file))
  (void))
; => cpu time: 4366 real time: 9121 gc time: 410
```

Not very convenient since we get a list of lists that would require some post-processing, but it's fast enough. To benchmark the data-frame package, I convertes the TSV to a proprer CSV format since this package doesn't handle [other separator](https://github.com/alex-hhh/data-frame/issues/11) unfortunately.

```racket
(require data-frame)

(define file "/home/chl/tmp/nycflights.csv")

(time
  (define data (df-read/csv file #:headers? #t))
  (void))
; => cpu time: 3708 real time: 3708 gc time: 759
```

Again, unfortunately, it doesn't handle categorical variables or dates (meaning they are stored as raw strings). Hence `df-describe` is pretty useless for variables like `carrier`, `dest`, or `time_hour`, and there's not much you can do unless you recode then using numeric codes, which is what I ended up doing once.

[tutorial](https://alex-hhh.github.io/2018/08/racket-data-frame.html)

{{% music %}}XXX • _XXX_{{% /music %}}
