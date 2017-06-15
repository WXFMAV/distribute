#include "iarc_arena_simulator_node.h"
#include <math.h>
#include <glog/logging.h>

using namespace iarc_arena_simulator;
using namespace std;
static ros::Time time_start;
static uint32_t time_turn[N_TRG],kind_turn[N_TRG];
static IARCQuadStatus quad_status;
static FILE *fp=NULL;
static FILE *fp_cmdrcv=NULL;
static FILE *fp_cmdall=NULL;
static geometry_msgs::Pose obs[N_OBS];
static geometry_msgs::Pose trg[N_TRG];

static bool visited = false;
uint32_t arena_time_now()
{
    if (!visited){
        LOG(ERROR) << "arena start time not set!";
        return 0;
    }
    ros::Time now = ros::Time::now();
    if(now.sec<time_start.sec) return 0;
    uint32_t ans_sec,ans_nsec;
    ans_sec=now.sec-time_start.sec;
    if(now.nsec>time_start.nsec)
    {
          ans_nsec=now.nsec-time_start.nsec;
    }
    else
    {
          ans_nsec=now.nsec+1e9-time_start.nsec;
          ans_sec--;
    }
//    ans_nsec=now.nsec>start.nsec?now.nsec-start.nsec:now.nsec+1e9-start.nsec;
    return uint32_t(((uint64_t)ans_sec)*1000+((uint64_t)ans_nsec)/1000000);
}

void arena_set_startnow()
{
    if (visited){
        LOG(ERROR) << "arena time can only be set once!";
        return ;
    }
    time_start = ros::Time::now();

    ros::Time time_offset;
    //ros::package::getPath("dji_sdk_demo")+"/../../build/test_results"
    uint32_t off_nsec;
    off_nsec = PARAM::time_offset_ms*1000000;
    time_offset.sec =time_start.sec +  (time_start.nsec + off_nsec)/1000000000;
    time_offset.nsec = (time_start.nsec + off_nsec) % 1000000000;

    std::string filename = PARAM::file_name_ast_tracking;
    FILE * fp = fopen(filename.c_str(),"w");
    if(fp == NULL){
    	printf(" error to open file for write:%s\n", filename.c_str());
    	exit(-1);
    }
    fprintf(fp, "%ud %ud\n", time_offset.sec,time_offset.nsec);
    fflush(fp);
    fclose(fp);

    filename = PARAM::file_name_ast_path;
    fp = fopen(filename.c_str(),"w");
    if(fp == NULL){
    	printf(" error to open file for write:%s\n", filename.c_str());
    	exit(-1);
    }
    fprintf(fp, "%ud %ud\n", time_offset.sec,time_offset.nsec);
    fflush(fp);
    fclose(fp);

    filename = PARAM::file_name_ast_cruise;
    fp = fopen(filename.c_str(),"w");
    if(fp == NULL){
    	printf(" error to open file for write:%s\n", filename.c_str());
    	exit(-1);
    }
    fprintf(fp, "%ud %ud\n", time_offset.sec,time_offset.nsec);
    fflush(fp);
    fclose(fp);


    printf("start time seted!\n");
    visited = true;
}

double gaussrand()
{
    static double V1, V2, S;
    static int phase = 0;
    double X;
     
    if ( phase == 0 ) {
        do {
            double U1 = (double)rand() / RAND_MAX;
            double U2 = (double)rand() / RAND_MAX;
             
            V1 = 2 * U1 - 1;
            V2 = 2 * U2 - 1;
            S = V1 * V1 + V2 * V2;
        } while(S >= 1 || S == 0);
         
        X = V1 * sqrt(-2 * log(S) / S);
    } else
        X = V2 * sqrt(-2 * log(S) / S);
         
    phase = 1 - phase;
 
    return X;
}


bool near_mav(uint32_t robot_id)
{
    if(robot_id< N_TRG)
    {
        double dis = 0.0;
        dis = max(fabs((quad_status.x - trg[robot_id].position.x)),
        		max(fabs((quad_status.z - trg[robot_id].position.z)),
        				fabs((quad_status.y - trg[robot_id].position.y))));

        if (dis < 2.0) return true;  //command can be exed within 2 meters
    }
    return false;
}


