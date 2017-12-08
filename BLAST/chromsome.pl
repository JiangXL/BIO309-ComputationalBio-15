#!/usr/bin/perl -w
use strict;

my $time0 = time();
my @chr;  # chromosome
##### Seprate Chromsome
#open FAFILE, "test.fa";
#open (FAFILE, "hg19.fa") or die "No such fasta file";
open (FAFILE, "chr21.fa") or die "No such fasta file";
my $count=1;
my $total=49092493;

while(my $line=<FAFILE>)
{
  chomp($line);
  my $progress=100*$count/$total; #precent of finsh work
  print "$progress\n";
#  my $lastindex;

  if ( substr($line,0,1) eq '>')
    {

      print("$line\n");
      #print("$chr[$#chr]\n");
      push(@chr,''); #add new item in @chr
      #my $lastindex=$line;
      #print "$lastindex\n";
      #OPEN ('', "+>>"$chrnum"") or die "No such store file";
      #sysopen( store, $lastindex, O_CRETA);
      #$chrnum=$chrnum+1;
    }
  else
    {
      #store=store.$line;
      $chr[$#chr]=$chr[$#chr].$line;
      print("$count\n");
      #OPEN $line, +>>$lastindex or die "No such store file";
    }
  $count=$count+1;

}

my $time1 = time();
my $data_time =$time0-$time1;
print "$data_time";
close FAFILE;
