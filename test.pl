#!/usr/bin/perl
# your code goes here
 
use strict;
use warnings;
use Encode;
 
my $enc = find_encoding 'utf8';
 
# print "文字列の入力：\n";
my $text = <STDIN>;
chomp($text);
 
# print "繰り返しの回数：\n";
my $cnt1 = <STDIN>;
chomp($cnt1);
 
# print "段落の回数：\n";
my $cnt2 = <STDIN>;
chomp($cnt2);
 
# 確認用
# print "文字列:${text}\n繰り返しの回数:${cnt1}\n段落の回数:${cnt2}\n";
 
for (my $i = 0; $i <$cnt2; $i++)
{
	my $result = $text;
	for (my $j = 0; $j < $cnt1; $j++)
	{
		$result = $result . $text;
	}
	my $str = $enc->decode($result);
#	print "$result\n";
 
	my $start = 0;
	my $end = length($str);
#	print "$start , $end \n";
	while ($start < $end)
	{
#		my $str = $enc->decode($result);
		my $substr = substr($str, $start, 30);
		my $out = $enc->encode($substr);
		print "$out\n";
		$start += 30;
	}
 
	# 段落
	print "\n";
}
