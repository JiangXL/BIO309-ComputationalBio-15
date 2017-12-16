#!/usr/bin/perl -w
use strict;

## Time show
my $count=0;
my $total=962598;
my $time0 = time();

#open FAFILE, "test.fa";
#open (FAFILE, "hg19.fa") or die "No such fasta file";
open (FAFILE, "chr21.fa") or die "No such fasta file";
#my $chrname=<FAFILE>;
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

####### connect to databse ##############################
use DBI;

my $host = "localhost";         # 主机地址
my $driver = "mysql";           # 接口类型 默认为 lo
my $database = "HG19";        # 数据库
# 驱动程序对象的句柄
my $dsn = "DBI:$driver:database=$database:$host";
my $userid = "moyj";            # 数据库用户名
my $password = "moyj";        # 数据库密码

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;


############ store to database############################
my $length=length $chr;
my $worldlength=11;
my $overlap=10;
my $CHR=uc($chr);
for(my $i =0; $i<$length; $i=$i+$overlap){
  my $word=substr($CHR,$i,$worldlength);
	my $sth = $dbh->prepare("SELECT INTO CHR21
													(word,position)
													values
													(?,?)");   # 预处理 SQL  语句
	$sth->execute($word,$i) or die $DBI::errstr;    # 行 SQL 操作
	$sth->finish();
}


$dbh->disconnect();

my $time1 = time();
my $data_time =$time1-$time0;
print "\nTime:$data_time s\n";
close FAFILE;
