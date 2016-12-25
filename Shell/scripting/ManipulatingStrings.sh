#!/bin/bash

function internalfieldseparator(){
    echo "----Internal Field Seperator----"
    var="a+b+c"; echo "var: $var"
    IFS=$1; echo $var
}

function randomValues(){
    echo "----Random Values----"
    MAXCOUNT=10
    count=1

    while (( $count < $MAXCOUNT ));do
        echo "random$count: $RANDOM"
        ((count++))
    done
}

function substringExtraction(){
    echo "----Substring Extraction----"
    str=$1
    echo ${str}         # prints "ahmetfaruk"
    echo ${str:2:3}     # prints "met" , ${str:POSITION:LengthToBeExtracted
    echo ${str:2}       # prints "metfaruk", ${str:POSITION will extract from second position to length
    echo ${str:2:3}     # prints "met" , ${str:POSITION:LengthToBeExtracted
}

function substringRemoval(){
    echo "----Substring Removal----"
    str=abcABC123ABCabc
    echo ${str#a*C}     # "#" deletes shortest path from 'a' to 'C' : 123ABCabc
    echo ${str##a*C}    # "##" deletes longest path from 'a' to 'C' : abc
}

function substringReplacement(){
    echo "----Substring Replacement----"
    str=abcABC123ABCabc
    echo ${str/abc/xyz}          #  "/" replaces first match of 'abc' with 'xyz'           : xyzABC123ABCabc
    echo ${str//abc/xyz}        #  "//" replaces all matches of 'abc' with 'xyz'           : xyzABC123ABCxyz
    echo ${str/#abc/xyz}        #  "/#" replaces front-end first match of 'abc' with 'xyz' : xyzABC123ABCabc
    echo ${str/%abc/xyz}        #  "/%" replaces back-end  first match 'abc' with 'xyz'    : abcABC123ABCxyz
}


internalfieldseparator "+"
randomValues
substringExtraction ahmetfaruk
substringRemoval
substringReplacement

