#!/bin/bash

usage="usage: vc"

VERCON_DIR=.vc
VERCON_FILES=vc_files
VERCON_LOG=vc_log

if [[ ! -d $VERCON_DIR ]]; then
    if [[ ! "$1" = "init" ]]; then
        echo "fatal: Not a vc repository"
        exit 1
    fi
fi


init(){
    mkdir -p $VERCON_DIR
}

add(){
    file_name="$1"
    # If a file is already added to the list, do not add
    if [[ -f $VERCON_DIR/$VERCON_FILES ]] && grep -Fxq "$file_name" $VERCON_DIR/$VERCON_FILES; then
        return
    fi
    
    if [[ -f "$file_name" ]]; then
        echo "$file_name" >> $VERCON_DIR/$VERCON_FILES
    else
        echo "File $file_name does not exists"
    fi
}


save(){
    # TODO: store diff, not entire file

    message=$1
    while read file; do 
        if [[ -f "$file" ]]; then
            file_id=$(date +%Y%m%d%H%M%S)
            cp $file $VERCON_DIR/$file-$file_id
            echo "[ $file-$file_id ] $message" >> $VERCON_DIR/$VERCON_LOG
        fi
    done < $VERCON_DIR/$VERCON_FILES

    rm $VERCON_DIR/$VERCON_FILES
}

log(){
    cat $VERCON_DIR/$VERCON_LOG
}

revert(){
    file_id=$1
}

# assume a user has successfully 'vc init'

if [[ $# -eq 0 ]]; then
    echo "$usage"
    exit 1
elif [[ $# -eq 1 ]]; then
    case "$1" in 
        init) 
            init
            ;;
        log)
            log
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
        save)
            save "$2"
            ;;
        revert)
            revert $2
            ;;
         *)
             echo "$usage"
             exit 1
             ;;
     esac
fi
