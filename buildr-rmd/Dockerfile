FROM mangothecat/buildr-reticulate:4.1.2

# Debian chromium appears to be too old
RUN apt-get update -qq \
  && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# R package dependencies
RUN . /etc/environment \
    && install2.r --error \
      #--repos 'https://cloud.r-project.org' \
      #--repos 'http://www.bioconductor.org/packages/release/bioc' \
      #--repos $MRAN \
	  devtools \
	  roxygen2 \
	  knitr \
	  rmarkdown \
	  yaml \
    pagedown \
    bookdown

# This sets the matplotlib backend to agg
ENV MPLBACKEND "agg"
