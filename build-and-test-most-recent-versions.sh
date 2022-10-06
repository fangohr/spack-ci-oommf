#!/bin/bash
VERSIONS=`spack info oommf | grep -A 4 "Safe versions:" | awk 'NR>1' | awk '{print $1}'`

echo $VERSIONS
for VER in $VERSIONS; do
    date
    echo "Working on $VER ...";
    spack install oommf@$VER

    # run spack smoke tests for oommf. We get an error if any of the fail.
    RUN . $SPACK_ROOT/share/spack/setup-env.sh && spack test run --alias testname$VER oommf@$VER
    # display output from smoke tests (just for information)
    RUN . $SPACK_ROOT/share/spack/setup-env.sh && spack test results -l testname$VER

    # show oommf version at very end of output 
    RUN . $SPACK_ROOT/share/spack/setup-env.sh && spack load oommf@$VER && oommf.tcl +version

    # uninstall OOMMF (avoid conflicts with multiple versions installed)
    RUN . $SPACK_ROOT/share/spack/setup-env.sh && spack unload oommf@$VER && spack uninstall -y oommf@VER

    echo "completed $VER"
    echo "============================================"
    
done
