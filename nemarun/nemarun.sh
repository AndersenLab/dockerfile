#!/bin/bash
if [ -n "${2}" ] #pipeline version passed as argument, download that version, otherwise download latest
  then 
    VERSION="${2}"
  else
    VERSION="cendr_dev"
fi

rm -rf /nemarun/gcp.nf /nemarun/nextflow.config
rm -rf /nemarun/conf
mkdir /nemarun/conf
cd /nemarun
# Fetch Pipeline Files
wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/gcp.nf \
    https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/nextflow.config

# Fetch Pipeline Config Files
cd conf
wget https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/conf/annotations.config \
    https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/conf/gcp.config \
    https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/conf/mappings.config \
    https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/conf/mappings_docker.config \
    https://raw.githubusercontent.com/northwestern-mti/NemaScan/${2}/src/conf/simulations.config
  


cd /nemarun
/nemarun/nextflow run ./gcp.nf -profile gcp --trait_file ${1}/data.tsv --out ${1}/results