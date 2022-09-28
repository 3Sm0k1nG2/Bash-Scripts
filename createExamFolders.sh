#!/bin/sh
DIRPATH=$0

# Help information
printHelp()
{
    echo "Usage: createExamFolders.sh 1:NUMBER-OF-FOLDERS 2:[0/1] 3:[0/1]"
    echo "Create folders in a the current directory."
    echo ""
    echo "    INFORMATION:"
    echo "    1: Number of folders to create."
    echo "    2: 0 - Create folders in no format: 00."
    echo "       1 - Create folders in brackets format: [00]. - DEFAULT"
    echo "    3: 0 - Do not run gitkeepToEmpty.sh, leaves folders empty."
    echo "       1 - Run gitkeepToEmpty.sh after creating folders. - DEFAULT"
}


if [[ $1 == "--help" || $# == 0 ]]
then
    printHelp
    exit 1
fi

re='^[0-9]+$'
if ! [[ $1 =~ $re ]]
then
    printHelp
    exit 1
fi

tasks=$1

# Folders formatting
format=1
if [[ $2 == 0 ]]
then
    format=0
fi

if [[ $format == 1 ]]
then
    # Format -> [00]
    for((i = 1; i <= $tasks; i++ ))
    do
        if [ $i -lt 10 ]
        then
            mkdir [0$i]
        else
            mkdir [$i]
        fi
    done
else
    # Format -> 00
    for((i = 1; i <= $tasks; i++ ))
    do
        if [ $i -lt 10 ]
        then
            mkdir 0$i
        else
            mkdir $i
        fi
    done
fi

# Ask to add file ''.gitkeep' to empty folders
addGitkeep=1
if [[ $3 == 0 ]]
then
    addGitkeep=0
fi

if [[ $addGitkeep == 1 ]]
then
    "$(dirname "$DIRPATH")"/gitkeepToEmptyFolders.sh
    cd ../
fi


echo "Succesfully created $tasks tasks."