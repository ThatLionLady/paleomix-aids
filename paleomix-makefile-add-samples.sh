#!/bin/sh

## first run:
# paleomix bam makefile > makefile.yaml

## then edit parameteres and 
## run this script to add samples to the end of the paleomix makefile

for SAMPLE in $(<$1); do

    echo "${SAMPLE}:" >> makefile.yaml
    echo "  ${SAMPLE}:" >> makefile.yaml
    echo "   ${SAMPLE}:" >> makefile.yaml
    echo "     Lane_1: ${2}${SAMPLE}${READS}" >> makefile.yaml
    echo "     Lane_2: ${2}${SAMPLE}${READS}" >> makefile.yaml
    echo "     Lane_3: ${2}${SAMPLE}${READS}" >> makefile.yaml
    echo "     Lane_4: ${2}${SAMPLE}${READS}" >> makefile.yaml
    echo " " >> makefile.yaml

    echo "Done with ${SAMPLE}"

done