---
title: "Capture-recapture sampling"
date: 2020-01-05T20:06:52+01:00
draft: false
tags: ["statistics"]
categories: ["2020"]
---

Capture-recapture (CR) sampling is widely used in ecological research, epidemiology and population biology. I saw a [tweet](https://twitter.com/AndrewM_Webb/status/1212673397106388992) a few days ago that nicely illustrates the CR method using animated graphics, which has been followed by a [blog post](http://www.awebb.info/blog/iterated_mark) since then.

The basic idea underlying CR sampling is that you use simple random sampling to capture a set of _n_ individuals out of a population of size _N_, release this sample once all items have been marked, and then iterate. Sample sizes do not necessarily have to be identical among each capture stage, but you must assume that marking does not affect survival, and that the population is fixed (no death, no new individual). Suppose you take a first sample of size 10 and a second sample of size 15, of which 5 were already marked during the first stage, then the estimated population size would be (10 x 15) / 5 = 30. Obviously, the smaller the number of recaptures, the larger the estimate of population size will be, which makes sense if we think in term of measuring abundance of some quantity. How do we found this number? Assume that _x_ denotes the number of marked individuals in the observed sample, and _X_ the corresponding marked individuals in the population of size _N_. Then, assuming that the population and sample proportions are equal, i.e., _x/n = X/N_, we have _N = Xn/x_. This is known as the Lincoln-Peterson Index.[^1]

Another way to show this is to consider the following cross-classification table, where captured individuals are in columns and recaptured indivudals in rows:[^2]

|       | Yes | No  | Total       |
| ----- | --- | --- | ----------- |
| Yes   | a   | b   | a+b         |
| No    | c   | x   |             |
| Total | a+c |     | N = a+b+c+d |

Assuming the capture and recapture stage are independent, the estimated probability of being captured on both occasions is equal to the product of the probabilities of being captured on each occasion. The missed individuals, _x_, is then computed as follows: $\frac{a}{N} = \left( \frac{a+c}{N}\right)\times \left( \frac{a+b}{N}\right)$, whence $a(a+b+\hat x) = (a+c)(a+b)$ and $\hat x = \frac{bc}{a}$.

This of course is the _hypergeometric distribution_ in disguise. The hypergeometric distribution plays a central role in random sampling with finite populations. Let's consider an urn with red and black balls. Each time you draw a ball, without replacement: what's the probability of drawing _n_ red balls? Unlike the case of the binomial distribution, each drawing stage influence the outcome of the next draw since the ratios of red to black balls changes after each draw. Now let's replace red balls with marked individuals from the preceding paragraph, and let's call it _Y_ the number of individuals that were marked. The probability function of _Y_ reads:

$$ \Pr(Y = y) = \frac{{X \choose N}{N-X \choose n-x}}{{N \choose n}}, $$

such that the value _Xn/x_ shown above corresponds to the maximum likelihood estimate of _N_ (write up _P(N)/P(N-1)_ and find _N_ such that _P(N-1) < P(N)_).

Here are some highlights from a small [simulation](/pub/random_walk.r) in R. I used a 2D random walk to animate a population of 50 individuals, which were sampled once every 20 frames (sampling rate, 10/50). This baiscally looks like this in R:

```R
walker <- function(n, step = 0.1) {
  coord <- replicate(2, sample(c(-1, 1), n, rep = TRUE) + step * rnorm(n))
  return(apply(coord, 2, cumsum))
}
```

The remaining of the script is a simple loop to draw the main frame and select randomly 10 individuals every 20 frames. The size and position of the rectangle of sampling ensures that we see enough individuals, but it can be changed. Selected individuals are marked in black, and those who were marked at the preceding stage are highlighted in red. Ideally, we should observe 2 recaptures to recover the exact population size, (10 x 10) /2:

{{< fluid_imgs "pure-u-1-3|/img/rw0020.png" "pure-u-1-3|/img/rw0040.png" "pure-u-1-3|/img/rw0060.png" >}}

And the full story:

{{< figure src="/img/random_walk.gif" >}}

[^1]: Since this index is sensitive to the number of recapture, another index has been proposed, the Schnabel index (note that it also depends on the number of CR stages).
[^2]: Tlling, Kate. [Capture-recapture methods---useful or misleading?](https://academic.oup.com/ije/article/30/1/12/619016) _International Journal of Epidemiology_ 2001, 30: 12–14.
