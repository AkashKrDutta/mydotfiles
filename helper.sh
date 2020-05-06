#! /bin/bash

CURRENT_SUBHEADER_SEQUENCE=0
CURRENT_HEADER_SEQUENCE=0
GLOBAL_DASHES="-----"
# helper functions
print_header() {
    to_print="$CURRENT_HEADER_SEQUENCE. $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "$DASHES\n$to_print\n$DASHES"
    CURRENT_SUBHEADER_SEQUENCE=0
}

print_subheader() {
    CURRENT_SUBHEADER_SEQUENCE=$(($CURRENT_SUBHEADER_SEQUENCE + 1))
    to_print="$CURRENT_HEADER_SEQUENCE.$CURRENT_SUBHEADER_SEQUENCE ---> $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "$to_print\n$DASHES"
}

print_done(){
    echo "DONE"
    echo 
}

print_completion(){
    ret=$1
    if [[ $ret != 0 ]]; then
        echo "Installation failed. Check debug.log"
    else
        echo "Installation done successfully"
    fi
}

# $1 = output file
# $2 = Link
# $3 = Log file 
error_checked_curl () {
    curl --silent -o "$1" -L "$2" &>> "$3"
    if [[ $? != 0 ]]; then
        echo "Failed downloading from link - $2"
        echo "Aborting install, check debug.log for details"
        return 1
    fi
    print_done
    return 0
}

# $1 = tarball path
# $2 = output folder
# $3 = Log file 
error_checked_unzip () {
    # Use 7z installed earlier! 
    # Decompress and write into output stream
    # Read from input stream, overwrite existing files and anticipate tar archive 
    7za x $1 -so 2>> "$3" | 7za x -si -aoa -ttar -o"$2" &>> "$3"
    if [[ $? != 0 ]]; then
        echo "Failed extracting tarball - $1"
        echo "Aborting install, check debug.log for details"
        return 1
    fi
    print_done
    return 0
}
