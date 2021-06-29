# Code Explanation

- Create Column Headers and output to a file to be made in **argument 2** directory.

```sh
echo -e "Sample \t lib_type \t seq_reads_pairs \t seq_trash_pe_1 \t seq_trash_pe_1_frac \t seq_trash_pe_2 \t seq_trash_pe_2_frac \t seq_collapsed \t seq_collapsed_frac \t seq_retained_reads \t seq_retained_nts \t seq_retained_length \t hits_raw \t hits_raw_frac \t hits_clonality \t hits_unique \t hits_unique_frac \t hits_coverage \t hits_length" >> ${dir}PALEOMIX-summaries
```

- For loop through all samples in list (**argument 1**)
```sh
for sample in $SAMPLES; do
```
- each line assigns the results value to each parameter
    - example 1: lib_type=$(awk -v sample=${sample} '$3 == sample && $4 == "lib_type" {print $5}' ${sumdir}${sample}.summary)
        - `lib_type` = *variable*/column
        - `$(awk -v sample=${sample} '$3 == sample && $4 == "lib_type" {print $5}'`
            - assign (`print`) the value from the 5th column (`$5`) for the row where the 3rd column (`$3`) equals (`==`) the sample (`-v sample=${sample}`) and (`&&`) the 4th column (`$4`) equals (`==`) or contains (`~ /variable/`) the *variable* from the PALEOMIX summary file in **argument 3** directory (`${sumdir}${sample}.summary`)

- Output the results into each column
```sh
	echo -e "${sample} \t $lib_type \t $seq_reads_pairs \t $seq_trash_pe_1 \t $seq_trash_pe_1_frac \t $seq_trash_pe_2 \t $seq_trash_pe_2_frac \t $seq_collapsed \t $seq_collapsed_frac \t $seq_retained_reads \t $seq_retained_nts \t $seq_retained_length \t $hits_raw \t $hits_raw_frac \t $hits_clonality \t $hits_unique \t $hits_unique_frac \t $hits_coverage \t $hits_length" >> ${dir}PALEOMIX-summaries
```
- And done!
```sh
done
```