void IARCCommand_callback(const iarc_arena_simulator::IARCCommand::ConstPtr& msg)
{
	//printf("msg: id:%d kind:%d\n",msg->robot_id,msg->command_kind);
	uint32_t time_now=arena_time_now();
	uint32_t time_add=0;
	if(msg->command_kind==KIND_TURN_180) time_add=TIME_TURN_180;
	else time_add=TIME_TURN_45;

        if(msg->command_kind!=KIND_TURN_NONE){
            if(fp_cmdall!=NULL){
                fprintf(fp_cmdall, "%d %d %d\n",time_now, msg->robot_id, msg->command_kind);
                fflush(fp_cmdall);
            }
        }

        if(msg->command_kind!=KIND_TURN_NONE && near_mav(msg->robot_id)==true)
	{
	    time_turn[msg->robot_id]=time_now % PERIOD_TURN;
	    kind_turn[msg->robot_id]=msg->command_kind;
	    if(fp_cmdrcv!=NULL)
	    {
	       fprintf(fp_cmdrcv,"%d %d %d\n",time_now, msg->robot_id, msg->command_kind);
	       fflush(fp_cmdrcv);
	    }
         }
}

void IARCQuadStatus_callback(const iarc_arena_simulator::IARCQuadStatus::ConstPtr & msg)
{
    quad_status = (*msg);
}

