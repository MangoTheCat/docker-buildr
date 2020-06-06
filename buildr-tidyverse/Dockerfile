ARG R_VER

FROM mangothecat/buildr:$R_VER

RUN . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    tidyverse \
    testthat
