#!/bin/sh

# Check if command-line arguments are provided
if [ "$#" -ne 3 ]; then
    echo "This renames chromosomes in BAMs to a rename-chr-pattern.txt file in the working directory."
    echo "Usage: $0 <SAMPLE.list> <DATA> <ProjectID>"
    echo ""
    echo "Arguments:"
    echo "SAMPLE.list   = Path to the list of samples"
    echo "DATA          = Path to Fastqs"
    echo "ProjectID     = Project number or prefix"
    exit 1
fi

## first run:

paleomix bam makefile > makefile.yaml

## then add samples to the end of the paleomix makefile:

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
