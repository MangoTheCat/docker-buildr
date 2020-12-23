FROM mangothecat/buildr:4.0.3

RUN . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \
    tidyverse \
    testthat
