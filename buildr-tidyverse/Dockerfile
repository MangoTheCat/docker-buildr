FROM mangothecat/buildr:4.1.2

RUN . /etc/environment \
  && install2.r --error \
    #--repos 'https://cloud.r-project.org' \
    #--repos 'http://www.bioconductor.org/packages/release/bioc' \
    #--repos $MRAN \
    tidyverse \
    testthat
