#!/bin/bash
OPP_RUNALL=/opt/omnetpp/bin/opp_runall
OPP_RUN=/opt/omnetpp/bin/opp_run_release
NED_FOLDERS="/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases"
LIBRARIES="-l/vagrant/src/artery/libartery_core.so -l/vagrant/src/traci/libtraci.so -l/vagrant/extern/libveins.so -l/vagrant/extern/libINET.so -l/vagrant/src/artery/storyboard/libartery_storyboard.so -l/vagrant/src/artery/envmod/libartery_envmod.so"

RUNALL=false
for arg do
    shift
    [[ "$arg" == -j* ]] && RUNALL=true && J=$arg && continue
    [[ "$arg" == -b* ]] && RUNALL=true && B=$arg && continue
    # run opp_runall with default values for -j* and -b* options by just specifying '--all'
    [[ "$arg" == "--all" ]] && RUNALL=true && continue
    set -- "$@" "$arg"
done

if [ "$RUNALL" = true ] ; then
    $OPP_RUNALL $J $B $OPP_RUN -n $NED_FOLDERS $LIBRARIES $@
else
    $OPP_RUN -n $NED_FOLDERS $LIBRARIES $@
fi
