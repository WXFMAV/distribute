/*
 * PlannerVirtual.cpp
 *
 *  Created on: 2017年5月23日
 *      Author: Hualin He
 */

#include "PlannerVirtual.h"
#include <glog/logging.h>
#include<math.h>

using namespace std;
using namespace Eigen;
using namespace iarc_arena_simulator;

#define taskslist_capacity PARAM::taskslist_capacity
#define task_period_ms  PARAM::task_period_ms

PlannerVirtual::PlannerVirtual() {
	// TODO Auto-generated constructor stub
	_tgt_status.clear();
	_obs_status.clear();
	memset(&_quad_status, 0 ,sizeof(_quad_status));
    _tgts_saved.clear();

     _map_memory.clear();
     _map_size_x = 1.0;
     _map_size_y = 1.0;

     _latest_cmdtime = 0;
     _latest_cmd.command_kind = robotcmd_kind::turn_none;
     _latest_cmd.robot_id = robot_id::robot_arena;
     _latest_cmd_continue_time = 0;

     _tasks_pos_now = 1;
     _tasks_pos_end = 0;
     _tasks_list.clear();
}

PlannerVirtual::~PlannerVirtual() {
	// TODO Auto-generated destructor stub
}

int PlannerVirtual::init(){
	     _map_size_x = (int)(PARAM::arena_size / PARAM::map_memory_step_x)+1;
	     _map_size_y = (int)(PARAM::arena_size / PARAM::map_memory_step_y)+1;
	     for(int i = 0; i < _map_size_x; i++){
	     	std::vector<double> tmp;
	     	tmp.clear();
	     	for(int j = 0 ; j < _map_size_y; j++){
	     		tmp.push_back(0.0);
	     	}
	     	_map_memory.push_back(tmp);
	     }

	     _latest_cmdtime = 0;
	     _latest_cmd.command_kind = robotcmd_kind::turn_none;
	     _latest_cmd.robot_id = robot_id::robot_arena;
	     _latest_cmd_continue_time = 0;

	     _tasks_pos_now = 1;
	     _tasks_pos_end = 0;
	     _tasks_list.resize(taskslist_capacity);

	return 0;
}
int PlannerVirtual::update_tgt(const geometry_msgs::PoseArray::ConstPtr& targets)
{
    uint32_t time_now = arena_time_now();
    int sz = targets->poses.size();

 //  LOG(INFO) <<"robot amount"<< sz;
    set_saved_robot(_tgt_status);

    _tgt_status.clear();
    for (int k = 0; k < sz; k++){
        IARCRobot r;
        r.time_ms = time_now;
        r.x = targets->poses[k].position.x;
        r.y = targets->poses[k].position.y;
        r.theta = quaternion_to_theta_z(targets->poses[k].orientation.w,targets->poses[k].orientation.z);
        r.velocity = PARAM::velocity_tgt;
        r.id = (enum robot_id) k;
        if( PARAM::target_mask[k] && in_arena(r) && in_sight(r)){ //kande jian r
        	r.visible = true;
        	r.belief_rate = 1.0;
            _tgt_status.push_back(r);
        }
        else if(PARAM::target_mask[k] && !in_sight(r)){
        	//不在视野内的目标依靠预测，进行飞行，如果在视野内，则直接更新。
        	//target not in sight, then estimate the position.
        	IARCRobot r_last = get_saved_robot_by_id(k);
        	if (r_last.id == k && r_last.belief_rate >0.1){

        		if ( r_last.visible){
        			r_last.visible = false;
        			r_last.lost_time_ms = r_last.time_ms;
        			r_last.lost_x = r_last.x;
        			r_last.lost_y = r_last.y;
        			r_last.lost_theta = r_last.theta;
        			r_last.lost_velocity = r_last.velocity;
        		}
        		IARCRobot originr;
        		originr.x = r_last.lost_x;
        		originr.y = r_last.lost_y;
        		originr.theta = r_last.lost_theta;
        		originr.time_ms = r_last.lost_time_ms;
        		originr.velocity = r_last.velocity;
        		originr.visible = false;
        		originr.id = r_last.id;

        		IARCRobot tmpr = make_prediction_robot(time_now, originr, 0.0);

        		r_last.x = tmpr.x;
        		r_last.y = tmpr.y;
        		r_last.theta = tmpr.theta;
        		r_last.time_ms = time_now;
        		r_last.belief_rate =   forget_function(r_last.time_ms - r_last.lost_time_ms);
        		r_last.visible = false;
        		if(r_last.belief_rate > 0.0 && in_arena(r_last) && !in_sight(r_last)){
        			_tgt_status.push_back(r_last);
        		}
        	}
        }
    }
    return 0;
}
int PlannerVirtual::update_obs(const geometry_msgs::PoseArray::ConstPtr& obstacles)
{
	uint32_t time_now = arena_time_now();
	    int sz = obstacles->poses.size();
	    _obs_status.clear();
	    for (int k = 0; k < sz; k++){
	        IARCRobot r;
	        r.time_ms = time_now;
	        r.x = obstacles->poses[k].position.x;
	        r.y = obstacles->poses[k].position.y;
	        r.theta = quaternion_to_theta_z(obstacles->poses[k].orientation.w,obstacles->poses[k].orientation.z);
	        r.velocity = PARAM::velocity_obs;
	        //if(PARAM::obstacle_mask[k] && in_sight(r)){
	        if(PARAM::obstacle_mask[k] && in_arena(r) &&  in_sight_obs(r)){
	        	r.visible = true;
	        	r.belief_rate = 1.0;
	        	_obs_status.push_back(r);
	        }
	    }

	return 0;
}

