FROM rocker/r-ver:3.3.2

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \ 
  libssl-dev \
  libcurl4-openssl-dev \
  && . /etc/environment

WORKDIR /home/docker/pkg

ENTRYPOINT ["./build.R"]
