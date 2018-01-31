+++
title = "The 6th CARME conference"
date = 2011-02-12T16:53:37+01:00
draft = false

tags = ["travels", "psychometrics"]
categories = []

[header]
image = ""
caption = ""
preview = true

+++

Just a few words about the [6th CARME](http://carme2011.agrocampus-ouest.fr/) conference, on Correspondence Analysis and Related Methods. I only attended a few sessions, but it was a great opportunity to see what's actually going on with data analysis of tabular data.

The conference was held on the Agrocampus in Rennes. I went in the same place two years ago for the [UseR! 2009](http://www.r-project.org/conferences/useR-2009/) conference (I found it too crowdy, but anyway there was really great stuff presented here). The fact is that some of the organizers are also those guys that develop the [FactoMineR](http://cran.r-project.org/web/packages/FactoMineR/index.html) package, which is a very useful R package. I used it a lot because it reminds me of the [SPAD](http://www.coheris.fr/en/page/produits/SPAD-data-mining.html) software. Other packages of interest are: [ade4](http://cran.r-project.org/web/packages/ade4/index.html), [anacor](http://cran.r-project.org/web/packages/anacor/index.html), [ca](http://cran.r-project.org/web/packages/ca/index.html), and [vegan](http://cran.r-project.org/web/packages/vegan/index.html). Also, as I am currently working on the Greenacre's book, *Multiple Correspondance Analysis and Related Methods* (Chapman & Hall/CRC, 2006), which summarizes the CARME 2003 conference, this conference was a good opportunity to sum up what I've already learned.

As I am currently reading some papers on biplots, let me summarize the talk that John Gower gave on that particular aspect of data analysis and visualization. Basically, there are two kinds of information displayed in a biplot: individuals and variables. Here, the "concept of approximation" is very important. A biplot provide an approximation of the relationships when considering all individuals together, or all variables together, or both. It is useful as a tool for visualizing results from multidimensional analysis; it is not a multidimensional analysis technique *per se*. There are two kinds of approximation that can be used: (a) by using the least squares properties of SVD, or (b) by representing "cases" by any form of MDS and then superimposing variables by either a regression method or by super superimposing nonlinear trajectories. The use of SVD in CA and data analysed has been recognized long ago, e.g. Belfrani (1873), Jordan (1874), Sylvester (1889), Eckhart & Young (1936), Gabriel (1971), and even Horst (1965). Biplots can be used for summarizing results of many techniques of multidimensional analysis, the differences between those being most of the times just a matter of how we initially transform the $X$ matrix.

<table>
<tr>
<th>Transformation</th><th>Technique</th>
</tr>
<tr>
<td>Centre and scale</td><td>PCA</td>
</tr>
<tr>
<td>Remove main effects</td><td>Biadditive</td>
</tr>
<tr>
<td>Pearson resiudals</td><td>CA</td>
</tr>
<tr>
<td>Row/Col χ<sup>2</sup></td><td>CA</td>
</tr>
<tr>
<td>Within-group dispersion</td><td>CVA</td>
</tr>
<tr>
<td>Dispersion (X'X)</td><td>FA</td>
</tr>
<tr>
<td>Dissimilarity (XX')</td><td>MDS</td>
</tr>
<tr>
<td>Constrained regression</td><td>Rank, CANOCO</td>
</tr>
<tr>
</table>
<br />

Another important concept that was evocated by Gower was that of Category Level Points (CLP) that are the $L_k$ points associated to a $k$-level categorical variable. The CLPs give an exact representation in a high-dimension space; and in the biplot approximation, points nearest the different CLPs define convex neighbour which amount to Prediction Regions.

The talk after was given by Michael Friendly, and the slides are available on his website, [datavis.ca/papers](http://datavis.ca/papers). (Just by browsing throughout these pages, I found a lot of other interesting stuff.) The main idea of the talk was to offer a deep overview of the [vcd](http://cran.r-project.org/web/packages/vcd/index.html), [vcdExtra](http://cran.r-project.org/web/packages/vcdExtra/index.html), and [gnm](http://cran.r-project.org/web/packages/gnm/index.html) packages, where the second one actually acts as a glue for the two other ones. The advantage of `gnm()` over the classical `loglin()` function from the `MASS` package is that it is formula-based and allows to incorporate various effects in the case of symmetric two-by-two table (e.g., symmetry or quasi-symmetry).

Stéphane Dray also gave an interesting overview of available method to combine multivariate and spatial data, using the famous "triplet" notation $(X,Q,D)$, where $X\; (n \times p)$ is a data matrix (eventually pre-transformed), and $Q\; (p \times p)$ and $D\; (n \times n)$ are distance matrices used to impose a metric on the variables and individual spaces, respectively. Such an approach baiscally allows two kind of eigendecomposition, namely $XQX'DK = K\Lambda$ and $X'DXQA = A\Lambda$. In the case of the PCA, we consider $X = \tfrac{(x_{ij} - \bar x_j)}{s_j}$, $Q = \mathbb{I}_p$, and $D = n^{-1}\mathbb{I}_n$. By using a spatial weighting matrix $W\; (n \times n)$, we are able to add a mathematical representation of the geographical layout of the region under study, i.e., through a connectivity matrix $C$ defined as $c_{ij}= 1$ if spatial units $i$ and $j$ are neighbors, 0 otherwise, and setting up $w_{ij} = \tfrac{c_{ij}}{\sum_jc_{ij}}$. Spatial autocorrelation can then be measured with Moran's coefficient or Geary's ratio, and statistical significance can be assessed using rerandomization technique. The problem is, however, to consider both aspects (multivariate and spatialisation) simultaneously. The multidimensional aspect can de bealed with any dimension reduction technique, like PCA. The geographical information can be processed by considering a partition or the use of extra explanatory variables. In any case, studying spatial patterns amounts to maximize the difference between regions. In the case we want to focus on eliciting a partition of the egographical regions, we can use Between-class analysis where we consider the triplet $(X,Q,D)$ and $Y$ which is a $n \times g$ matrix of dummy variables, which a new triplet $(A,Q,D_Y)$ where $A = (Y'DY)^{-1}Y'DX$. A latter approach is PCAIV where we consider a matrix $Z\; (n \times q)$ of explanatory variables and now work with the triplet $(\hat X,Q,D)$ with $\hat X = P_ZX = Z(Z'DZ)^{-1}Z'DX$. This approach shares similarities with Redundancy Analysis, CCA, and BCA. Stéphane Dray and Michale Friendly released the [Guerry](http://cran.r-project.org/web/packages/Guerry/index.html) package on CRAN which illustrates these concepts. There is also a paper in press for the *Annals of Applied Statistics* in the special issue on multivariate analysis.

Other abstracts that might be of interest are listed below. (See the <i class="fa fa-file-pdf-o fa-1x"></i> [abstract book](http://carme2011.agrocampus-ouest.fr/book_of_abstracts.pdf)
for more information.)

- Towards the integration of biological knowledge with canonical correspondence analysis when analyzing Xomic data in an exploratory framework, Verback et al.
- Cluster analysis with k-means: what about the details?, Roux
- First 50 years of Survo: from a statistical program to an interactive environment for data processing, by Vehkalahti and Sund
- Combinatorial inference in geometric data analysis: typicality test, Le Roux and Bienaise
- Logistic biplots for binary, nominal and ordinal data, Vicente-Villardon
- Nominal, ordinal and metric variables in the "social space"? Using CatPCA to examine lifestyles and regional identities in a medium-sized German city, Mühlichen

