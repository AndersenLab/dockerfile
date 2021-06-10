FROM continuumio/miniconda
MAINTAINER Katie Evans <kathryn.evans@northwestern.edu>

RUN apt-get update && apt-get install -y procps

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

# install other tools not avalible on conda cloud

RUN R -e "install.packages('roperators',dependencies=TRUE, repos='http://cran.us.r-project.org')"
RUN Rscript -e "devtools::install_version('tidyverse', version = '1.3.0', repos = 'http://cran.us.r-project.org')"

COPY gcta64 /usr/bin/gcta64
RUN chmod +x /usr/bin/gcta64
