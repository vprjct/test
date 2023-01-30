#!/usr/bin/perl
# your code goes here
 
use strict;
use warnings;
use Encode;
 
# === utf8として使う準備 ===
my $enc = find_encoding 'utf8';
# === 準備ここまで ===
 
# === 入力系 ===
# print "文字列の入力：\n";
my $text = <STDIN>;
chomp($text);
# print "繰り返しの回数：\n";
my $cnt1 = <STDIN>;
chomp($cnt1); 
# print "段落の回数：\n";
my $cnt2 = <STDIN>;
chomp($cnt2);
# === 入力系ここまで ===
 
# 確認用
# print "文字列:${text}\n繰り返しの回数:${cnt1}\n段落の回数:${cnt2}\n";
 
# ループ処理を書いていく
# 段落回数ループ
for (my $i = 0; $i <$cnt2; $i++)
{
	# まず段落に入る文字を全部合体する
	my $result = $text;
	for (my $j = 0; $j < $cnt1; $j++)
	{
		$result = $result . $text;
	}
	# 日本語として扱うため一旦utf8化
	my $str = $enc->decode($result);
 
 	# 30文字ずつ切り出していく
	my $start = 0;
	my $end = length($str);
	# while構文
	while ($start < $end)
	{
		# $startから30文字切り出す
		my $substr = substr($str, $start, 30);
		# 出力するために再びunicodeに戻す
		my $out = $enc->encode($substr);
		# 出力
		print "$out\n";
		# 切り出す開始場所を30文字ずらす
		$start += 30;
	}
 
	# 段落
	print "\n";
}