int PlannerVirtual::update_quad(const iarc_arena_simulator::IARCQuadStatus::ConstPtr &quad_status)
{
	_quad_status.time_ms = quad_status->tms;
    _quad_status.x = quad_status->x;
    _quad_status.y = quad_status->y;
    _quad_status.z = quad_status->z;
    _quad_status.vx = quad_status->vx;
    _quad_status.vy = quad_status->vy;
    _quad_status.vz = quad_status->vz;
    _quad_status.ax = quad_status->ax;
    _quad_status.ay = quad_status->ay;
    _quad_status.az = quad_status->az;
    _quad_status.qw = quad_status->q0;
    _quad_status.qx = quad_status->q1;
    _quad_status.qy = quad_status->q2;
    _quad_status.qz = quad_status->q3;

    return 0;
}

int PlannerVirtual::update_map_memory()
{
	double x0, y0, z0;
	x0 = (double) _quad_status.x;
	y0 = (double) _quad_status.y;
	z0 = (double) _quad_status.z;

	if(!in_arena_xy(x0, y0)) return 0;

	double view_radius;
	int view_radius_x_i;
	int view_radius_y_i;
	int x_i, y_i;
	int x0_i, y0_i;

	view_radius = fabs(z0) * tan ( PARAM::angle_field_rad / 2.0);
	view_radius_x_i = (int)( view_radius / PARAM::map_memory_step_x) + 1;
	view_radius_y_i = (int)( view_radius / PARAM::map_memory_step_y) + 1;
	arena2map(x0, y0, x0_i, y0_i);

	double tn = ((double)( arena_time_now()))/1000.0;
	for( x_i = x0_i - view_radius_x_i; x_i < x0_i + view_radius_x_i ; x_i++){
		for(y_i = y0_i - view_radius_y_i; y_i < y0_i + view_radius_y_i; y_i++){
			if ( x_i >= 0 && x_i < _map_size_x  && y_i >= 0 && y_i < _map_size_y){
				_map_memory[x_i][y_i] = tn;
			}
		}
	}

	return 0;
}

int PlannerVirtual::update_latest_cmdtime(const iarc_arena_simulator::IARCCommand::ConstPtr& cmd)
{
    if(cmd->command_kind != robotcmd_kind::turn_none){
        _latest_cmdtime = arena_time_now();
        _latest_cmd = *cmd;
        _latest_cmd_continue_time = ((cmd->command_kind==turn_180) ?
                PARAM::time_turn_180_ms: PARAM::time_turn_45_ms);
        LOG(INFO) << "latest cmd="<<_latest_cmd.command_kind<< " time = "<<_latest_cmdtime <<" continue= "<<_latest_cmd_continue_time;
    }
    return 0;
}

