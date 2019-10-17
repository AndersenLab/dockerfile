FROM continuumio/miniconda
MAINTAINER Ye Wang <yewangfaith@gmail.com>

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
 	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y procps

COPY conda.yml .
RUN \
   conda env update -n root -f conda.yml \
&& conda clean -a