#!/usr/bin/env bash

k=$1
path_now=$(pwd)
path_data=$(pwd)"/data/"
path_launch=$path_now"/src/iarc_arena_simulator/launch/"

catkin_target1=iarc_arena_simulator_generate_messages
catkin_target2=""

err_str="error: Your local changes to the following files would be overwritten by merge"
str=`git pull origin master 2>&1 | grep "$err_str"`
echo $str
if [ "$str" ]; then
    echo "require overwrite"
    git reset --hard origin/master
    git pull origin master
else
    echo "no need to overwrite"
fi
 
source me
catkin_make $catkin_target1
catkin_make $catkin_target2

if [ ! -d $path_launch$k ]; then
    continue
fi
echo $k           

path_param_k=$path_launch$k
                
path_param_loop_yaml=$path_param_k"/param_loop.yaml"
path_param_yaml=$path_param_k"/param.yaml"
path_readme_md=$path_param_k"/readme.md"

launch_package="iarc_arena_simulator"
launch_file="simulator_bigdata.launch"

loop_param_k=$k
mkdir -p $path_data$loop_param_k

last_id=0
path_file_id=$path_data$loop_param_k"/last.id"

if [ ! -f "$path_file_id" ]; then
    last_id=0
else
    read last_id < $path_file_id
fi
loop_id=`expr $last_id + 1`
echo $loop_id >$path_file_id   
                 
loop_id_str=$(printf "%03d" $loop_id)
loop_namespace=$loop_param_k"/"$loop_id_str

echo "loop_param_k : "\'$loop_param_k\'     >$path_param_loop_yaml
echo "loop_id : "$loop_id                   >>$path_param_loop_yaml
echo "loop_id_str : "\'$loop_id_str\'           >>$path_param_loop_yaml
echo "health_cruise_on : 0" >>$path_param_loop_yaml
echo "health_path_on : 0"   >>$path_param_loop_yaml
echo "health_tracking_on : 0"  >>$path_param_loop_yaml
echo "health_cruise_timeup : 0" >>$path_param_loop_yaml
echo "health_path_timeup : 0" >>$path_param_loop_yaml
echo "health_tracking_timeup : 0" >>$path_param_loop_yaml

path_target_dir=$path_data$loop_param_k"/"$loop_id_str
mkdir -p $path_target_dir

roslaunch $launch_package $launch_file __ns:=$loop_namespace path_param_loop_yaml:=$path_param_loop_yaml path_param_yaml:=$path_param_yaml

rosparam dump $path_target_dir/param_dump.yaml
lscpu >$path_target_dir/cpu_dump.txt
cp $path_param_k/*.* $path_target_dir

