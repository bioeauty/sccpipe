#!/usr/bin/perl
use warnings;
$good_reads = 0;
$poor_reads = 0;
$sample_name = $ARGV[0];
$recordname_pre = $ARGV[1];
$location_out=$ARGV[2];
$output = $location_out."/".$sample_name."_Sequence_location.txt";

%standard_index = (
	TAAGGCGA => "COL02",
	CGTACTAG => "COL04",
	AGGCAGAA => "COL11",
	TCCTGAGC => "COL09",
	GGACTCCT => "COL01",
	TAGGCATG => "COL03",
	CTCTCTAC => "COL12",
	CGAGGCTG => "COL10",
	AAGAGGCA => "COL08",
	GTAGAGGA => "COL07",
	GCTCATGA => "COL06",
	ATCTCAGG => "COL05",
	ACTCGCTA => "COL20",
	GGAGCTAC => "COL19",
	GCGTAGTA => "COL13",
	CGGAGCCT => "COL14",
	TACGCTGC => "COL15",
	ATGCGCAG => "COL16",
	TAGCGCTC => "COL17",
	ACTGAGCG => "COL18",
);

open(OUTPUT, ">", $output);
print localtime.": Start Run\n";
for($row_num = 1;$row_num < 41;$row_num++){
	if ($row_num < 10) {
		$input = $recordname_pre."ROW0"."$row_num"."_filter_R1.fastq";
		$row = "0$row_num";
	}
	else {
		$input = $recordname_pre."ROW"."$row_num"."_filter_R1.fastq";
		$row = $row_num;
	}
	open(INPUT, $input);
	while(<INPUT>){
		chomp;
		@line = split " ";
		$line[0] =~ s/@//;
		@index = split ":",$line[1];
		$sequence_index = $index[-1];
		if (exists $standard_index{$sequence_index}){
			print OUTPUT "$line[0]\t$sample_name"."_$standard_index{$sequence_index}"."ROW$row\n";
			$good_reads++;
		}
		else{
			$poor_reads++;
		}
		readline(INPUT);
		readline(INPUT);
		readline(INPUT);
	}
	close(INPUT);
}
close(OUTPUT);
print "Percentage of qualified index:".$good_reads/($good_reads+$poor_reads)."\n";
print "Total reads number: ",$good_reads+$poor_reads."\n".localtime." Run finished\n";