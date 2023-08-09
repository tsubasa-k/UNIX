#!/usr/bin/sed -nf
N;N;N;N;h
s/.[HCDS]//g;p;x
s/\(.[HCDS]\)[^\n]*/\1/g;s/\n/:/g;h
g
s/.\(.\)..\1..\1..\1..\1/Flush/p
s/\(.\)..\1..\1..\1..[^\1]./Four of a kind/p
s/[^\1]..\(.\)..\1..\1..\1./Four of a kind/p
