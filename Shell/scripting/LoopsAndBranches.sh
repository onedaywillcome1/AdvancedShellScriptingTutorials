#!/bin/bash

function forLoops(){
    echo "----For Loops----"
    NUMBERS="55 22 11"

    #Print seperated lines
    for number in $NUMBERS; do
        echo $number
    done
    echo "---"

    #Print one line if double quote `"` is used
    for number in "$NUMBERS"; do
        echo $number
    done
    echo "---"

    for file in `ls -ltr [SM]*.sh`;do   # It loops only files names beginning with 'S' OR 'M'
        if [ -e $file ]; then
            echo "$file exists"
        fi
    done

    # Those 4 different for loops prints numbers from 1 to 10.
    for i in 1 2 3 4 5 6 7 8 9 10; do
        echo -n "$i "
    done
    echo

    LIMIT10

    for i in `seq $LIMIT`; do
        echo -n "$i "
    done
    echo

    for i in `eval echo {1..$LIMIT}`; do
        echo -n "$i "
    done
    echo

    #C style for loop
    for (( i=1; i<=$LIMIT; i++));do
        echo -n "$i "
    done
    echo
}

function whileLoops(){
    echo "----While Loops----"

    #Those below 4 different type while loops, prints numbers from 1 to 10
    i=1
    while (( i <= 10 ));do      # C style while loop
        echo -n "$i "; ((i++));
    done
    echo

    i=1
    while [ $i -le 10 ];do      # Bash style while loop
         echo -n "$i "; let "i+=1";
    done
    echo

    i=1
    while : ; do                # Infinite loop breaks when counter greater than 10
        if (( $i > 10 )); then
            break
        fi
        echo -n "$i "; ((i++))
    done
    echo

    counter=1
    while condition; do         # It checks condition via outer function
        echo -n "$counter ";((counter++))
    done
    echo

    #Read line from file via while loop
    FILENAME=ahmet.txt
    if [ ! -e $FILENAME ] ; then
        echo "a;b;c;d;e" > $FILENAME
    fi
    echo "Content of $FILENAME :" `cat $FILENAME`
    IFS=";"
    while read line; do
        echo $line
    done < $FILENAME
    rm $FILENAME
}

function condition(){
    if (( $counter > 10)); then
        return 1        # Return false
    fi
    return 0            # Return true
}

#Nested function prints as below:
# 999999999
# *88888888
# **7777777
# ***666666
# ****55555
# *****4444
# ******333
# *******22
# ********1
function nestedLoop(){
    for (( i=9; i > 0; i--));do
        for (( j=i; j<9; j++ ));do
            echo -n "*"
        done
        for (( j=i; j>0; j-- ));do
            echo -n $i
        done
        echo
    done
}




forLoops
whileLoops
nestedLoop
testParam a b c d