int PlannerVirtual::update_taskslist(const iarc_arena_simulator::IARCTasksList::ConstPtr &taskslist)
{

    int m = ((iarc_arena_simulator::IARCTasksList)(*taskslist)).list.size();
 #define taskslist ((iarc_arena_simulator::IARCTasksList)(*taskslist)).list

     uint32_t time_now = arena_time_now();
     uint32_t add_k = 0;

     for (int k = 0; k<m; k++){
         if (taskslist[k].time_end > time_now){
             _tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity] = taskslist[k];

             if ( _tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start < time_now){
            	 _tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start = time_now;
             }

             _tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start =
                     (_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start >time_now?
                             _tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start :time_now);
             LOG (INFO) <<"pos = "<<_tasks_pos_now + add_k<< " task seq=" <<taskslist[k].task_seq<< "start time="
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_start  << " end time="
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].time_end <<" task type="
                     <<(uint32_t)_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].task_type <<" task value="
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].task_value<<"robot id ="
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].robot_id<< "robot cmd="
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].robot_cmd<<"pos =("
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].final_pose.position.x<< ","
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].final_pose.position.y<<","
                     <<_tasks_list[(_tasks_pos_now+add_k)% taskslist_capacity].final_pose.position.z<<")";
             add_k++;
         }
     }
     if (add_k != 0)
     {
         //a new path list is generated.
         _tasks_pos_end = _tasks_pos_now + add_k-1;
     }
     if ( _tasks_pos_end - _tasks_pos_now > taskslist_capacity){
         LOG(ERROR) << "list capacity too small , or tasks list too large to be stored!";
         _tasks_pos_now = _tasks_pos_end - taskslist_capacity;
     }
     LOG(INFO) << "tasks list received! size=" <<m <<" _pos_now = "<< _tasks_pos_now <<" _pos_end = "<<_tasks_pos_end;
 #undef taskslist

    return 0;
}
iarc_arena_simulator::IARCTask PlannerVirtual::get_task_now()
{

    uint32_t time_now = arena_time_now();

    if (_tasks_pos_now <=  _tasks_pos_end && time_now > _tasks_list[_tasks_pos_now % taskslist_capacity].time_end){   //move to next waypoint
               _tasks_pos_now++;
       }

       if(_tasks_pos_now > _tasks_pos_end){ //generate current state as target waypoint.
           LOG(WARNING) << "tasks list is empty!";

           // make_task_type_reach(std::string frame_id, ros::Time stamp, double aimx,
           //double aimy, double aimz, uint32_t start_time_ms, uint32_t aim_time_ms);
           std::string frame_id = PARAM::str_arena_frame;
           ros::Time stamp = ros::Time::now();

           _tasks_list[_tasks_pos_now % taskslist_capacity] = make_task_type_reach(frame_id, stamp,
                   _quad_status.x, _quad_status.y, _quad_status.z, time_now, time_now + task_period_ms);

           _tasks_pos_end = _tasks_pos_now;
           _tasks_list[_tasks_pos_now % taskslist_capacity].task_seq = -1;
       }

       iarc_arena_simulator::IARCTask task_now = _tasks_list[_tasks_pos_now % taskslist_capacity];

       LOG(INFO) <<"task accept! pos_now= " <<_tasks_pos_now <<" pos_end = "<< _tasks_pos_end
               <<"task seq="<<task_now.task_seq<< "start time="<<task_now.time_start
               << " end time="<<task_now.time_end
               <<" task type=" <<::str_task_type[(uint32_t)task_now.task_type]
               <<" task value="<<task_now.task_value
               <<"robot id ="<<task_now.robot_id
               <<"pos =("<<task_now.final_pose.position.x
               << "," <<task_now.final_pose.position.y
               <<","  <<task_now.final_pose.position.z<<")";

       return task_now;
}

bool PlannerVirtual::in_sight_xy(double x, double y, double x0, double y0, double h0, double angle_rad)
{
	double radius = sqrt((x - x0)*(x - x0)+(y - y0)*(y - y0));
	return radius < fabs(h0) * tan(angle_rad / 2.0);
}

bool PlannerVirtual::in_sight(const IARCRobot &r)
{
	return in_sight_xy(r.x, r.y, (double)_quad_status.x, (double) _quad_status.y, (double)_quad_status.z, PARAM::angle_field_rad);
}

bool PlannerVirtual::in_sight_obs(const IARCRobot &r)
{
	double x = r.x;
	double y = r.y;
	double x0 = _quad_status.x;
	double y0 = _quad_status.y;
	double radius = sqrt((x - x0)*(x - x0)+(y - y0)*(y - y0));

	return  radius < PARAM::radius_lidar;
}

bool PlannerVirtual::in_arena_xy(double x, double y)
{
	return fabs(x)<=PARAM::arena_size/2.0 && fabs(y)<=PARAM::arena_size/2.0;
}
bool PlannerVirtual::in_arena(const IARCRobot & r)
{
    return in_arena_xy(r.x, r.y);
}
bool PlannerVirtual::in_esacaped(const IARCRobot &r)
{
    return !(in_arena(r) || in_sheephold(r));
}
bool PlannerVirtual::in_sheephold(const IARCRobot &r)
{
    return r.y< - PARAM::arena_size/2.0 &&
            r.x>-PARAM::arena_size/2.0 && r.x < PARAM::arena_size/2.0;
}

