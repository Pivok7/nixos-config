#!/bin/sh

SELF_DIR="$(cd "$(dirname "$0")" && pwd)"

# Load function from other script
. ${SELF_DIR}/../utils/print_head.sh

playerctl --follow metadata --format '{{ title }}' |  while read -r line; do
    print_head "$line" "40"
done
