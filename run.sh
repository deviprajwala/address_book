#!/bin/bash

#below seven lines is to ask the user whether they are interested to view the input file
echo "want to view the input file? y/n"
read response
if [[ "$response" -eq "y" ]]
then
    echo The redirected input \file is
    cat in.txt
fi

#initially the script doesn't have permission to execute hence the below commans has to be included
chmod u+x address_book.sh

#command to run the script along with redirection for input and output file
bash address_book.sh<in.txt>out.txt

#below seven lines is to ask the user whether they are interested to view the output file
echo "want to view the output file? y/n"
read response
if [[ "$response" -eq "y" ]]
then
    echo The redirected output \file is
    cat out.txt
fi
