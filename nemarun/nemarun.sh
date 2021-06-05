#!/bin/bash
if [ -n "${2}" ] #pipeline version passed as argument, download that version
  then
    rm -rf ./gcp.nf ./nextflow.config
    rm -rf ./conf
    mkdir conf
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
fi

cd /nemarun
/nemarun/nextflow -log /var/log run ./gcp.nf -profile gcp --trait_file ${1}/example_trait.tsv --out ${1}/results -resume