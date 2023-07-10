# CMake generated Testfile for 
# Source directory: /vagrant/scenarios/artery
# Build directory: /vagrant/scenarios/artery
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example-inet "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet" "--sim-time-limit=20s")
set_tests_properties(example-inet PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-security "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet_security" "--sim-time-limit=20s")
set_tests_properties(example-security PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-inet-mco "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet_mco" "--sim-time-limit=20s")
set_tests_properties(example-inet-mco PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-inet-mixed-vehicles "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet_multiple_vehicle_types" "--sim-time-limit=20s")
set_tests_properties(example-inet-mixed-vehicles PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-inet-nakagami "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet_nakagami" "--sim-time-limit=20s")
set_tests_properties(example-inet-nakagami PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-inet-rsu "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cinet_rsu" "--sim-time-limit=20s")
set_tests_properties(example-inet-rsu PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-veins "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cveins" "--sim-time-limit=20s")
set_tests_properties(example-veins PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-veins-rsu "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cveins_rsu" "--sim-time-limit=20s")
set_tests_properties(example-veins-rsu PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
add_test(example-envmod "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-cenvmod" "--sim-time-limit=20s")
set_tests_properties(example-envmod PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/artery")
