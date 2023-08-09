#!/usr/bin/tcsh
set faces = ( '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' )
set suits = ( '0' '0' '0' '0' )
set vals = ( '♦' '♥' '♠' '♣' )
foreach i ( `seq 0 51 | sort -R | head -5 | sort -g` )
	@ idx = 1 + $i / 13
	@ num = 1 + $i % 13
	echo -n \  `echo $num | grep "1[0-9]" | cut -c2 | tr "0123" "JQKA" || expr $num + 1`$vals[$idx]
	@ faces[$num]++
	@ suits[$idx]++
end
echo -n ": "
switch ( `echo $faces[*] | tr ' ' '\n' | sort -nr | tr -d '0\n'` )
    case 41:
        echo Four of a kind! ;breaksw
    case 32:
        echo Full house! ;breaksw
    case 311:
        echo Three of a kind! ;breaksw
    case 221:
        echo Two pair! ;breaksw
    case 2111:
        echo One pair! ;breaksw
    case 11111:	

	set flush = ""
	if ( `echo $suits[*] | tr ' ' '\n' | grep -q '5' && echo 1` ) set flush = \ Flush!
	if ( `echo $faces[*] | grep -o '1 1 1 1 1'` =~ '1 1 1 1 1' ) then		
	    echo Straight$flush!
	else if ( `echo $faces[-4] $faces[13]` == '1 1 1 1 1' ) then
	    echo Straight$flush!
	else if ( $flush != "" ) then
	    echo Flush!
        else
	    foreach i ( `seq 13 -1 1` )
		if ( $faces[$i] > 0 ) then
		    switch ( $i )
			case 13:
                            echo Ace high! ;breaksw ;exit
                        case 10:
                            echo Jack high! ;breaksw ;exit
                        case 11:
                            echo Queen high! ;breaksw ;exit
                        case 12:
                            echo King high! ;breaksw ;exit
                        default:
                            echo "`expr $i + 1`" high! ;breaksw ;exit
                    endsw
                endif
            end
	endif
endsw

