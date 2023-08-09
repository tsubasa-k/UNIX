#!/usr/bin/sed -nf
N;N;N;N;h
s/.[HCDS]//g;p;x
s/\(.[HCDS]\)[^\n]*/\1/g;s/\n/:/g;h
g
:J;tJ
s/.\(.\)..\1..\1..\1..\1/Flush/p
s/\(.\)..\1..\1..\1..[^\1]./Four of a kind/p
s/[^\1]..\(.\)..\1..\1..\1./Four of a kind/p
$!d
/.*[FlushFour of a kind]/q
g
s/\(.\)..\(.\)..\(.\)..\(.\)..\(.\)./\1\2\3\4\5/;h;g
/.*\(.\)\1\1.*/!b x
    /\(.\)\1.\(.\)\2/c FullHouse
    /\(.*\)\(.\)\2\2[^\1]*/c Three of a kind
:x
/.*\(.\)\1.*/!b y
    /.*\(.\)\1.*\(.\)\2.*/c Two pair!
    /.*\(.\)\1.*/c One pair!
:y
s/$/_23456789T/
/\(.\{5\}\)_.*\1.*/c Straight
/\(.*\)A_\1.*/c Straight
/[9A]JKQT_.*/c Straight
/\(.*\)JQT_.*\1./c Straight
/\(.*\)JT_.*\1./c Straight
/.*/c Nothing










