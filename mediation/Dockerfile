FROM continuumio/miniconda
MAINTAINER Katie Evans <kathrynevans2015@u.northwestern.edu>

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

RUN apt-get update && apt-get install -y procps  
