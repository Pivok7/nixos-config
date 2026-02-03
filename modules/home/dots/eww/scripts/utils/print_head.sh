#!/bin/sh

print_head()
{
    LINE=$1
    MAX_LEN=32

    if [ $# -gt 1 ]; then
	MAX_LEN=$2
    fi

    if [ "${#LINE}" -gt "${MAX_LEN}" ]; then
	echo $LINE \
	| tr -d '\n' \
	| head -c ${MAX_LEN} \
	| sed 's/$/...\n/'
    else
	echo "$LINE"
    fi
}

