#!/bin/bash

function checkParameterExists(){
    echo "\$#: $# , \$*: $* , \$@: $@ , \$!: $!"

    # $#: Returns the count of total arguments
    # $*: Returns the arguments as a single string
    # $@: Returns the arguments as a separated string
    index=1
    for arg in "$@";do
      echo "Arg #$index = $arg"
      let "index+=1"
    done

    for i in `seq 1 $#`;do
       echo "Arg2 #$i = ${!i}"
    done

    argsCount=$#
    lastarg=${!argsCount}
    echo "args: $argsCount lastarg= $lastarg"

    # -z => check string variable has zero length( is null)
    # -n => check string variable is not null
    if [ -z $1 ]; then
        echo "Usage: `basename $0` argument1 argument2 etc."
    fi

    #Another way to check argument exists
    if [ $# -lt 1 ]; then
        echo "value parameter is required to run script. i.e: `basename $0` ahmet mehmet can"
        exit
    fi

    testVar="ahmetFarukAtalay"
    echo ${#testVar}    # prints the length of testVar: 16
}

function fileAndDirectoryOperations(){
    filename="inputfile" && touch $filename && echo "$filename is created"
    echo $value >> $filename

    # -e => check file exists
    # -s => check file exists and is not empty
    # -f => check file exists and regular file and also is not directory
    # -d => check directory exists
    # -b => check file is a block device
    # -x => check file is executable
    # -w => check file is writable
    # -r => check file is readable
    if [ -s $filename ]; then echo "$filename exists and not empty"
    else echo "$filename exists and empty"
    fi

    dirname="inputdir" && mkdir -p $dirname && echo "$dirname is created"

    if [ -d $dirname ]; then echo "$dirname exists"
    else echo "$dirname not exists"
    fi

    rm -rf $filename $dirname && echo "$dirname and $filename are deleted"
}

#Long way to compare values and assign into another
function longCompare(){

    # -eq, -ne, -gt, -ge, -lt, -le is used with "[ ]" or " [[ ]]" but not with double paranteses: "(( ))"
    if [ $1 -lt 98 ]; then
        var0=9
    else
        var0=21
    fi
    echo $var0

    # < , > , <= , >= , == can be used with with "[ ]" or " [[ ]]"  or double parantheses: "(( ))"
    if (( $1 < 98 ));then
        echo "$1 is less than 98"
    fi

    if [[ $1 < 98 ]];then
        echo "$1 is less than 98"
    fi

}

#Short way to compare values and assign into another
function shortCompare(){
    (( var0 = $1 < 98 ? 9 : 21 )) && echo $var0     # C style trinary operation can be used integer comparison & assigment
}

function substituteStringInaString(){
    a="ahmet faruk atalay"
    b=${a/"faruk"/"can"}
    echo $b
}

#This function shows the comparison of variables without writing "if else conditions"
function shortComparisonOfVariables(){
    var1=$1
    var2=$2

    [[ $var1 == $var2 ]]
    echo $?   # if it prints 0, var1 and var2 are equals to each other. if it prints 1, they are NOT equal
}

function arithmeticCalculations(){
    let "z=5**3"    # 5*5*5
    echo "z = $z"   # z = 125

    n=1; echo "$n"                  # n :1
    let "n = n +1"; echo "$n"       # increments n => n: 2
    let "n+=1"; echo "$n"           # increments n => n: 3
    let n++; echo "$n"              # increments n also => n: 4
    (( n++ )); echo "$n"            # (c style increment) increments n also => n: 5

    #Small while loop with arithmetic calculation. It prints 0 to 10
    count=0
    test=ahmet
    while (( $count < 10 ));do          # while [[ $count -lt 10 ]];do can also be used
        echo $count; let count++;       # ((count++)) or let "count+=1" or another above cases can be used while incrementing

        if [[ $count -eq 5  && $test == "ahmet" ]];then     # [ $count -eq 5 ] && [ $test == "ahmet" ] can also be used. But [ $count -eq 5  && $test == "ahmet" ] is NOT permitted!!
            echo "count is 5 and test is $test";
        fi
    done
}

function testParam(){
    [ $# -eq 1 ] || echo "script has to take 1 parameter";
}

# $@ : gets whole arguments from commandline
checkParameterExists $@
fileAndDirectoryOperations
longCompare 92
shortCompare 92
substituteStringInaString
shortComparisonOfVariables "ahmet" "mehmet"
arithmeticCalculations
testParam a b c d