bool PlannerVirtual::will_in_sheephold(const IARCRobot & robot)
{
    double x0,y0;
    double x1,y1;
    double x2,y2;
    x0=robot.x; y0=robot.y;
    IARCRobot r=robot;
    uint32_t rtime=(r.time_ms/PARAM::period_turn_ms+1)*PARAM::period_turn_ms;
    r = make_prediction_robot(rtime, r , 0.0);
    x1=r.x; y1=r.y;
    rtime=(r.time_ms/PARAM::period_turn_ms + 1) * PARAM::period_turn_ms;
    r = make_prediction_robot(rtime,r,0.0);
    x2=r.x; y2=r.y;

    if(y1<-10.0 && fabs(y1-y0)>0.1 && (x0+(x1-x0)/(y1-y0)*(-10.0-y0))>-10.0 && (x0+(x1-x0)/(y1-y0)*(-10.0-y0))<10.0)
    {
          //double x=x0+(x1-x0)/(y1-y0)*(-10.0-y0);
          //第一点与绿边有交点．．直接返回值
          return true;
    }
    if(y2<-10.0 && x1>-10.0 && x1<10.0 && y1>-10.0 && y1<10.0
                && fabs(y2-y1)>0.1 && (x1+(x2-x1)/(y2-y1)*(-10.0-y1))>-10.0 && (x1+(x2-x1)/(y2-y1)*(-10.0-y1))<10.0 )
    {
          //第一点在赛场内，且第二点与绿边有交点．．直接返回值
          return true;
    }
    return false;
}

int PlannerVirtual::get_array_obstacles(geometry_msgs::PoseArray &obstacles)
{
	obstacles.poses.clear();
	obstacles.header.frame_id = PARAM::str_arena_frame;
	obstacles.header.stamp = ros::Time::now();

	geometry_msgs::Pose ps;
	for(int k = _obs_status.size() -1; k >= 0; k--){
		ps.position.x = _obs_status[k].x;
		ps.position.y = _obs_status[k].y;
		ps.position.z = 0.0;
		theta2quaternion(_obs_status[k].theta, ps.orientation.w, ps.orientation.x, ps.orientation.y, ps.orientation.z);
		obstacles.poses.push_back(ps);
	}

	return 0;
}
int PlannerVirtual::get_array_targets(geometry_msgs::PoseArray &targets)
{
	targets.poses.clear();
	targets.header.frame_id = PARAM::str_arena_frame;
	targets.header.stamp = ros::Time::now();

	geometry_msgs::Pose ps;
	for(int k = _tgt_status.size() -1; k >= 0; k--){
		ps.position.x = _tgt_status[k].x;
		ps.position.y = _tgt_status[k].y;
		ps.position.z = 0.0;
		theta2quaternion(_tgt_status[k].theta, ps.orientation.w, ps.orientation.x, ps.orientation.y, ps.orientation.z);
		targets.poses.push_back(ps);
	}

	return 0;
}


int PlannerVirtual::set_saved_robot(const std::vector<IARCRobot> &tgt)
{
	_tgts_saved.clear();
	for(int k = 0; k< tgt.size(); k++){
		_tgts_saved[tgt[k].id] = tgt[k];
	}
	return 0;
}

IARCRobot PlannerVirtual::get_saved_robot_by_id(uint32_t robot_id)
{
	map<int, IARCRobot>::iterator it = _tgts_saved.find(robot_id);
	if( it == _tgts_saved.end()){
		IARCRobot r;
		r.id = robot_none;
		r.x = 0;
		r.y = 0;
		r.visible = false;
		r.belief_rate = 0.0;
		r.velocity = 0.0;
		r.theta = 0.0;
		r.time_ms = 0;
		return r;
	}
	else{
		return it->second;
	}
}

IARCRobot PlannerVirtual::get_robot_by_id(uint32_t robot_id)
{
	return get_robot_from_id(_tgt_status, robot_id);
}

