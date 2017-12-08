#!/usr/bin/perl -w
use strict;

## Time show
my $count=0;
my $total=962598;
my $time0 = time();

#open FAFILE, "test.fa";
#open (FAFILE, "hg19.fa") or die "No such fasta file";
open (FAFILE, "chr21.fa") or die "No such fasta file";
my $chrname=<FAFILE>;
my $chr;  # chromosome

# meger lines to string
while(my $line=<FAFILE>)
{
  chomp($line);
  $chr=$chr.$line; #link all string to a string
#  my $progress=100*$count/$total; #precent of finsh work
#  print "$progress\n";
  $count=$count+1;
}

# store to database
my $length=length $chr;
my $worldlength=11;
my $overlap=10;
for(my $i =0; $i<$length; $i=$i+$overlap){
  my $world=substr($chr,$i,$worldlength);
  
  #print("$world\n");

}

my $time1 = time();
my $data_time =$time1-$time0;
print "\nTime:$data_time s\n";
close FAFILE;
