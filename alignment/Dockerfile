FROM continuumio/miniconda
MAINTAINER Ye Wang <yewangfaith@gmail.com>

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a

RUN apt-get update && apt-get install -y procps