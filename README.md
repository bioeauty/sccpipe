# sccpipe
A pipeline for scRNA sequence analysis -- for c1 only 

```shell
Usage
sscpipe -I <Input File Directory> -O <Output File Directory> -B <Barcode file in text>
```
> For the first time, the ssc.conf should be filled 

```
### sscpipe.conf

################################ ssc.conf #######################################
#																				#
#	 			Configure the basic parameters for sscpipe						#
#																				#
#################################################################################

#The full path of your genome index
Indexpath=<>
#The full Path of your GTF file 
GTFFile=<>
#the CPU Thread  default = (maximum CPU cores -4)
Core_use=<>
```

## Dependencies (make sure the dependencies are in your enviroment)
* [paralell](https://www.gnu.org/software/parallel/) -- (for parallel computing)
* [STAR](https://github.com/alexdobin/STAR)    -- Aligment Tools 
* [cutadapt](http://cutadapt.readthedocs.io/en/stable/guide.html) -- A python lib for adapter and ploy A/T trimming(pip install)
* [BBmap](https://sourceforge.net/projects/bbmap/)    -- we use the subfunction bbduk2 to filter the barcode
* [HTSeq](http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html)    -- for quantify the gene expression(pip install)
* [scater](http://bioconductor.org/packages/release/bioc/html/scater.html)   -- (Bioconductor R package -for constructing SCESET)

## Installation (Test on Ubuntu)
```shell
# install parallel
sudo apt-get install parallel  

# install STAR 

#install cutadpat (if pip is not in place, you need to install pip first)
sudo pip install cutadpat

# install bbmap (download )
tar zxvf BBMap_36.84.tar.gz
cd bbmap/jni
make -f makefile.linux
cd ../../

# install HTSeq
sudo pip install HTSeq

# install scatter
# enter R
source("https://bioconductor.org/biocLite.R")
biocLite("scater")
# last step 
git https://github.com/bioeauty/sccpipe.git
```
