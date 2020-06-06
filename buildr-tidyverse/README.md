# BuildR Tidyverse Docker Image

Image based on [mangothecat/docker-buildr](mangothecat/docker-buildr) with the [tidyverse](https://cran.r-project.org/web/packages/tidyverse/index.html) package, and [testthat](https://cran.r-project.org/web/packages/testthat/index.html), pre-installed.


## Why?

Installing dplyr and friends takes a while. Some packages, (Rcpp and BH) take a long time to compile and are big. This image takes care of that, you can extend it relatively easily afterwards.

An analytical R package will often use dplyr + ggplot2 at a mininimum. So this gives one entry point for those packages.

## What exactly?

This is base R + remotes + tidyverse + testthat.

## Want more?

Most packages can install quickly at build time. If there are ones we use all the time I'll consider it. So maybe something like assertr? More importantly if there are common system depdendcies that you need, file and issue and make your case.
