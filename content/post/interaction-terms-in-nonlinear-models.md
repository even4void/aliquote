+++
title = "Interaction terms in nonlinear models"
date = 2008-04-15T09:22:39+01:00
draft = false
tags = ["readings", "rstats", "stata"]
categories = ["2008"]
+++

This discussion is primarily based on the following article, but see also<sup>(1,2)</sup>:
Ai, C. and Norton, E.C. (2003). <i class="fa fa-file-pdf-o fa-1x"></i> [Interaction terms in logit and probit models](http://www.unc.edu/~enorton/AiNorton.pdf). *Economics Letters*, **80**: 123-129.

<!--more-->

> The magnitude of the interaction effect in nonlinear models does not equal the marginal effect of the interaction term, can be of opposite sign, and its statistical significance is not calculated by standard software. We present the correct way to estimate the magnitude and standard errors of the interaction effect in nonlinear models.

The main ideas of this article is that both the test and interpretation of an interaction term in a GLM are done in the wrong way. Instead of interpreting the true interaction coefficient, discussion often relies on the marginal effect of the interaction term. What are marginal effect? In this context, it means that an interaction between two factors should be combined with the main effects marginal to that interaction<sup>(6,8)</sup>. Using the notation of the authors, the interaction effect is the cross derivative of the expected value of $y$:

$$ \frac{\partial \Phi(\cdot)}{\partial x\_1 \partial x\_2} = \underbrace{\beta\_{12}\Phi'(\cdot)}\_{\text{marginal effect}} \hskip-2ex + (\beta\_1 + \beta\_{12})(\beta\_2 + \beta\_{12}x\_1)\Phi''(\cdot). $$

If $\beta\_{12} = 0$, we have

$$ \frac{\partial^2 \Phi(\cdot)}{\partial x\_1 \partial x\_2}\Bigr|\_{\substack{\beta\_{12}=0}} = \beta\_1\beta\_2\Phi''(\cdot). $$

In addition, the authors highlight the fact that the interaction effect might be not negligible even if the corresponding $\beta = 0$. Further, the interaction effect is conditional on the independent variables. Finally, the sign of the interaction term does not necessarily indicate the sign of the interaction effect as it may have different signs for different values of the covariates. Altogether, these remarks should give support to the practitioner so that a careful examination of the model fit is done before concluding or interpreting the interaction effect without caution.

What's about the computation of the odds-ratio associated to the main effects when the interaction is significant? For instance, consider a logistic framework with two main effects, say $\beta\_1$ and $\beta\_2$ and a third coefficient $\beta\_{12}$ that represents the interaction. For the purpose of the illustration, we can easily imagine two such factors, e.g., the smoking status (smoker or not) and the drinking status (occasional vs. regular drinker). The response variable might be any medical outcome of potential interest (cancer, malignant affection, etc.), coded as a binary (0/1) variable. If the interaction is significant, then talking about the odds-ratio (OR) associated to the smoking variable has no sense at all. Instead, one must describe two OR: the OR for subjects who are smoker but occasional drinker, $\exp(\beta\_1)$ and the OR for subjects who are smoker and regular drinker, $\exp(\beta\_1 + \beta\_{12})$.

The two authors hold the necessary [Stata][Stata] code on their homepage. However, I would like to illustrate the issues raised by the interpretation of interaction terms when using non-linear models with [R][R].

The `effects` package facilitates in some way the graphical display of effects sizes and we will use it in the short application proposed in the next few paragraphs.

Let's consider the `Arrests` data, which is also used in (5) (See also this [brief report][brief report], and (9), Chap. II.2, p. 57) and aims at studying the probability of release of individuals arrested in Toronto for simple possession of small quantities of marijuana. Characteristics of interest are: race, age, employment, citizenship, previous recording in police databases.

```r
data(Arrests)
opar <- par(mfrow=c(2,2),las=1)
quali.var <- c(2,5,6,7)
for (i in quali.var)
  barplot(table(Arrests$released,Arrests[,i]),col=c(2,4),
          ylim=c(0,4000),xlab=colnames(Arrests)[i])
legend("topleft",c("Yes","No"),pch=15,col=c(2,4),bty="n",
       title="Released")
par(opar)
```

![](/img/20080414223544.png)
 
The above figure could hardly be interpreted as is because we need to consider both marginal (not shown) and conditional (these plots) distributions at the same time. However, we can run a reduced (compared to that used in (5)) model including colour, age and sex, as well as colour × age. This is done as follows:

```r
arrests.glm <- glm(released ~ colour + age + sex + colour:age,
                   family=binomial, data=Arrests)
summary(arrests.glm)
```

and here is the resulting output:
  
<table border="0">
  <tbody>
  <tr>
  <td>Effect</td>
  <td>Estimate</td>
  <td>Std. Error</td>
  <td>z value</td>
  <td>Pr(&gt;|z|)</td>
  </tr>
  <tr>
  <td>(Intercept)</td>
  <td>0.853219</td>
  <td>0.241020</td>
  <td>3.540</td>
  <td>0.0004 ***</td>
  </tr>
  <tr>
  <td>colourWhite</td>
  <td>1.645338</td>
  <td>0.241690</td>
  <td>6.808</td>
  <td>9.92e-12 ***</td>
  </tr>
  <tr>
  <td>age</td>
  <td>0.014389</td>
  <td>0.007822</td>
  <td>1.839</td>
  <td>0.0658 .</td>
  </tr>
  <tr>
  <td>sexMale</td>
  <td>-0.161870</td>
  <td>0.142805</td>
  <td>-1.133</td>
  <td>0.2570</td>
  </tr>
  <tr>
  <td>colourWhite:age</td>
  <td>-0.037299</td>
  <td>0.009362</td>
  <td>-3.984</td>
  <td>6.78e-05 ***</td>
  </tr>
  </tbody>
</table>

At first glance, the model seems quite satisfactory and no deviations from standard assumptions are noticed (see next Figure).

![](/img/20080414225804.png)

Now, we can get an ANOVA-like summary by issuing:<sup>(5)</sup>

```r
library(car)
Anova(arrests.glm)
```

The results are shown below:

```
Anova Table (Type II tests)   
Response: released
           LR Chisq Df Pr(>Chisq)
colour       81.854  1  < 2.2e-16
age           5.947  1    0.01474
sex           1.325  1    0.24962
colour:age   16.479  1  4.918e-05
```

![](/img/20080414232436.png)

Note that the vertical axis is labelled on the probability scale (i.e., the response scale) while the estimated effects are plotted on the scale of the linear predictor. The 95% (pointwise) confidence interval is wider at the extreme values of the age variable.

Now, we can proceed to the estimation of the interaction effect using the method proposed by Ai and Norton.

### References

1. Ai, C. and Norton, E.C. (2000). <a href="http://citeseer.ist.psu.edu/ai00interaction.html">Interaction terms in nonlinear models</a>. Unpublished draft manuscript.
2. Norton, E.C., Wang, H., and Ai, C. (2004). <a href="http://www.unc.edu/~enorton/NortonWangAi.pdf">Computing interaction effects and standard errors in logit and probit models</a>. *The Stata Journal*, **4(2)**, 154-167.
3. Hoetker, G. (2003). <a href="http://www.business.uiuc.edu/Working_Papers/papers/03-0100.pdf">Confounded coefficients: Accurately comparing logit and probit coefficients across groups</a>. *College of Business Working Papers*, University of Illinois.
4. Berry, W.D., Esarey, J., and Rubin, J.H. (2007). <a href="http://polmeth.wustl.edu/retrieve.php?id=692">Testing for interaction in binary logit and probit models: Is a product term essential?</a> *Working Papers of the Society for Political Methodology*.
5. Fox, J. (2003). <a href="http://www.jstatsoft.org/v08/i15/paper">Effect displays in R for generalized linear models</a>.* Journal of Statistical Software*, **8(15)**, 18 pp.
6. Fox, J. (1987). Effect displays for generalized linear models. In Clogg, C.C. (Ed.), *Sociological Methodology 1987*, pp. 347-361. American Sociological Association, Washington DC.
7. Rabe-Hesketh, S., Skrondal, A., and Pickles, A. (2001). <a href="http://www.gllamm.org/gllamerr.pdf">Maximum likelihood estimation of generalized linear models with covariate measurement errors</a>. *The Stata Journal*, **1(1)**, 26 pp.
8. Bouyer, J., Hémon, D., Cordier, S., Derriennic, F., Stücker, I., Stengel, B., and Clavel, J. (1995). *Épidémiologie, Principes et méthodes quantitatives*. Éditions INSERM.
9. Chen, C.-H., Härdle, W., and Unwin, A. (Eds.) (2008). *Handbook of Data Visualization*. Springer Verlag. 
10. Tomz, M., Wittenberg, J., and King, G. (2003). <a href="http://www.jstatsoft.org/v08/i01/paper">Clarify: Software for interpreting and presenting statistical results</a>. *Journal of Statistical Software*, **8(1)**, 29 pp.

[PDF version]: http://www.aliquote.org/pub/003-interaction.pdf
[Stata]: http://www.stata.com/ "Stata"
[R]: http://www.cran.r-project.org "CRAN"
[brief report]: http://goliath.ecnext.com/coms2/summary_0199-3319989_ITM
