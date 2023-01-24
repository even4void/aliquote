## Little R script that comes along org-setup.org
## http://aliquote.org/articles/notebooks/org-setup.pdf
## Time-stamp: <2022-04-29 21:55:38 chl>
library(ggplot2)
library(directlabels)

theme_set(theme_minimal())

data(birthwt, package = "MASS")

birthwt$lwt <- birthwt$lwt * 0.45
birthwt$race <- factor(birthwt$race, levels = 1:3, labels = c("white", "black", "other"))

fm <- low ~ lwt + race
m <- glm(fm, data = birthwt, family = binomial)

d <- expand.grid(lwt = seq(40, 100), race = factor(levels(birthwt$race)))
d$yhat <- predict(m, d, type = "response")

p <- ggplot(data = d, aes(x = lwt, y = yhat, color = race)) +
       geom_line(aes(group = race), size = 1) +
       scale_color_brewer(palette = "Set2") +
       guides(color = FALSE) +
       labs(x = "Mother weight (kg)", y = "Pr(low = 1)", caption = "Predicted response curves")
direct.label(p + aes(label = race), method = "smart.grid")
