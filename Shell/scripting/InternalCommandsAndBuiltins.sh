#!/bin/bash

#Read Command
function readCommand(){
    # Read command,reads line from file as below
    touch test; echo "a" >> test; echo "b" >> test; echo "c" >> test;
    while read line
    do
        echo $line
    done < test
    rm test

    # Read command,reads user action, processes as below
    arrowup='\[A'

    SUCCESS=0
    OTHER=65

    echo -n "Press a key: "
    read key

    echo -n "$key" | grep "$arrowup" # If key contains arrowup char, "$?" => will be 0 ( true) otherwise, 1 ( false)

    if [ "$?" -eq $SUCCESS ];then
        echo "Up-arrow key pressed."
        exit $SUCCESS
    fi

    echo "Other key: \"$key\" pressed. Please press up arrow key"
    exit $OTHER
}

readCommand