#! /usr/bin/perl
# my first program 
print "Hello world! \n";
print "-----------------Use of print------------------\n";
print "Here are difference between \" and \' \n";
print " Use  \" ";
$value = 24;
print "The value is $value\n";
print "Use \' ";
print ' The value is $value\n';

print "\n---------------- Operation-------------------\n";
print "4+4\n";
print 4+4, "\n";

$seq=200;
$new_seq=21;
$percent=($new_seq/$seq)*100;
print "Percent:", $percent, "\n";

print "------------------Merge two string--------------\n";
$seq1= "ACGT";
$seq2 ="GGGCT";
$seq3= $seq1.$seq2;
print $seq3,"\n";

print "--------------- Use of chomp and Input--------------\n";
print "Enter your test Name:";
$name=<>;
print "Before chomp: $name \n";
chomp $name;
print "After chomp: $name\n";

print "--------------- Operaction of File------------\n";
print "opening good.txt\n";
open FILE1, 'good.txt';
$line1=<FILE1>;
chomp $line1;
print "read and chomp the first line",$line1,"\n";
$line2=<FILE1>;
chomp $line2;
print "read and chomp the second line",$line2,"\n";
$line=$line1.$line2;
print "merge these string:", $line,"\n";

print "Reading to output output.txt\n";
open file2 ,'>output.txt';
print file2 $line;
print "Finish to write to file output.txt\n";

close FILE1;


print "-------------------- if  and die-----------------\n";
print "Enter your age and compare with 21:";
$age =<>;
chomp $age;
if($age>21){
    print "Larger than 21\n";
    #die "t";
}
else{
    print "No Larget than 21\n";
}


if($age == 10) {
    print "Age=10\n";
}elsif ($age>10){
    print "Age>10\n";
}else {
    print "Age<10\n";    
    #die "die";
}


print "----------------  Loops    ------------------\n";
$count =1;
while ($count<=10){
    print "count=$count\n";
    $count=$count +1;
}
print "End while loop\n";


print "---------------- Arrays -----------------------\n";
open FILE2, 'arraystest.txt';
@DNA=<FILE2>;
print '$DNA[0]',"$DNA[0]";
print "$DNA[1]";
print "$DNA[2]";
print "$DNA[3]";
push(@DNA,"element4");
print '4',"$DNA[4]\n";
$DNA=join('', @DNA);
print "$DNA\n";
$num= "abcd";
$lectter = substr($num,0,1);
print '$num=',"$num";
print '$lectter',$lectter,"\n";




