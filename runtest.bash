#!/usr/bin/env bash

path_now=$(pwd)
path_data=$(pwd)"/data/"
        source me
        catkin_make iarc_arena_simulator_generate_messages
        catkin_make

        if [ "$ctrl_c_pressed" = "1" ]; then
            echo "exit"
            exit 1
        fi
        
        path_param_k=$path_launch
                
        path_param_loop_yaml=$path_param_k"/param_loop.yaml"
        path_param_yaml=$path_param_k"/param.yaml"
        path_readme_md=$path_param_k"/readme.md"

        launch_package="iarc_arena_simulator"
        launch_file="simulator_bigdata.launch"

        loop_param_k="test"
        mkdir -p $path_data$loop_param_k

        loop_id=1
                 
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

        roslaunch $launch_package $launch_file path_param_loop_yaml:=$path_param_loop_yaml path_param_yaml:=$path_param_yaml

        rosparam dump $path_target_dir/param_dump.yaml
        lscpu >$path_target_dir/cpu_dump.txt
        cp $path_param_k/*.* $path_target_dir        

