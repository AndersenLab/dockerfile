FROM google/cloud-sdk:slim

LABEL Name="nemarun" Author="Sam Wachspress"

ENV NXF_VER=21.05.0-edge \
  NXF_MODE=google \
  NXF_EDGE=1

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends openjdk-11-jre wget

WORKDIR /nemarun
# force version here
RUN NXF_VER=21.05.0-edge NXF_MODE=google NXF_EDGE=1 \
    wget -qO- https://get.nextflow.io | bash
# add nextflow directory to path
ENV PATH="/nemarun:${PATH}"

WORKDIR /nemarun

COPY nemarun.sh ./
RUN chmod +x ./nemarun.sh ./nextflow
