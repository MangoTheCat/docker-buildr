ARG R_VER

FROM mangothecat/buildr-reticulate:$R_VER

# Debian chromium appears to be too old
RUN apt-get update -qq \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# R package dependencies
RUN . /etc/environment \
    && install2.r --error \
      --repos 'http://www.bioconductor.org/packages/release/bioc' \
      --repos $MRAN \ 
	  devtools \
	  roxygen2 \
	  knitr \
	  rmarkdown \
	  yaml \
    pagedown \
    bookdown

# This sets the matplotlib backend to agg
ENV MPLBACKEND "agg"
