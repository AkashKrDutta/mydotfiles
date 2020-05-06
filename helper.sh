#! /bin/bash

CURRENT_SEQUENCE=0
GLOBAL_DASHES="-----"
# helper functions
print_header() {
    to_print="--> $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "$DASHES\n$to_print\n$DASHES"
    CURRENT_SEQUENCE=0
}

print_subheader() {
    CURRENT_SEQUENCE=$(($CURRENT_SEQUENCE + 1))
    to_print="$CURRENT_SEQUENCE. $1"
    string_length=${#to_print}
    DASHES=""
    for i in $(seq $string_length)
    do
        DASHES=$DASHES"-" 
    done
    echo -e "\t$to_print\n\t$DASHES"
}

print_tabbed(){
    echo -e "\t$1"
}

print_done(){
    print_tabbed "DONE"
    print_tabbed 
}
