#! /bin/bash

# $1 = Header to print
print_header() {
    to_print="$1"
    HASHES=$(printf "#%.0s" {1..25})
    echo -e "$HASHES\n$to_print\n$HASHES"
}

# $1 = return code
print_completion(){
    echo -e "Installation done successfully\n"
}

# $1 = tarball path
# $2 = output folder
error_checked_unzip () {
    # Use 7z installed earlier! 
    # Decompress and write the archive into output stream
    # Read from input stream and untar the archive
    7za x $1 -so | tar xf - -C $2
}
