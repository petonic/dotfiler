#!/bin/sh
#
# Script to run cleanup in all sub config-* dirs
#


for i in config*; do
    echo "=== Working in $i"
    cd $i
    sh ../@dots_setup_clean.sh
done
