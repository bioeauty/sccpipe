# sccpipe
A pipeline for scRNA sequence analysis -- for c1 only 

```
Usage
sscpipe -I <InFileDir> -O <OUTFileDir> -G <GTFFILE> -Index <Index File>
```
## Requirements
* STAR  -- Aligment Tools 
* cutadapt -- A python lib for adapter and ploy A/T trimming
* BBmap -- we use the subfunction bbduk2 to filter the barcode
* HTSeq -- for quantify the gene expression(pip install)

