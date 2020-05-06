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
