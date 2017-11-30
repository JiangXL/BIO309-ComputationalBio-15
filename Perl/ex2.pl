#!/usr/bin/perl

#modify from ps1_perl_answers_2002-2.pl

###########################
#### The Central Dogma ####
###########################


### Genome
$DNA_seq = "CATTACGATGCATTGATTTTTCAAAGGAATGTACTATCGAAATCACAAGTCGTGGACTACGGTTTGCAGTGGAGGAATCGCAGTCTTTGCAGGCTCACGCCTTTCTTGATAAGTCGTTGTTTCAAACGTTTAATTTTCAGGGTGATTCAGATGGGGATACATATATGTTCCAGACGATGATTTCACCT"; # DNA sequence to translate

### Transcription: DNA-->RNA
$RNA_seq = $DNA_seq; # copies DNA sequence
$RNA_seq =~ s/T/U/gi; # replaces T's with U's (g=global, i=case insensitive)
ssprintf($DNA_seq,$RNA_seq,50,'DNA','RNA'); # print result


### Translation: RNA--> Amino acid
@AminoSeq;
$position = 0; # start position
while (substr $RNA_seq,$position,3) { # executes loop until end of string reached
	$codon = substr $RNA_seq,$position,3; # defines the codon
	push(@AminoSeq,translate_codon($codon)); # calls the translate codon subroutine and prints result
	$position = $position + 3; # moves ahead 3 bases
}
ssprintf($RNA_seq,join('',@AminoSeq),50,'RNA','Pro');


### Reverse-conplement RNA sequence
@RNA_re_seq; # new array to store rRNA
$postion2 = 0;
while (substr $RNA_seq,$position2,1){
	$base =substr $RNA_seq,$position2,1;
	if($base eq 'C'){
		push(@RNA_re_seq,'G');
	}
	elsif($base eq 'G'){
		push(@RNA_re_seq,'C');
	}
	elsif($base eq 'A'){
		push(@RNA_re_seq,'U');
	}
	elsif($base eq 'U'){
		push(@RNA_re_seq,'A');
	}

	$position2 = $position2+1;
}
$RNA_re_seq_str=join('',@RNA_re_seq);
ssprintf($RNA_seq,$RNA_re_seq_str,50,'RNA','Rev');


### Translation: reverse RNA --> Amino Seq
@AminoSeq2;
$position3 = 0; # start position
while (substr $RNA_re_seq_str,$position3,3) {
	$codon = substr $RNA_re_seq_str,$position3,3;
	push(@AminoSeq2,translate_codon($codon));
	$position3 = $position3 + 3;
}
ssprintf($RNA_re_seq_str,join('',@AminoSeq2),50,'Rev','Pro');


sub translate_codon { # subroutine to translate codons
	if ($_[0] =~ /GC./i) {return Ala;} # matches to "GC then any letter" returns Ala
	if ($_[0] =~ /UGC|UGU/i) {return Cys;} # matches to UGC or UGU returns Cys
	if ($_[0] =~ /GAC|GAU/i) {return Asp;} # etc...
	if ($_[0] =~ /GAA|GAG/i) {return Glu;}
	if ($_[0] =~ /UUC|UUU/i) {return Phe;}
	if ($_[0] =~ /GG./i) {return Gly;}
	if ($_[0] =~ /CAC|CAU/i) {return His;}
	if ($_[0] =~ /AUA|AUC|AUU/i) {return Ile;}
	if ($_[0] =~ /AAA|AAG/i) {return Lys;}
	if ($_[0] =~ /UUA|UUG|CU./i) {return Leu;}
	if ($_[0] =~ /AUG/i) {return Met;}
	if ($_[0] =~ /AAC|AAU/i) {return Asn;}
	if ($_[0] =~ /CC./i) {return Pro;}
	if ($_[0] =~ /CAA|CAG/i) {return Gln;}
	if ($_[0] =~ /AGA|AGG|CG./i) {return Arg;}
	if ($_[0] =~ /AGC|AGU|UC./i) {return Ser;}
	if ($_[0] =~ /AC./i) {return Thr;}
	if ($_[0] =~ /GU./i) {return Val;}
	if ($_[0] =~ /UGG/i) {return Trp;}
	if ($_[0] =~ /UAC|UAU/i) {return Tyr;}
	if ($_[0] =~ /UAA|UGA|UAG/i) {return "***";} # Stop codons
}



sub ssprintf{ # Format string output
	$orignal_str=$_[0];
	$change_str=$_[1];
	$str_len=$_[2];
	$ori_name=$_[3];
	$change_name=$_[4];
	$position4=0;

	while (substr $orignal_str,$position4,$str_len) {
		$output_orignal = substr $orignal_str,$position4,$str_len;
		$output_change  = substr $change_str, $position4,$str_len;
		print "$ori_name: ";
		print "$output_orignal\n";
		print "$change_name: ";
		print "$output_change\n";
		$a=1;
		while($a<$str_len+length(change_name)-5){
					print "-";
					$a=$a+1;
		}
		print "\n";
		$position4 = $position4 + $str_len;
	}
}
