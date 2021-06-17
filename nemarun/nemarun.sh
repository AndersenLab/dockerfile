#!/bin/bash
#
# This script acts as a wrapper around the execution of Nextflow to convert ordered
#   arguments into named parameters
#
#       Arg 1: Report ID
#       Arg 2: Google Storage data/report root path directory (cannot just be a bucket, it must be a subdirectory within a bucket) 
#               eg: "gs://bucket1/nemascan/reports"
#       Arg 3: Google Storage work root path directory (cannot just be a bucket, it must be a subdirectory within a bucket) 
#               eg: "gs://bucket2/workdir"
#
#
#   example: 'nemarun.sh d37a6511ac5170d3bf7d31d17ba872e0 gs://elegansvariation.org/reports/nemascan gs://nf-pipelines/workdir'
#   result: nextflow run gcp.nf 
#                   -profile gcp 
#                   --trait_file gs://elegansvariation.org/reports/nemascan/d37a6511ac5170d3bf7d31d17ba872e0/data.tsv 
#                   --out gs://elegansvariation.org/reports/nemascan/d37a6511ac5170d3bf7d31d17ba872e0/results
#                   --workDir gs://nf-pipelines/workdir/d37a6511ac5170d3bf7d31d17ba872e0
#   
#
nextflow run gcp.nf -profile gcp --trait_file ${2}/${1}/data.tsv --out ${2}/${1}/results --workDir ${3}/${1}
