#!/usr/bin/env bash

#rosrun dji_sdk_demo dji_sdk_test_bazier
#python plot2.py
ctrl_c_pressed=0

trap 'onCtrlC' INT
function onCtrlC () {
    echo 'Ctrl+C is captured'
    ctrl_c_pressed=1
}

path_now=$(pwd)
path_data=$(pwd)"/data/"
path_launch=$path_now"/src/iarc_arena_simulator/launch/"
catkin_target1=iarc_arena_simulator_generate_messages
catkin_target2=""

echo $(pwd)

echo "cleaned!"



