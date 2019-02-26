---
title: "DNA substitutions and Continuous Markov Random Process"
date: 2019-02-26T19:16:05+01:00
draft: true
tags: ["statistics","bioinformatics"]
categories: []
---

A few days ago, I read a thread on [Biostars](https://www.biostars.org/) which I haven't consulted in a while, [Wolfram mathematica in bioinformatic](https://www.biostars.org/p/172862/), and I often wonder why people are so critical of this software. The same applies to Stata (if you see the recent flame on Twitter, you know what I mean), albeit in this case there's not even [this man](https://blog.stephenwolfram.com/2019/02/seeking-the-productive-life-some-details-of-my-personal-infrastructure/) behind it. Anyway, here is a little post about using Mathematica to study the Jukes-Cantor model for DNA substitutions.

<!--more-->

## Finding the MLE

Say we are interested in comparing the genome of two species, assuming they have a common ancestor, which should be the case, at least for eukaryotes. According to the Jukes-Cantor model (Jukes, T. H. and Cantor, C. R., Evolution of protein molecules. In *Mammalian Protein Metabolism*, ed. Munro, H. N., pp. 21-132, New York: Academic Press, 1969), the probability that both species have the same nucleotide on an homologous site is $\Pr(\text{same}) = \frac{1}{4}(1+3e^{-8\mu t})$, hence $\Pr(\text{different}) = 1 - \Pr(\text{same}) = \frac{3}{4}(1-e^{-8\mu t})$. Now, if we compare $m$ sites, on which there are $n$ (independent) substitutions and we write $x = -8\mu t$, then the likelihood for the divergence time can be written:

$$\ell(t;n) = \left(\frac{1+3e^x)}{4}\right)^{m-n}\left(\frac{3(1-e^x)}{4}\right)^n.$$

The log-likelihood is then

$$\mathcal{L}(t;n) = (m-n)\log(1+3e^x) + n\log(1-e^x) + \text{some constant} \perp\hskip-5pt\perp t.$$

The MLE for the divergence time is obtained by differentiating $\mathcal{L}(t;n)$ wrt. $t$ and finding its root. This yields the following equation:

$$(m-n)\frac{-24e^x}{1+3e^x} + n\frac{8e^x}{1-e^x} = 0.$$

Mathematica gives me the following solution for $x$:

```Mathematica
In[13]:= Solve[d (8 x)/(1 - x) + (L - d) (-24 x)/(1 + 3 x) == 0, x]
Out[13]= {{x -> 0}, {x -> (-4 d + 3 L)/(3 L)}}
In[14]:= Simplify[(-4 d + 3 L)/(3 L)]
Out[14]= 1 - (4 d)/(3 L)
```

Solving for $t$ since we set $x = -8\mu t$, we get the estimate for the divergence time $\hat t = -\frac{1}{8\mu}\log\left(1-\frac{4n}{3m}\right)$.

## A little simulation

Here is how I setup the basic parameters for the DNA substitution model proposed by Jukes and Cantor:

```Mathematica
In[18]:= bases = {"a", "g", "c", "t"};
         exon = {.25, .25, .25, .25};
         α = 0.001;
         n = 100;
         s = RandomChoice[exon -> bases, n]
Out[22]= {"t", "g", "c", "t", "g", "c", "c", "g", "c", "t", "g", "a", \
"c", "g", "c", "g", "t", "t", "t", "g", "t", "t", "c", "c", "t", "c", \
"c", "a", "t", "a", "a", "g", "c", "c", "g", "c", "t", "g", "g", "t", \
"g", "a", "c", "t", "g", "c", "t", "a", "c", "c", "a", "a", "c", "g", \
"g", "t", "c", "a", "t", "g", "g", "a", "g", "g", "g", "g", "c", "c", \
"g", "c", "a", "c", "a", "g", "g", "g", "g", "t", "t", "g", "t", "c", \
"c", "g", "a", "t", "g", "g", "a", "a", "g", "c", "a", "g", "c", "a", \
"t", "t", "g", "a"}
In[23]:= tm = {{1 - α, α/3, α/3, α/3}, {α/3, 1 - α, α/3, α/3}, {α/3, α/3, 
          1 - α, α/3}, {α/3, α/3, α/3, 1 - α}};
```

Note that it is important to not use `MatrixForm` at this step, otherwise we will get in trouble with matrix multiplication later. The distribution of nucleotide frequencies is close to the expected ones (1/4), and multiplying the transition matrix `tm` by the vector of observed frequencies `fb` yields an updated vector of frequencies:

```Mathematica
In[24]:= fb = N[Tally[s][[All, 2]]/n, 6]
Out[24]= {0.220000, 0.330000, 0.270000, 0.180000}
In[25]:= tm.fb
Out[25]= {0.22004, 0.329893, 0.269973, 0.180093}
```

Finally, we can repeat the same process, say 10 times using `Nest`, and also plot how the frequency of As evolves over time:

```Mathematica
In[26]:= Nest[Function[x, tm.x], fb, 10]
Out[26]= {0.220398, 0.32894, 0.269735, 0.180928}
In[27]:= ListPlot[NestList[Function[x, tm.x], fb, 10000][[All, 1]], 
          PlotRange -> {{0, 10000}, {0.23, 0.27}}]
```

![](/img/jukes-cantor.png)
