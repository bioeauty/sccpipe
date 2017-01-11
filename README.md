# sccpipe
A pipeline for scRNA sequence analysis -- for c1 only 

```shell
Usage
sscpipe -I <Input File Directory> -O <Output File Directory> -B <Barcode file in text>
```
## Dependencies
* [paralell](https://www.gnu.org/software/parallel/) -- (for parallel computing)
* [STAR](https://github.com/alexdobin/STAR)    -- Aligment Tools 
* [cutadapt](http://cutadapt.readthedocs.io/en/stable/guide.html) -- A python lib for adapter and ploy A/T trimming(pip install)
* [BBmap](https://sourceforge.net/projects/bbmap/)    -- we use the subfunction bbduk2 to filter the barcode
* [HTSeq](http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html)    -- for quantify the gene expression(pip install)
* [scater](http://bioconductor.org/packages/release/bioc/html/scater.html)   -- (Bioconductor R package -for constructing SCESET)

## Installation
```shell
git https://github.com/bioeauty/sccpipe.git
```
