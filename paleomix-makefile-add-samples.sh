#!/bin/sh

## first run:
paleomix bam makefile > makefile.yaml

## then edit parameteres and 
## run this script to add samples to the end of the paleomix makefile

## 1 = /PATH/TO/SAMPLE.list
## 2 = /PATH/TO/DATA/
## 3 = ProjectID

for SAMPLE in $(<$1); do

    echo "${SAMPLE}:" >> makefile.yaml
    echo "  ${SAMPLE}:" >> makefile.yaml
    echo "    ${SAMPLE}:" >> makefile.yaml

    # Identify all files that match the pattern
    FILES=("${2}${3}_${SAMPLE}"*_R1_001.fastq.gz)

    # Loop through the identified files
    for FILE in "${FILES[@]}"; do
        # Extract lane number from the file name
        NUM=$(echo "$FILE" | sed -n 's/.*_L00\([0-9]\+\)_R1_001\.fastq\.gz/\1/p')

        if [ -n "$NUM" ]; then
            echo "      Lane_${NUM}: ${2}${3}_${SAMPLE}_*_L00${NUM}_R{PAIR}_001.fastq.gz" >> makefile.yaml
        fi
    done
    
    echo " " >> makefile.yaml

    echo "Done with ${SAMPLE}"

done
