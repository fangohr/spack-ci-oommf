#!/bin/bash

# exit script on error
set -e

# check the last 4 versions 
VERSIONS=`spack info oommf | grep -A 4 "Safe versions:" | awk 'NR>1' | awk '{print $1}'`

echo $VERSIONS
for VER in $VERSIONS; do
    date
    spack install does-not-exist
    echo "Installing $VER ...";
    spack install oommf@$VER
    
    echo "completed installation $VER"
    echo "============================================"
    
done

# run smoke tests for all versions of oommf
spack test run --alias testname oommf

# display results
spack test results -l testname | tee spack-test-results-output.txt

# summarise what versions have been installed
spack find -v -l oommf | tee spack-find-oommf-output.txt