int PlannerVirtual::arena2map(double x, double y, int &x_i, int &y_i)
{
	if(!in_arena_xy(x, y)){
		//x_i = -1;
		//y_i = -1;
		LOG(ERROR) << " visit points out of arena! x, y = " <<x<<" "<<y ;
		if (fabs(x)> PARAM::arena_size / 2.0){
			x = x/fabs(x) * PARAM::arena_size / 2.0;
		}
		if(fabs(y) > PARAM::arena_size / 2.){
			y = y/ fabs(y) * PARAM::arena_size / 2.0;
		}
		//return 0;
	}
	x_i =(int)((x - PARAM::map_memory_org_x )/ PARAM::map_memory_step_x);
	y_i = (int)((y - PARAM::map_memory_org_y)/PARAM::map_memory_step_y);

	return 0;
}

int PlannerVirtual::get_x_of_edge_id(int id)
{
	return (id/_map_size_y) % (_map_size_x);
}
int PlannerVirtual::get_y_of_edge_id(int id)
{
	return id % (_map_size_y);
}
int PlannerVirtual::get_k_of_edge_id(int id)
{
	return id / _map_size_y /_map_size_x;
}

int PlannerVirtual::get_nodes_edge_id(int ki, int xi, int yi)
{
	return ki * (_map_size_x * _map_size_y) + xi * (_map_size_y) + yi;
}

int PlannerVirtual::get_edge_second_grid_by_id(int id, int &xi, int &yi)
{
	if( id < 0 || id> _map_size_x * _map_size_y * PARAM::edge_num_direction){
			LOG(ERROR)<<" edge id illegal!";
	}
	int ki = 0;
	yi = id % _map_size_y;
	id = id / _map_size_y;
	xi = id % _map_size_x;
	id = id / _map_size_x;
	ki = id;
	xi = xi + PARAM::edge_offx[ki];
	yi = yi + PARAM::edge_offy[ki];
	return 0;
}

int PlannerVirtual::get_edge_first_grid_by_id(int id, int &xi, int &yi)
{
	if( id < 0 || id>= _map_size_x * _map_size_y * PARAM::edge_num_direction){
		LOG(ERROR)<<" edge id illegal!";
	}
	int ki = 0;
	yi = id % _map_size_y;
	id = id / _map_size_y;
	xi = id % _map_size_x;
	return 0;
}
bool PlannerVirtual::in_grid_map(int xi, int yi)
{
	if( xi >= 0 && xi< _map_size_x && yi>= 0 && yi< _map_size_y)  return true;
	return false;
}

int PlannerVirtual::segment_in_circle(IARC_POSITION *p1, IARC_POSITION *p2, IARC_POSITION O, double r) {//点p1和p2都不在圆内

	if( (p1->x - O.x)*(p1->x - O.x)+(p1->y - O.y)*(p1->y - O.y) < r * r) return 1;
	if( (p2->x - O.x)*(p2->x - O.x)+(p2->y - O.y)*(p2->y - O.y) < r * r) return 1;

    double a, b, c, dist1, dist2, angle1, angle2; // ax + by + c = 0;
    if (p1->x == p2->x)
        a = 1, b = 0, c = -p1->x;//特殊情况判断，分母不能为零
    else if (p1->y == p2->y)
        a = 0, b = 1, c = -p1->y;//特殊情况判断，分母不能为零
    else {
        a = p1->y - p2->y;
        b = p2->x - p1->x;
        c = p1->x * p2->y - p1->y * p2->x;
    }
    dist1 = a * O.x + b * O.y + c;
    dist1 *= dist1;
    dist2 = (a * a + b * b) * r * r;
    if (dist1 > dist2) return 0;//点到直线距离大于半径r
    angle1 = (O.x - p1->x) * (p2->x - p1->x) + (O.y - p1->y) * (p2->y - p1->y);
    angle2 = (O.x - p2->x) * (p1->x - p2->x) + (O.y - p2->y) * (p1->y - p2->y);
    if (angle1 > 0 && angle2 > 0) return 1;//余弦都为正，则是锐角
    return 0;
}

bool PlannerVirtual::grid_in_safe_area(int xi, int yi)
{
	if(!in_grid_map(xi, yi)) return false;
	double x, y;
	map2arena(xi, yi, x, y);

	for(int k = _obs_status.size() -1; k >= 0; k--){
		if ( _obs_status[k].belief_rate > 0.1){
			if(norm( x - _obs_status[k].x, y - _obs_status[k].y) < PARAM::radius_safe) return false;
		}
	}
	return true;
}

