# CMake generated Testfile for 
# Source directory: /vagrant/scenarios
# Build directory: /vagrant/scenarios
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mtits2017-test "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/scenarios/highway-police/libartery_police.so" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "--sim-time-limit=30s")
set_tests_properties(mtits2017-test PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/mt-its2017")
add_test(car2car-grid-cam_bsp "/opt/omnetpp/bin/opp_run_release" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/scenarios/highway-police/libartery_police.so" "-l" "/vagrant/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/extern/libINET.so" "-l" "/vagrant/extern/libveins.so" "-l" "/vagrant/src/traci/libtraci.so" "-l" "/vagrant/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-ccam_bsp" "--sim-time-limit=30s")
set_tests_properties(car2car-grid-cam_bsp PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/car2car-grid")
subdirs("artery")
subdirs("gemv2")
subdirs("highway-police")
subdirs("my_sumo_sim")
subdirs("rsu_grid")
subdirs("storyboard")
