d <- readRDS("../data/ess-one-round-fr.rds")

## Variables of interest:
vars <- c("tvtot", "rdtot", "nwsptot", "polintr", "trstlgl", "trstplc", "trstplt", "vote",
          "happy", "sclmeet", "inmdisc", "sclact", "health", "ctzcntr", "brncntr", "facntr",
          "mocntr", "hhmmb", "gndr", "yrbrn", "agea", "edulvla", "eduyrs", "pdjobyr",
          "wrkctr", "wkhct", "marital", "martlfr", "lvghw")

## do not use subset() otherwise attributes get lost
d <- d[vars]

for (v in vars) {
  atr <- attr(d[[v]], "labels")
  if (length(atr) > 0)
    d[[v]] <- factor(d[[v]], levels = as.numeric(atr), labels = names(atr))
}

## discard haven/tibble attributes
num.vars <- vars[sapply(d, is.numeric)]
d[num.vars] <- sapply(d[num.vars], as.numeric)
d <- as.data.frame(d)

## recode `happy' variable
levels(d$happy)[c(1,11)] <- c("0", "10")
d$happy <- as.numeric(as.character(d$happy))

saveRDS(d, file = "../data/ess-one-round-29vars-fr.rds")
