---
title: "On comparing trees"
date: 2020-02-28T15:41:20+01:00
draft: true
tags: ["bioinformatics", "rstats"]
categories: ["2020"]
---

Phylogenetic trees are used to visually depict the evolutionary relationships between a set of taxa. The branching pattern of such trees is called the topology of the tree, and an interesting question is: What statistcal measure can be used to compare the layout of different evolutionary trees, or in other words, to assess whether their topologies could be considered different. It turns out that the [Robinson-Foulds](https://en.wikipedia.org/wiki/Robinson–Foulds_metric) distance is exactly what we need, and it is available in the [phangorn](https://cran.r-project.org/web/packages/phangorn/index.html) R package.

Let's see it in action. We will use a multi-fasta file containing aligned sequence of different species, from [TreeBase](https://treebase.org/treebase-web/home.html). In this case, the dataset consists in 40 sequences of fungi analyzed in the following study: Untereiner W., & Naveaeu F. 1999. Molecular systematics of the Herpotrichiellaceae with an assessment of the phylogenetic positions of Exophiala dermatitidis and Phialophora americana. _Mycologia_, 91(1): 67-83. Since the data file is already in Nexus format, it is straightforward to import it in R:[^1]

```r
d = read.phyDat("~/tmp/M2043.nex", format = "nexus")
dm = dist.ml(d)
plot(upgma(dm), cex = .5)
```

Here are the results of building a tree using unweighted pair group method with arithmetic mean ([UPGMA](https://en.wikipedia.org/wiki/UPGMA), left) and neighbor joining ([NJ](https://en.wikipedia.org/wiki/Neighbor_joining), right):

{{< fluid_imgs "pure-u-1-2|/img/2020-02-28-15-54-00.png" "pure-u-1-2|/img/2020-02-28-16-00-00.png" >}}

Unrooted trees can be produces as easily by adding the `"unrooted"` option to the `plot` function. To compute the likelihood of this tree, we can use the following code:

```r
m = pml(NJ(dm), data = d)
logLik(m)
```

Here I got a log likelihood of -6526.059, with 77 degrees of freedom. Instead of this base model, we could consider the Jukes-Cantor model we discussed [earlier](/post/markov-random-process-using-mathematica/):

```r
m.jc = optim.pml(m, optNni = TRUE)
logLik(m.jc)  # 'log Lik.' -6451.672 (df=77)
```

Where do these degrees of freedom come from and how do we define the likelihood of a tree after all? Of course, the likelihood here stands for the probability that such a tree would have generated the data presented in the sequence under the chosen model. If we make the assumption that each site evolves independently, we can compute separately the likelihood at each site and add them up. For each site, its likelihood is defined as the sum of the probabilities of every possible ancestral states, which conform to the Jukes-Cantor substitution model (equiprobable substitutions and equiprobable base frequencies).

$$ \mathcal{L} = \prod_{j=1}^m \left[ \sum_z C_j(x, root)\cdot P(x) \right] $$

https://www.cs.tau.ac.il/~rshamir/algmb/00/scribe00/html/lec08/node24.html
https://www.biostars.org/p/179195/

[^1]: When only aligned sequences are available, we need to use `format = "fasta"` and convert the data to binary DNA fromat using, e.g., `ape::as.DNAbin()`.
