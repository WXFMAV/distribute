#include<ros/ros.h>
#include <ros/package.h>
#include<time.h>
#include<math.h>
#include<iostream>

int main(int argc,char **argv)
{
   ros::init(argc, argv, "script_node");
   ros::NodeHandle nh;
   std::string str= "bash "+ ros::package::getPath("iarc_arena_simulator") + "/scripts/clean.bash";
   system(str.c_str());
   return 0;
}


