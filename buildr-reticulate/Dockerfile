ARG R_VER

FROM mangothecat/buildr-tidyverse:$R_VER

# Python (3), and virtualenv
RUN apt-get update -qq \
    && apt-get install -y \
	     python3-pip \
		 python3-dev \
	&& pip3 install virtualenv

# Conda dependencies
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# reticulate R package
RUN . /etc/environment \
    && install2.r --error \
      --repos 'http://www.bioconductor.org/packages/release/bioc' \
      --repos $MRAN \ 
	  reticulate
