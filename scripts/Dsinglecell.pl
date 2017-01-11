#!/usr/bin/perl
#use strict;
use warnings;
my $inputsam=$ARGV[0];
my $reffile =$ARGV[1];
my $samplename=$ARGV[2];
my $outdir=$ARGV[3];
my @header;
my $b=1;
my $a=1;
my $i=1;
open(INSAM,$inputsam);
while($i==1){
        $_=readline(INSAM);
        if($_=~/@/){
               push @header,$_;

}
        else {$i=0 ; }

}
# generate 800 fastq files ...
while($b < 21){
	while($a < 41){
		if ($b < 10){
			if($a < 10){
				$filehandler = $samplename."_"."COL0"."$b"."ROW0"."$a";
			}
			else{
				$filehandler = $samplename."_"."COL0"."$b"."ROW"."$a";
			}
		}
		else{
			if ($a < 10){
				$filehandler = $samplename."_"."COL"."$b"."ROW0"."$a";
			}
			else{
				$filehandler = $samplename."_"."COL"."$b"."ROW"."$a";
			}
		}
		open($filehandler, ">", $outdir."/$filehandler.sam") or die "Can't open $filehandler: $!";
		print {$filehandler} @header;
		$a++;
	}
	$b++;
	$a = 1;
}


close(INSAM);
open(REFE,$reffile);
my $location_time=1;
my $total_record=0;
my $stopmark="no";
while($stopmark eq "no"){
	print "Start the round ".$location_time." Loading";
	$num=0;
	open(INSAM,$inputsam);
	undef %location;
	while(<REFE>){
	$total_record++;
	chomp;
	@line = split "\t";
	$location{$line[0]} = $line[1];
	$num++;
	if ($num%1000000 == 0){
		print localtime." : $num sequences are loaded\n";
	}
	$stopmark="yes" if eof;
	last if ($num > 140000000);
}
	print "Round ".$location_time." loading is done\n";
	
	print "Start the round ".$location_time." sorting\n";
	while(<INSAM>){
	$line = $_;
	chomp;
	@line = split "\t";
	if (exists $location{$line[0]}){
		print {$location{$line[0]}} $line;
	}
}
	close(INSAM);
	print "Round ".$location_time." sorting is done\n";
	$location_time++;
}
