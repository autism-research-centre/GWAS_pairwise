# GWAS_pairwise

This is the basic R script to create a file that can be used for pairwise colocolization analysis

The R script is very rudimentary. 

Details of pairwise colocolization can be found here:https://github.com/joepickrell/gwas-pw

A couple of points to note:

1. Ideally the samples should not have any overlap. If they do, the correlation of Z scores under the null must be calculated and passed onto the -cor function

2. The files must be ordered based on basepair position by chromosome

3. You must modify the files to suit your needs. As mentioned earlier, this is a very rudimentary R script.

4. The pos limits have been set keeping in mind the bed file used to generate approximate LD blocks. **Ensure the genome build for the GWAS is same as the bed file. The genome build is hg19 (same as 1000 Genomes phase 1)**

5. LD blocks can be downloaded from here:https://bitbucket.org/nygcresearch/ldetect-data (european sample)

Basic script used:

```bash
./gwas-pw -i "yourinputfilename" -phenos "pheno1name" "pheno2name" -o "outputfilename" -cor "include_correlation_under_null_if_available" -bed fourier_ls-all.bed
```