bool PlannerVirtual::segment_in_safe_area(double x1, double y1, double x2, double y2)
{
	for(int k = _obs_status.size() - 1; k >= 0; k--){
		if( _obs_status[k].belief_rate > 0.1){
			IARC_POSITION O, P1, P2;
			O.x = _obs_status[k].x;
			O.y = _obs_status[k].y;
			P1.x = x1;
			P1.y = y1;
			P2.x = x2;
			P2.y = y2;
			//cout<<"int obstacle: "<<k<<" "<<O.x<<" "<<O.y<<" "<<P1.x<<" "<<P1.y<<" "<<P2.x<<" "<<P2.y<<endl;
			if(segment_in_circle(&P1, &P2, O, PARAM::radius_safe)){
				return false;
			}
		}
	}
	return true;
}

bool PlannerVirtual::edge_in_safe_area(int xi1, int yi1, int xi2, int yi2)
{
	if(!in_grid_map(xi1, yi1) || !in_grid_map(xi2, yi2)) return false;

	double x1, y1, x2, y2;
	map2arena(xi1, yi1, x1, y1);
	map2arena(xi2, yi2, x2, y2);
	//judge if the segment cover the obstacle area.....
	for(int k = _obs_status.size() - 1; k >= 0; k--){
		if( _obs_status[k].belief_rate > 0.1){
			IARC_POSITION O, P1, P2;
			O.x = _obs_status[k].x;
			O.y = _obs_status[k].y;
			P1.x = x1;
			P1.y = y1;
			P2.x = x2;
			P2.y = y2;
			if(segment_in_circle(&P1, &P2, O, PARAM::radius_safe)){
				return false;
			}
		}
	}

	return true;
}
int PlannerVirtual::map2arena(int x_i, int y_i, double &x, double &y)
{
	if ( !in_grid_map(x_i, y_i)) {
		x = -1.0;
		y = -1.0;
		LOG(ERROR) << "not in grid map";
		return 0;
	}

	x = ((double)x_i) * PARAM::map_memory_step_x + PARAM::map_memory_org_x;
	y = ((double)y_i) * PARAM::map_memory_step_y + PARAM::map_memory_org_y;

	return 0;
}

double PlannerVirtual::robot_dis(const IARCRobot &r1, const IARCRobot &r2)
{
    return sqrt((r1.x - r2.x) * (r1.x - r2.x)+(r1.y - r2.y)*(r1.y - r2.y));
}

uint32_t PlannerVirtual::get_time_sendcmd(const iarc_arena_simulator::IARCTask &task)
{
	uint32_t time_action;
	if( task.robot_cmd == turn_180){
	      time_action = task.time_end - PARAM::time_turn_180_ms;
    }
	else if( task.robot_cmd == turn_45){
	      time_action = task.time_end - PARAM::time_turn_45_ms;
	}
	else{
	 	  //LOG(ERROR) << "task type error ! unexpected error!";
	 	  time_action = task.time_end;
	}
	return time_action;
}

bool PlannerVirtual::found_tgt()
{
	for(int k = 0; k < _tgt_status.size(); k++){
		if( _tgt_status[k].visible == true){
			return true;
		}
	}
	return false;
}
double PlannerVirtual::norm(double x, double y)
{
	return sqrt(x * x + y * y);
}

bool PlannerVirtual::is_quad_still_now()
{
	if(sqrt(_quad_status.vx * _quad_status.vx + _quad_status.vy* _quad_status.vz) > PARAM::edge_velocity_static){
		return false;
	}
	return true;
}
int PlannerVirtual::make_history_point(double &lx, double &ly)
{
	if( is_quad_still_now()){
		lx = _quad_status.x;
		ly = _quad_status.y;
	}
	else{
		double theta = get_current_moving_direction();
		//make for one meter..
		lx = _quad_status.x - PARAM::cruise_velocity * cos(theta) * PARAM::edge_time_one_edge;
		ly = _quad_status.y - PARAM::cruise_velocity * sin(theta) * PARAM::edge_time_one_edge;
	}
	return 0;
}

double PlannerVirtual::get_current_moving_direction()
{
	return atan2(_quad_status.vy, _quad_status.vx);
}
bool PlannerVirtual::is_turning_now()
{
	uint32_t timenow = arena_time_now();
	if ( timenow > _latest_cmdtime - PARAM::time_turn_distinguish_ms  &&  timenow< _latest_cmdtime +_latest_cmd_continue_time + PARAM::time_turn_distinguish_ms) return true;
	if( (timenow) % PARAM::period_turn_ms > PARAM::period_turn_ms - PARAM::time_turn_180_ms - PARAM::time_turn_distinguish_ms
			|| (timenow ) % PARAM::period_turn_ms < PARAM::time_turn_distinguish_ms) return true;
	return false;
}
