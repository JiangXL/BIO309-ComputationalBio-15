#! /usr/bin/perl
# First excise

open FILE, 'E.colix';
$CG=0;
$AT=0;
#@Other=[]; 
@DNA=<FILE>;
$DNA_str=join('',@DNA);
#print "$DNA_str";
$len=length($DNA_str); 
print "Length","$len","\n";

$counter=0;
while($counter< $len){
    $base=substr($DNA_str,$counter,1);
 #   print $counter,$base,"\n";

    if($base eq 'C'){
       $CG=$CG+1;
    }
    elsif($base eq 'G'){
	$CG=$CG+1;
    }
    elsif($base eq 'A'){
	$AT=$AT+1;
    }
    elsif($base eq 'T'){
	$AT=$AT+1;
    }	
    else{
	print $base;
     }
    $counter=$counter+1;
}

print "CG:","$CG","\n";
print "AT:","$AT","\n";
print "CG%:",$CG/($CG+$AT),"\n";