bool OutofBound(geometry_msgs::Pose pos)
{
	if(pos.position.x<-10.0 || pos.position.x>10.0 || pos.position.y<-10.0 || pos.position.y>10.0)
	{
		return true;
	}
	return false;
}
int main(int argc,char **argv)
{
    google::InitGoogleLogging(argv[0]);
    FLAGS_log_dir= ros::package::getPath("dji_sdk_demo")+"/../../build/test_results";
    std::cout<<FLAGS_log_dir<<std::endl;
    LOG(INFO) << "record info to this file";

    ros::init(argc, argv, "iarc_arena_simulator");
    ros::NodeHandle nh;

    if(PARAM::load_params(nh)<0){
       cout<<"load params failed!"<<endl;
       return 0;
    }
    else{
        cout<<"load params successed!"<<endl;
    }

    time_start=ros::Time::now();
    arena_set_startnow();

    LOG(ERROR) <<" arena_time_now "<< arena_time_now();

    ros::Publisher obstacles_pub = 
    	nh.advertise<geometry_msgs::PoseArray>("iarc_arena/IARCObstacles", 10);
    ros::Publisher targets_pub = 
    	nh.advertise<geometry_msgs::PoseArray>("iarc_arena/IARCTargets",10);
    ros::Subscriber cmd_sub = 
    	nh.subscribe<iarc_arena_simulator::IARCCommand>("iarc_arena/IARCCommand",10,IARCCommand_callback);
    ros::Subscriber quad_sub =
        nh.subscribe<iarc_arena_simulator::IARCQuadStatus>("iarc_arena/IARCQuadStatus",10, IARCQuadStatus_callback);

    fp=fopen(PARAM::file_name_arena_info.c_str(),"w");
    if(fp==NULL)
    {
          printf("file arena_info.txt open failed!\n");
          return 0;
    }

    fp_cmdrcv=fopen(PARAM::file_name_arena_cmd_received.c_str(),"w");
    if(fp_cmdrcv==NULL)
    {
          printf("file arena_cmd_receivd.txt open failed!\n");
          return 0;
    }
    fp_cmdall=fopen(PARAM::file_name_arena_cmd_sent.c_str(),"w");
    if(fp_cmdall==NULL)
    {
           printf("file arena_cmd_sent.txt open failed!\n");
           return 0;
    }

    srand((unsigned int)time_start.nsec);    

	float obs_theta[N_OBS],trg_theta[N_TRG];
	float v0=0.33;
    float r0=5.0;

					
   	geometry_msgs::Pose zeropose;
	zeropose.position.x=0.0;
	zeropose.position.y=0.0;
	zeropose.position.z=0.0;
	zeropose.orientation.x=0.0;
	zeropose.orientation.y=0.0;		
	zeropose.orientation.z=0.0;				
	zeropose.orientation.w=1.0;
    
    for(int k=0; k<N_TRG; k++)
    {
          trg_theta[k]=2*PI/(N_TRG)*k;
          trg[k]=zeropose;
          trg[k].position.x=1.0*cos(trg_theta[k]);
          trg[k].position.y=1.0*sin(trg_theta[k]);
          time_turn[k]=PERIOD_TURN-TIME_TURN_180;
          kind_turn[k]=KIND_TURN_180;
    }

//    trg[0].position.x = 0.0;
  //  trg[0].position.y = 2.0;
 //   trg_theta[0] = -PI/4.0;


    for(int k=0; k<N_OBS; k++)
    {
          obs_theta[k]=2.0*M_PI/(double)(N_OBS)*(double)k;
          obs[k]=zeropose;
          obs[k].position.x=r0*cos(obs_theta[k]-M_PI/2.0);
          obs[k].position.y=r0*sin(obs_theta[k]-M_PI/2.0);
    }
            
    ros::Rate r(30);
    float dT=1/30.0;
    int cnt=0;

    while(ros::ok())
    {
        if (arena_time_now()>600000){
           break;
        }
        cnt++;

    	geometry_msgs::PoseArray obstacles;
    	geometry_msgs::PoseArray targets;
    	obstacles.header.frame_id = "/arena_frame";    	    	    	
    	obstacles.header.stamp = ros::Time::now();
    	targets.header.frame_id = "/arena_frame";    	    	    	
    	targets.header.stamp = ros::Time::now();

    	geometry_msgs::Pose ps;
		ps=zeropose;
										
    	for(int k=0; k<N_TRG; k++)
    	{
    		if(!OutofBound(trg[k]))
    		{
				float theta,de,theta_add;
				uint32_t time_now;												
				uint32_t time_add;

				ros::Time now=ros::Time::now();
				time_now=arena_time_now()%PERIOD_TURN;				
				if(kind_turn[k]==KIND_TURN_180)
                        {
				      theta_add=THETA_TURN_180;
				      time_add=TIME_TURN_180;
                        }
				else if(kind_turn[k]==KIND_TURN_45)
                        {
				      theta_add=THETA_TURN_45;
				      time_add=TIME_TURN_45;
                        }
				else
				{
				      theta_add=0.0;
				      time_add=0;
				}

				time_add=time_add/((int)(dT*1000.0))*((int)(dT*1000.0));

				if(time_now>=time_turn[k]+time_add || time_now<(time_turn[k]))			
				{		
					de=0.0;
					v0=0.33;
				}
				else
				{
					de=theta_add/(((double)time_add)/1000.0)*((int)(dT*1000.0)/1000.0);
					v0=0.0;
					/*
					if(fp_cmdrcv!=NULL)
					{
					   //   fprintf(fp_cmdrcv,"time:%d robotid:%d turn time:%d kind:%d\n",time_now,k,time_turn[k],kind_turn[k]);
					}
					*/
				}		
				if(time_now+(int)(dT*1000.0)>=PERIOD_TURN-TIME_TURN_180 && time_now<PERIOD_TURN-TIME_TURN_180)
				{
					time_turn[k]=PERIOD_TURN-TIME_TURN_180;
					kind_turn[k]=KIND_TURN_180;
					//printf("20s 180 beging!\n");
				}
									
				//printf("%d %d %d %d %.6lf %d\n",time_now,k,kind_turn[k],time_turn[k],de,time_add);								
				trg_theta[k]=trg_theta[k]+de;						

				trg_theta[k]=trg_theta[k]+float(rand()%1001-500)/50000.0 * 3.0* PARAM::rand_tgt_average + PARAM::rand_tgt_gauss * gaussrand() * PARAM::rand_tgt_gauss_variance;					//float(rand()%1001-500)/50000.0*3.0
				theta=trg_theta[k];
						
				trg[k].position.x=trg[k].position.x+dT*v0*cos(theta);
				trg[k].position.y=trg[k].position.y+dT*v0*sin(theta);			
										
				trg[k].orientation.x=0.0;
				trg[k].orientation.y=0.0;
				trg[k].orientation.z=cos((-theta+PI)/2);
				trg[k].orientation.w=sin((-theta+PI)/2);
			}
			else
			{
			}
			
			targets.poses.push_back(trg[k]);
    	}
    	
    	for(int k=0; k<N_OBS; k++)
    	{    		    	    	
    		float v0 = 0.33;
			if(!OutofBound(obs[k]))
			{
				float theta;
				obs_theta[k]=obs_theta[k]+float(rand()%1001-500)/500000.0 * 5.0 * PARAM::rand_obs_average + PARAM::rand_obs_gauss * gaussrand() * PARAM::rand_obs_gauss_variance;
				obs_theta[k]=obs_theta[k]+dT*v0/r0;
				theta=obs_theta[k];

				obs[k].position.x += v0*cos(theta) *dT;
				obs[k].position.y +=v0*sin(theta) *dT;

				//obs[k].position.x=obs[k].position.x; //r0*cos(theta);
				//obs[k].position.y=obs[k].position.y; //r0*sin(theta);
				obs[k].orientation.x=0.0;
				obs[k].orientation.y=0.0;
				obs[k].orientation.z=cos((-theta+M_PI)/2);
				obs[k].orientation.w=sin((-theta+M_PI)/2);
			}
			else
			{
				
			}
			obstacles.poses.push_back(obs[k]);
    	}
    	
    	obstacles_pub.publish(obstacles);
    	targets_pub.publish(targets);

#ifdef quit_when_collision
    	bool collision = false;
    	for(int k = 0; k< obstacles.poses.size(); k++)
    	{
    		if((obstacles.poses[k].position.x - quad_status.x)*(obstacles.poses[k].position.x - quad_status.x)+(obstacles.poses[k].position.y - quad_status.y)*(obstacles.poses[k].position.y - quad_status.y) < 1.0){
    			collision = true;
    			break;
    		}
    	}
    	if (collision) break;
#endif

    	if(fp!=NULL)
    	{
    	      uint32_t time_now=arena_time_now();
    	      fprintf(fp,"%d %u ",cnt,time_now);
              fprintf(fp,"%u %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf ",quad_status.tms, quad_status.x, quad_status.y, quad_status.z,
                          quad_status.vx, quad_status.vy, quad_status.vz,  quad_status.ax, quad_status.ay, quad_status.az); 
    	      for(int k=0; k<N_TRG; k++)
    	      {
    	            fprintf(fp,"%d %.2lf %.2lf %.2lf %.2lf ",k,trg[k].position.x,trg[k].position.y,trg[k].orientation.z,trg[k].orientation.w);
    	      }
    	      for(int k=0; k<N_OBS; k++)
              {
                    fprintf(fp,"%d %.2lf %.2lf %.2lf %.2lf ",k,obs[k].position.x,obs[k].position.y,obs[k].orientation.z,obs[k].orientation.w);
              }
    	      fprintf(fp,"\n");
    	}
    	r.sleep();    	    	
    	ros::spinOnce();
    }

    if(fp!=NULL) fclose(fp),fp=NULL;
    if(fp_cmdrcv!=NULL) fclose(fp_cmdrcv),fp_cmdrcv=NULL;
   
    FILE* fp_health = fopen(PARAM::file_name_health.c_str(),"w");
    if(fp_health == NULL){
        cout<<" open health filed failed!"<<endl;
    }

    int health_cruise_on = 0;
    int health_path_on = 0;
    int health_tracking_on = 0;
    int health_cruise_timeup = 0;
    int health_path_timeup = 0;
    int health_tracking_timeup = 0;

    nh.getParam("health_cruise_on",health_cruise_on);
    nh.getParam("health_path_on",health_path_on);
    nh.getParam("health_tracking_on",health_tracking_on);
    nh.getParam("health_cruise_timeup", health_cruise_timeup);
    nh.getParam("health_path_timeup", health_path_timeup);
    nh.getParam("health_tracking_timeup", health_tracking_timeup);

    fprintf(fp_health, "%d\n%d\n%d\n%d\n%d\n%d\n", health_cruise_on, health_cruise_timeup, health_path_on, health_path_timeup, health_tracking_on, health_tracking_timeup);

    fflush(fp_health);        
    fclose(fp_health);
    return 0;
}
