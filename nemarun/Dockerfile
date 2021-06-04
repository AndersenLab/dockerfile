FROM google/cloud-sdk:slim

LABEL Name="nemarun" Author="Sam Wachspress"

ARG version_id="bca4cb45a154e261912531fd901e146942e60e8c"

ENV NXF_VER=21.05.0-edge \
  NXF_MODE=google \
  NXF_EDGE=1

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends openjdk-11-jre wget

WORKDIR /nemarun
# force version here
RUN NXF_VER=21.05.0-edge NXF_MODE=google NXF_EDGE=1 \
    wget -qO- https://get.nextflow.io | bash
# add nextflow directory to path
ENV PATH="/nemascan:${PATH}"

# Fetch Pipeline Files
RUN wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/gcp.nf \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/nextflow.config

# Fetch Pipeline Config Files
WORKDIR /nemarun/conf
RUN wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/conf/annotations.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/conf/gcp.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/conf/mappings.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/conf/mappings_docker.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/${version_id}/src/conf/simulations.config


WORKDIR /nemarun

COPY nemarun.sh ./
RUN chmod +x ./nemarun.sh ./nextflow
