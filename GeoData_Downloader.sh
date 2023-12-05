#!/bin/bash
####################### Geo*Data ######################

#################### Set Variables ####################

# License string
license="your_license"

# Release version
release_version="latest"  

# Target directory - where you want to download files to; The default is current directory.   
target_directory=$PWD

# Program directory - where you put MelissaUpdater.exe; The default is current directory.
# Melissa Updater source code: https://github.com/MelissaData/MelissaUpdater
# Melissa Updater binary download link: https://releases.melissadata.net/Download/Library/LINUX/NET/ANY/latest/MelissaUpdater
program_directory="$target_directory/MelissaUpdater"
program_path="$program_directory/MelissaUpdater"


###################### Functions ######################
 
Get-File() 
{
    path="$target_directory/$6" 
    
    verifyPath="$target_directory/$6/$1"
    $program_path verify --path $verifyPath
    
    if [ $? -eq 0 ];
    then
        eval "$program_path file --filename $1 --release_version $release_version --license $license --type $2 --os $3 --compiler $4 --architecture $5 --target_directory $path "
    else
        eval "$program_path file --force --filename $1 --release_version $release_version --license $license --type $2 --os $3 --compiler $4 --architecture $5 --target_directory $path "
    fi
}

Get-Manifest() 
{
    path="$target_directory/$2"

    eval "$program_path manifest --product $1 --release_version $release_version --license $license --target_directory $path "
}

######################## Main #########################

###################
# Section 1: Data #
###################

# Geo*Data
target_path="Data"
Get-File "CNTY.DAT" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "PLACENAME.DAT" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "ZIP.DAT" "DATA" "ANY" "ANY" "ANY" $target_path

# Headers DBF
target_path="Data/HEADERS/DBF"
Get-File "CNTY.DBF" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "GEODATA.DBF" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "PLACENAME.DBF" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "ZIP.DBF" "DATA" "ANY" "ANY" "ANY" $target_path

# Headers MDB
target_path="Data/HEADERS/MDB"
Get-File "GEODATA.MDB" "DATA" "ANY" "ANY" "ANY" $target_path

# TXT
target_path="Data/TXT"
Get-File "US.idx" "DATA" "ANY" "ANY" "ANY" $target_path

Get-File "US.txt" "DATA" "ANY" "ANY" "ANY" $target_path
