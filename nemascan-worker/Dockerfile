##############################################################################################################################
#
# This container includes a Python environment, binaries, and R packages that are required to
# execute the stages of the NemaScan nextflow pipeline. Each stage uses this base image and retrieves 
# additional stage-specific scripts and data from Google Cloud Storage as needed.
#
##############################################################################################################################
FROM continuumio/miniconda

LABEL Name="NemaScan-Worker"

RUN apt-get --allow-releaseinfo-change update && apt-get upgrade && apt-get install -y procps

# Install the Conda environment
COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

# install other R tools not avalible on conda cloud
RUN R -e "install.packages('roperators',dependencies=TRUE, repos='http://cran.us.r-project.org')"
RUN Rscript -e "devtools::install_version('tidyverse', version = '1.3.0', repos = 'http://cran.us.r-project.org')"

# Copy the gcta64 binary to the system path and make it executable
COPY gcta64 /usr/bin/gcta64
RUN chmod +x /usr/bin/gcta64
