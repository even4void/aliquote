+++
title = "Linear programming with GNU software"
date = 2008-04-10T09:22:09+01:00
draft = false
tags = ["psychometrics"]
categories = ["2008"]
+++

In my daily job, I'm involved in a project around adaptive testing. Basically, items are presented in an order that is dependent upon the estimated level of ability of the respondent. Parameters estimation can be done on the fly (time consuming) or can rely on more subtle computation based on overall test information and additional constraints (distributed content or thematics, etc.). Moreover, items can be collapsed into so-called items bundles. Taking into account such constraints during the building up of items sequence calls for linear programming ressources. However, it has been shown that linear programming models are not always applicable as some constraints cannot be satisfied simultaneously with some other constraints. Most of the initial work on tailored testing in educational measurement has been pioneered by [ETS][ETS] researchers<sup>(1,2)</sup>.

<!--more-->

Swanson and Stocking propose to use a weighted deviation model relying on LP with several constraints for the selection of items. Such constraints generally involve maximization of item information, restriction to selected topics or distributed content, minimization of item exposure, etc. In this view, these constraints shall be viewed as desirable properties rather than external conditions. Of course, bayesian techniques<sup>(3)</sup> have been proposed as well. An [on-line tutorial][on-line tutorial] is available on Lawrence M. Rudner's website. Note also that applications embedding a CAT approach don't restrict to education but also covered wide biomedical assessments<sup>(4)</sup>.

While I was looking for LP facilities within R, I found three related packages (see the [CRAN][CRAN] website for details): glpk, Rglpk, and linprog.

The former rely on the GNU [Linear Programming Kit][Linear Programming Kit], while the linprog package implements the simplex algorithm for solving linear optimisation problems. I know there is also LP tools with the [Matlab][Matlab] optimization toolbox but I don't use Matlab since I left my previous lab. However, I found a free implementation when googling for LP code, <i class="fa fa-file-code-o fa-1x"></i> [linprog.m][linprog.m]. It is Octave-compatible, and I happen to test it using a very simple problem.

Before starting with R, I take a look at GLPK on [GNU website][GNU website]. Starting using these tools was a little confusing as it is not a standalone C program taking as argument matrices and vectors describing the linear system, as usual, but the program glpsol relies on an external description file. Hereafter is a little demonstration of its use. Before that, we have to talk about the underlying modeling language, which is derived from the original [AMPL][AMPL] language. A <i class="fa fa-file-pdf-o fa-1x"></i> [free chapter][free chapter] of the official AMPL book is available to download.

At a glance, GLPK can handle several kind of problems using:

- simplex method 
- primal-dual interior point method 
- branch-and-bound method

There are also some additional facilities (translation from GNU [MathProg][MathProg], API, stand-alone LP/MIP solver). GNU MathProg is a subset of the AMPL language. It can be installed on Mac OS X using [Fink][Fink], or even compiled by hand. GLPK is a library of functions written in C and is entirely devoted to linear and integer programming. In addition, it includes a standard LP/IP solver, `glpsol`, and a modeling language, GMPL. There is, however, no graphical interface, and all is done using text file and the shell command line. A simple session would look like

```
$ glpsol --model model1.txt --output results1.txt
```

where `model1.txt` is an input file containing the required instructions in the GNU MathProg language. If the input file is ok, `glpsol` will process it.

The interested reader is referred to this two-parts [tutorial][tutorial] on IBM website.

Overall, several books have been published during the past 20 years<sup>(5)</sup>, but there is an extensive overview of adaptive testing aims and numerical realizations in [Computerized Adaptive Testing][Computerized Adaptive Testing], W.J. van der Linden and C.A.W. Glas (Kluwer, 2000). This book is divided in 15 chapters which cover 5 overlapping parts:

- Item selection and ability estimation 
- Applications in large-scale testing programs 
- Item pool development and maintenance 
- Item calibration and model fit 
- Testlet-based adaptive testing

Also, here is a <i class="fa fa-file-pdf-o fa-1x"></i> [short talk][short talk] I gave about CAT systems (in French).

### References

1. Swanson, L. and Stocking, M.L. (1993). <a href="http://www.aliquote.org/pub/pdf/Swanson-1993A%20Model%20and%20Heuristi.pdf">A model and heuristic for solving very large item selection problems</a>. *Applied Psychological Measurement*, **17(2)**, 151-166.
2. Stocking, M.L. and Swanson, L. (1993). <a href="http://www.aliquote.org/pub/pdf/Stocking-1993A%20Method%20for%20Severel.pdf">A method for severely constrained item selection in adaptive testing</a>. *Applied Psychological Measurement*, **17(3)**, 277-292.
3. van der Linden, W.J. (1998). Bayesian item selection criteria for adaptive testing. *Psychometrika*, **63(2)**, 201-216.
4. Cantillon, P., Irish, B., and Sales, D. (2004). <a href="http://www.bmj.com/cgi/content/full/329/7466/606?ehom">Using computers for assessment in medicine</a>. *BMJ*, **329**, 606-609.
5. Wainer, H., Dorans, N.J., Flaugher, R., Green, B.F., Mislevy, R.J., Steinberg, L., and Thissen, D. (1990). *Computerized adaptive testing: A primer*. Hillsdale NJ: Erlbaum.

[ETS]: http://www.ets.org/ "ETS"
[on-line tutorial]: http://edres.org/scripts/cat/catdemo.htm "CAT demonstration"
[CRAN]: http://cran.r-project.org/ "CRAN"
[Linear Programming Kit]: http://www.gnu.org/software/glpk/ "GLPK"
[Matlab]: http://www.mathworks.com/
[linprog.m]: http://kom.aau.dk/~borre/matlab/strang/linprog.m
[GNU website]: http://www.gnu.org/
[AMPL]: http://www.ampl.com/
[free chapter]: http://www.ampl.com/BOOK/ch1-2.pdf
[MathProg]: http://lpsolve.sourceforge.net/5.5/MathProg.htm
[Fink]: http://www.finkproject.org/
[tutorial]: http://www-128.ibm.com/developerworks/linux/library/l-glpk1/"
[Computerized Adaptive Testing]: http://www.utwente.nl/ico/publicaties/kluwer/adaptest/
[short talk]: http://www.aliquote.org/pub/CAT.pdf