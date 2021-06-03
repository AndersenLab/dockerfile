FROM nextflow/nextflow:21.05.0-edge
LABEL Name="nscalc" Author="Sam Wachspress"

# Fetch Pipeline Files
WORKDIR /nemarun
RUN wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/gcp.nf \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/nextflow.config

# Fetch Pipeline Config Files
WORKDIR /nemarun/conf
RUN wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/conf/annotations.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/conf/gcp.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/conf/mappings.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/conf/mappings_docker.config \
         https://raw.githubusercontent.com/northwestern-mti/NemaScan/eddbb5d04696e2350e537ea82ac3a44c2d1587c1/src/conf/simulations.config

WORKDIR /nemarun
ENV NXF_VER=21.05.0-edge \
  NXF_MODE=google \
  NXF_EDGE=1


