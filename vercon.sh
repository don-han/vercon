#!/bin/bash

usage="usage: vc "

VERCON_DIR=.vercon
VERCON_FILES=vc_files

init(){
    mkdir -p $VERCON_DIR
}

add(){
    if [[ -f "$1" ]]; then
        echo "$1" >> $VERCON_DIR/$VERCON_FILES
    else
        echo "File $1 does not exists"
    fi
}


save(){
    while read file; do 
        if [[ -f "$file" ]]; then
            timestamp=$(date +%Y%m%d%H%M%S)
            cp $file $VERCON_DIR/$file-$timestamp
        fi
    done < $VERCON_DIR/$VERCON_FILES
}

# assume a user has successfully 'vc init'
init

if [[ $# -eq 0 ]]; then
    echo "$usage"
    exit 1
elif [[ $# -eq 1 ]]; then
    case "$1" in 
        init) 
            init
            ;;
        save)
            save
            ;;

        *) 
            echo "$usage"
            exit 1
            ;;
           
    esac
elif [[ $# -eq 2 ]]; then
    case "$1" in 
        add)
            add $2
            ;;
         *)
             echo "$usage"
             exit 1
             ;;
     esac
fi







