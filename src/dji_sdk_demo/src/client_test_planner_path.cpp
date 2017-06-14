#include <ros/ros.h>
#include <stdio.h>
#include <cstdlib>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>
#include <nav_msgs/Path.h>
#include <geometry_msgs/PoseArray.h>
#include <iarc_arena_simulator/IARCWaypoint.h>
#include <iarc_arena_simulator/IARCWaypointsList.h>
#include <iarc_arena_simulator/IARCQuadStatus.h>
#include <iarc_arena_simulator/IARCTask.h>
#include<iarc_arena_simulator/IARCTasksList.h>
#include <ros/package.h>
#include <glog/logging.h>
#include "PlannerPath.h"
#include "common.h"

static PlannerPath thePath;
static ros::Publisher waypoints_list_pub;
static ros::Subscriber quad_sub;
static ros::Subscriber obstacles_sub;
static ros::Subscriber targets_sub;
static ros::Subscriber tasks_list_sub;


void QuadStatus_callback(const iarc_arena_simulator::IARCQuadStatus::ConstPtr & status);
void IARCObstacles_callback(const geometry_msgs::PoseArray::ConstPtr& obstacles);
void IARCTargets_callback(const geometry_msgs::PoseArray::ConstPtr& targets);
void IARCTasksList_callback(const iarc_arena_simulator::IARCTasksList::ConstPtr & tasklist);
int main(int argc, char **argv)
{  
    ros::init(argc, argv, "path_plan");
    ros::NodeHandle nh;

    if(PARAM::load_params(nh)<0){
       std::cout<<"load params failed!"<<std::endl;
       return 0;
    }
    else{
        std::cout<<"load params successed!"<<std::endl;
    }

    arena_set_startnow();

    google::InitGoogleLogging(argv[0]);
    FLAGS_log_dir=ros::package::getPath("dji_sdk_demo")+"/../../build/test_results";
    std::cout<<FLAGS_log_dir<<std::endl;
    LOG(INFO) << "record info to this file";

 //   tasks_list_sub = nh.subscribe<iarc_arena_simulator::IARCTasksList>("/iarc_arena/IARCTasksList",10,IARCTasksList_callback);
    //quad_sub = nh.subscribe<iarc_arena_simulator::IARCQuadStatus>("/iarc_arena/IARCQuadStatus",10, QuadStatus_callback);
 //   obstacles_sub = nh.subscribe<geometry_msgs::PoseArray>("/iarc_arena/IARCObstacles",10,IARCObstacles_callback);
//    targets_sub = nh.subscribe<geometry_msgs::PoseArray>("/iarc_arena/IARCTargets",10,IARCTargets_callback);
    waypoints_list_pub = nh.advertise<iarc_arena_simulator::IARCWaypointsList>("/iarc_arena/IARCWaypointsList",10);

    thePath.init();

    ros::Rate r0(PARAM::ros_rate_path);
    int cnt=0;

    iarc_arena_simulator::IARCWaypointsList wp_list;

    //thePath.test_main();
    thePath.test_main_plan_dijkstra(wp_list);

    while(ros::ok() && 0)
    {
            cnt++;
            //thePath.plan(wp_list);
            thePath.test_main_plan_dijkstra(wp_list);
            if(wp_list.list.size()>0){
                waypoints_list_pub.publish(wp_list);
            }
            LOG(INFO) <<"loop cnt=" <<cnt;

            ros::spinOnce();
            r0.sleep();
            break;
    }

	LOG(INFO) << "quit!";
	printf("Quit Path!\n");


    return 0;
}

void IARCTasksList_callback(const iarc_arena_simulator::IARCTasksList::ConstPtr & tasklist)
{
    if(tasklist->list.size()!=0){
        thePath.update_taskslist(tasklist);
    }
}
void QuadStatus_callback(const iarc_arena_simulator::IARCQuadStatus::ConstPtr & status)
{
    thePath.update_quad(status);
}
void IARCObstacles_callback(const geometry_msgs::PoseArray::ConstPtr& obstacles)
{
      if(obstacles->poses.size()>0){
          thePath.update_obs(obstacles);
      }
}
void IARCTargets_callback(const geometry_msgs::PoseArray::ConstPtr& targets)
{
      if(targets->poses.size()>0){
          thePath.update_tgt(targets);
      }
}
