FROM continuumio/miniconda
MAINTAINER Katie Evans <kathryn.evans@northwestern.edu>


COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

RUN Rscript -e "install.packages('tidyverse', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('devtools', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN conda install -c conda-forge tar
RUN ln -s /bin/tar /bin/gtar
RUN Rscript -e "devtools::install_version('rvcheck',version='0.1.8', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "BiocManager::install('ggtree')"

# install other tools not avalible on conda cloud
RUN apt-get --allow-releaseinfo-change update && apt-get install -y procps && \
	rm -rf /var/lib/apt/lists/*

# apt-get --allow-releaseinfo-change update && \