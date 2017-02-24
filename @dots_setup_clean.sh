#! /bin/bash

mkdir ./@dots_setup_olddir 2>/dev/null

find . -type f -print | egrep -v '^\.\/\.git\/.*
^\@dots_.*/
.*-theme' | \
while read line; do
    echo "- $line"
    mv -v -f "$HOME/$line" ./@dots_setup_olddir 2>/dev/null
done
