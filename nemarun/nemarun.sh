#!/bin/bash
/nemarun/nextflow run ./gcp.nf -profile gcp -log /var/log --trait_file ${1}/example_trait.tsv --out ${1}/results -resume