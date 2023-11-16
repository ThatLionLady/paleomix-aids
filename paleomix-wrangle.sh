#!/bin/sh

SAMPLES=$(<$1) 	# /PATH/TO/List-of-Samples.txt
dir=$2 			# /PATH/OF/MAIN/DIRECTORY/
sumdir=$3 		# /PATH/WITH/PALEOMIX/SUMMARIES/

echo "Compiling PALEOMIX summaries"

echo -e "Sample\t lib_type\t coverage\t max_depth\t seq_reads_pairs\t seq_trash_pe_1\t seq_trash_pe_1_frac\t seq_trash_pe_2\t seq_trash_pe_2_frac\t seq_collapsed\t seq_collapsed_frac\t seq_retained_reads\t seq_retained_nts\t seq_retained_length\t hits_raw\t hits_raw_frac\t hits_clonality\t hits_unique\t hits_unique_frac\t hits_coverage\t hits_length" > ${dir}PALEOMIX-summaries

for sample in $SAMPLES; do
	lib_type=$(awk -v sample="${sample}" '$3 == sample && $4 == "lib_type" {print $5}' "${sumdir}${sample}.summary")
	coverage=$(awk -v sample="${sample}" '$3 == sample && $4 == "*" {print $14}' "${sumdir}${sample}".*.coverage)
	max_depth=$(awk -v sample="${sample}" '$3 == sample && $4 == "*" {print $6}' "${sumdir}${sample}".*.depths)
	seq_reads_pairs=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_reads_pairs" {print $5}' "${sumdir}${sample}.summary")
	seq_trash_pe_1=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_trash_pe_1" {print $5}' "${sumdir}${sample}.summary")
	seq_trash_pe_1_frac=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_trash_pe_1_frac" {print $5}' "${sumdir}${sample}.summary")
	seq_trash_pe_2=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_trash_pe_2" {print $5}' "${sumdir}${sample}.summary")
	seq_trash_pe_2_frac=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_trash_pe_2_frac" {print $5}' "${sumdir}${sample}.summary")
	seq_collapsed=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_collapsed" {print $5}' "${sumdir}${sample}.summary")
	seq_collapsed_frac=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_collapsed_frac" {print $5}' "${sumdir}${sample}.summary")
	seq_retained_reads=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_retained_reads" {print $5}' "${sumdir}${sample}.summary")
	seq_retained_nts=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_retained_nts" {print $5}' "${sumdir}${sample}.summary")
	seq_retained_length=$(awk -v sample="${sample}" '$3 == sample && $4 == "seq_retained_length" {print $5}' "${sumdir}${sample}.summary")
	hits_raw=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_raw[^_]/ {print $5}' "${sumdir}${sample}.summary")
	hits_raw_frac=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_raw_frac/ {print $5}' "${sumdir}${sample}.summary")
	hits_clonality=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_clonality/ {print $5}' "${sumdir}${sample}.summary")
	hits_unique=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_unique[^_]/  {print $5}' "${sumdir}${sample}.summary")
	hits_unique_frac=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_unique_frac/ {print $5}' "${sumdir}${sample}.summary")
	hits_coverage=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_coverage/ {print $5}' "${sumdir}${sample}.summary")
	hits_length=$(awk -v sample="${sample}" '$3 == sample && $4 ~ /^hits_length/ {print $5}' "${sumdir}${sample}.summary")

	echo -e "${sample}\t $lib_type\t ${coverage}\t ${max_depth}\t $seq_reads_pairs\t $seq_trash_pe_1\t $seq_trash_pe_1_frac\t $seq_trash_pe_2\t $seq_trash_pe_2_frac\t $seq_collapsed\t $seq_collapsed_frac\t $seq_retained_reads\t $seq_retained_nts\t $seq_retained_length\t $hits_raw\t $hits_raw_frac\t $hits_clonality\t $hits_unique\t $hits_unique_frac\t $hits_coverage\t $hits_length" >> ${dir}PALEOMIX-summaries
done