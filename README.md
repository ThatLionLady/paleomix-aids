## Scripts to help with using [PALEOMIX](https://paleomix.readthedocs.io/en/v1.3.6/index.html).

- [Add Samples to Makefile](#add-samples-to-makefile)
- [PALEOMIX Wrangle](#paleomix-wrangle)

# Add Samples to Makefile

**Adds samples to the end of the makefile.**

```sh
cd /makefile/directory/
paleomix bam makefile > makefile.yaml
bash paleomix-makefile-add-samples.sh 1 2
```

1. Path to the file with list of samples.
2. Path to directory with FASTQs.

- I haven't gotten around to making the script completely universal so it requires some editing:
  - be sure to include the proper number of lanes
  - edit `${READS}` to specify read data using proper wildcards
    - ex. `_*_L001_R{Pair}_001.fastq.gz`: see [documentation](https://paleomix.readthedocs.io/en/stable/bam_pipeline/usage.html) for details

*Additional edits to the makefile may be needed before it's ready to run but this script is far better than having to add potentially hundreds of samples to the makefile by hand.*

# PALEOMIX Wrangle

**Compiles summaries into one file.**

```sh
bash paleomix-wrangle.sh 1 2 3
```

1. Path to the file with list of samples.
2. Path of the directory you want the summaries file to end up in.
3. Path to directory with PALEOMIX summaries.


