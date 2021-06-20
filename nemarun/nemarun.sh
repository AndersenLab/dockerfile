#!/bin/bash
#
# This script acts as a wrapper around the execution of Nextflow to convert environment variables
#  into execution parameters
#   
#


if [[ -z "${TRAIT_FILE}" ]]; then
  echo "TRAIT_FILE environment variable must be set to the Google Storage path of the data"
  exit 1
fi

if [[ -z "${OUTPUT_DIR}" ]]; then
  echo "OUTPUT_DIR environment variable must be set to the Google Storage path of the output directory"
  exit 1
fi


if [[ -z "${WORK_DIR}" ]]; then
  echo "OUTPUT_DIR environment variable must be set to the Google Storage path of the working directory"
  exit 1
fi


cd /nemarun/
nextflow run gcp.nf -profile gcp --trait_file ${TRAIT_FILE} --out ${OUTPUT_DIR} --workDir ${WORK_DIR}

