FROM google/cloud-sdk:slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends openjdk-11-jre wget

LABEL Name="nemarun" Author="Sam Wachspress"
ENV NXF_VER=21.05.0-edge \
  NXF_MODE=google \
  NXF_EDGE=1

# force version here
WORKDIR /nemarun

RUN NXF_VER=21.05.0-edge NXF_MODE=google NXF_EDGE=1 \
    wget -qO- https://get.nextflow.io | bash

COPY nemarun.sh /nemarun/nemarun.sh
COPY /src/ /nemarun/src/

# add nextflow and nemarun directory to te system path and make them executable
ENV PATH="/nemarun:${PATH}"
RUN chmod +x /nemarun/nemarun.sh /nemarun/nextflow

WORKDIR /nemarun
