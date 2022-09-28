#!/bin/bash

foldersSubfoldersArray=("$@")

pointer=0

for dir in */ 
do
    for folder in "${foldersSubfoldersArray[$pointer]}"
    do
        cd ./"$dir"
        ### createExamFolders_NumericalAscendingOrder.sh 
        ### is set as GLOBAL ENV VARIABLE
        /e/Компютър\ 2017г.-2021г.\ най-важното/SoftUni/additional\ -\ useful/Scripts/createExamFolders.sh $folder
        ### Used for debugging
        #pwd
        #echo $folder
        cd ../

    done

    ((pointer++))
done

/e/Компютър\ 2017г.-2021г.\ най-важното/SoftUni/additional\ -\ useful/Scripts/gitkeepToEmptyFolders.sh