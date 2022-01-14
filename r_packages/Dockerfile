FROM continuumio/miniconda
MAINTAINER Katie Evans <kathryn.evans@northwestern.edu>

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

# one day, move these to conda yml
RUN Rscript -e "install.packages('purrr', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN Rscript -e "install.packages('fuzzyjoin', dependencies = TRUE, repos = 'http://cran.us.r-project.org')"
RUN conda install -c conda-forge mscorefont

# install other tools not avalible on conda cloud
RUN apt-get --allow-releaseinfo-change update && \
	apt-get install -y procps && \
	rm -rf /var/lib/apt/lists/*