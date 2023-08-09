#!/usr/bin/tcsh
cd $argv[*]
ls ?? | xargs -l fgrep ../allcards -e | cut --complement -c1-2
ls ?H |& fgrep -v : | wc -l > temple1
ls ?C |& fgrep -v : | wc -l >> temple1
ls ?D |& fgrep -v : | wc -l >> temple1
ls ?S |& fgrep -v : | wc -l >> temple1
fgrep -q 5 temple1 && echo Flush!
ls [2-9]? |& fgrep -v : | cut -c 1 > faces
ls [TJQKA]? |& fgrep -v : | cat -n | tr "\t" "1" | tr "TJQKA" "01234" | cut --complement -c 1-6,9 >> faces
cat faces | sort | uniq -c | cut --complement -c 1-6,8- > facecounts
expr `wc -l < facecounts` == 4 | fgrep -q 1 && echo One pair!
expr `fgrep 2 facecounts | wc -l` == 2 | fgrep -q 1 && echo Two pair!
expr `fgrep 1 facecounts | wc -l` == 2 | fgrep -q 1 && echo Three of a kind!
expr `fgrep 4 facecounts | wc -l` == 1 | fgrep -q 1 && echo Four of a kind!
expr `cat facecounts | wc -l` == 2 | fgrep -q 1 && fgrep -q 3 facecounts && echo Full house!
expr `cat facecounts | wc -l` == 5 | fgrep -q 1 && expr `sort faces | tail -n 1` - `sort faces | head -n 1` == 4 | fgrep -q 1 && echo Straight!
expr `cat facecounts | wc -l` == 5 | fgrep -q 1 && expr `sort faces | tail -n 1` - `sort faces | head -n 1` == 12 | fgrep -q 1 && echo Straight!






