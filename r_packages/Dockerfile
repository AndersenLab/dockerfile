FROM continuumio/miniconda
MAINTAINER Katie Evans <kathryn.evans@northwestern.edu>

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

# install other tools not avalible on conda cloud
RUN apt-get update && apt-get install -y procps  
