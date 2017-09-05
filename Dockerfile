FROM rocker/r-ver:3.3.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \ 
  libssl-dev \
  libcurl4-openssl-dev \
  && . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    remotes

COPY build.sh /home/docker/

#WORKDIR /home/docker

#ENTRYPOINT ["/home/docker/build.sh"]
