## Scripts to help with using [PALEOMIX](https://paleomix.readthedocs.io/en/v1.3.6/index.html).

- [Add Samples to Makefile](#add-samples-to-makefile)
- [PALEOMIX Wrangle](#paleomix-wrangle)

```sh
git clone https://github.com/ThatLionLady/paleomix-aids.git
cd paleomix-aids

# Add Samples to Makefile
chmod +x paleomix-makefile-add-samples.sh
ln -s paleomix-makefile-add-samples.sh /usr/local/bin/paleomix-makefile-add-samples

# PALEOMIX Wrangle
chmod +x paleomix-wrangle.sh
ln -s paleomix-wrangle.sh /usr/local/bin/paleomix-wrangle
```

# Add Samples to Makefile

**Adds samples to the end of the required makefile** for data in the format: ProjectID_SAMPLE_*_L00#_R{PAIR}_001.fastq.gz

```sh
paleomix-makefile-add-samples 1 2 3
```

1. Path to the file with list of samples.
2. Path to directory with FASTQs.
3. Project ID

- This isn't FULLY universal:
  - see [documentation](https://paleomix.readthedocs.io/en/stable/bam_pipeline/usage.html) for details on use of wildcards if changing because your data has a different format.

*Additional edits to the parameters within the makefile ARE needed before it's ready to run but this script is far better than having to add potentially hundreds of samples to the makefile by hand.*

# PALEOMIX Wrangle

**Compiles summaries into one file.**

```sh
paleomix-wrangle 1 2 3
```

1. Path to the file with list of samples.
2. Path of the directory you want the summaries file to end up in.
3. Path to directory with PALEOMIX summaries.


