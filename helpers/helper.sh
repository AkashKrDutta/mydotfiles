#! /bin/bash

# $1 = Header to print
print_header() {
    to_print="$1"
    hashes=$(printf "#%.0s" {1..25})
    echo -e "$hashes\n$to_print"
}

# $1 = Subheader to print
print_subheader() {
    to_print="$1"
    echo -e "+ $to_print"
}

# $1 = Footer to print
print_footer(){
    to_print="$1"
    hashes=$(printf "#%.0s" {1..25})
    echo -e "$to_print\n$hashes"
}

# $1 = tarball path
# $2 = output folder
unzip_helper () {
    # Use 7z installed earlier! 
    # Decompress and write the archive into output stream
    # Read from input stream and untar the archive
    7za x $1 -so | tar xf - -C $2 1>&2
}
