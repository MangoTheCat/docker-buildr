FROM mangothecat/buildr:3.6.2

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

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# upgrade pandoc in conda too
RUN  /opt/conda/bin/conda install -y -c conda-forge pandoc=2.7.3

# reticulate R package
RUN . /etc/environment \
    && install2.r --error \
      --repos 'http://www.bioconductor.org/packages/release/bioc' \
      --repos $MRAN \ 
	  reticulate
