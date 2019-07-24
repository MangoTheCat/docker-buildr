FROM rocker/r-ver:3.6.1

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \ 
  libssl-dev \
  libcurl4-openssl-dev \
  wget \
  subversion \
  git \
  zlib1g-dev \
  && wget -q https://github.com/jgm/pandoc/releases/download/2.7.3/pandoc-2.7.3-1-amd64.deb \
  && dpkg -i pandoc-2.7.3-1-amd64.deb \
  && rm pandoc-2.7.3-1-amd64.deb \
  && . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    remotes

COPY build.sh /home/docker/

#WORKDIR /home/docker

#ENTRYPOINT ["/home/docker/build.sh"]
