#!/bin/bash

# check the last 4 versions 
VERSIONS=`spack info oommf | grep -A 4 "Safe versions:" | awk 'NR>1' | awk '{print $1}'`

echo $VERSIONS
for VER in $VERSIONS; do
    date
    echo "Working on $VER ...";
    spack install oommf@$VER

    echo "completed installation $VER"
    echo "============================================"
    
done
spack test run --alias testname oommf
spack test results -l testname | tee spack-test-results-output.txt
spack find -v -l oommf | tee spack-find-oommf-output.txt

