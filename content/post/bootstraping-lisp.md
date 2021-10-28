---
title: "Bootstrap resampling in Lisp"
date: 2021-10-28T20:18:41+02:00
draft: true
tags: ["lisp", "statistics", "retro"]
categories: ["2021"]
---

I came across several projects that aim to provide a more or less statistical package in Lisp or Scheme. The later one is [lisp-stat](https://github.com/Lisp-Stat/lisp-stat), which does not offer much at the time of this writing. The name of the project itself, with part of the code re-copyrighted after AJ Rossini or Luke Tierney under a different licence, makes me wonder where this project is going on, but this has already been [discussed on HN](https://news.ycombinator.com/item?id=26632429). Anyway, if we get something close to Luke Tierney's LispStat in Common Lisp, why not.

In the mean time, especially after reading [recent posts](https://kaygun.tumblr.com/) written by Atabey Kaygun, this led me to go back to my old LispStat code to see whether it is still a thing. Back at that time I started to write tutorials about LispStat. It was [10 years ago](/post/diving-into-lisp-for-statistical-computing/), and long after the R's era, that I learned some LispStat, and I even bought the book. I'm actually using xlispstat version 3.52.23, which I installed from [GitHub](https://github.com/jhbadger/xlispstat).

Today, we'll do some bootstrap resampling. First, we need a little helper function to compute a given statistic on a sample data $b$ times:

```lisp
(defun simulate (stat k fun)
  (let ((out ()))
    (dotimes (i k)
             (push (funcall stat (funcall fun))
                   out))
    out))
```

Let's test it using this simple instruction:

```lisp
(simulate #'mean 20 #'(lambda () (normal-rand 25)))
```

Now we can implement our `bootstrap` procedure. Note that LispStat comes with a built-in `sample` function, so we don't need to implement this part of the algorithm (the last parameter `t` meansto sample with replacement):

```lisp
(defun bootstrap (stat data b)
  (let ((n (length data))  )
    (simulate stat b
              #'(lambda () (sample data n t))
              )))
```

```lisp
(def x (normal-rand 100))
(bootstrap #'mean x 30)
```


