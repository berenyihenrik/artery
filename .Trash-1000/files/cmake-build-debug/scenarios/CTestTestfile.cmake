# CMake generated Testfile for 
# Source directory: /vagrant/scenarios
# Build directory: /vagrant/cmake-build-debug/scenarios
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mtits2017-test "/opt/omnetpp/bin/opp_run_dbg" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/cmake-build-debug/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/cmake-build-debug/scenarios/highway-police/libartery_police.so" "-l" "/vagrant/cmake-build-debug/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/cmake-build-debug/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/cmake-build-debug/extern/libINET.so" "-l" "/vagrant/cmake-build-debug/extern/libveins.so" "-l" "/vagrant/cmake-build-debug/src/traci/libtraci.so" "-l" "/vagrant/cmake-build-debug/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "--sim-time-limit=30s")
set_tests_properties(mtits2017-test PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/mt-its2017" _BACKTRACE_TRIPLES "/vagrant/cmake/AddOppRun.cmake;170;add_test;/vagrant/scenarios/CMakeLists.txt;24;add_opp_test;/vagrant/scenarios/CMakeLists.txt;0;")
add_test(car2car-grid-cam_bsp "/opt/omnetpp/bin/opp_run_dbg" "-n" "/vagrant/src/artery:/vagrant/src/traci:/vagrant/extern/veins/examples/veins:/vagrant/extern/veins/src/veins:/vagrant/extern/inet/src:/vagrant/extern/inet/examples:/vagrant/extern/inet/tutorials:/vagrant/extern/inet/showcases" "-l" "/vagrant/cmake-build-debug/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/cmake-build-debug/scenarios/highway-police/libartery_police.so" "-l" "/vagrant/cmake-build-debug/src/artery/envmod/libartery_envmod.so" "-l" "/vagrant/cmake-build-debug/src/artery/storyboard/libartery_storyboard.so" "-l" "/vagrant/cmake-build-debug/extern/libINET.so" "-l" "/vagrant/cmake-build-debug/extern/libveins.so" "-l" "/vagrant/cmake-build-debug/src/traci/libtraci.so" "-l" "/vagrant/cmake-build-debug/src/artery/libartery_core.so" "omnetpp.ini" "-uCmdenv" "-ccam_bsp" "--sim-time-limit=30s")
set_tests_properties(car2car-grid-cam_bsp PROPERTIES  WORKING_DIRECTORY "/vagrant/scenarios/car2car-grid" _BACKTRACE_TRIPLES "/vagrant/cmake/AddOppRun.cmake;170;add_test;/vagrant/scenarios/CMakeLists.txt;40;add_opp_test;/vagrant/scenarios/CMakeLists.txt;0;")
subdirs("artery")
subdirs("gemv2")
subdirs("highway-police")
subdirs("my_sumo_sim")
subdirs("rsu_grid")
subdirs("storyboard")
