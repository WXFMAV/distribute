#params
#first try of distribute computation

angle_field_rad : rad(100.0/180.0*pi)

try

rec_arena_cmd_received.txt:
   time_ms, robot_id, robot_cmd
# fprintf(fp_cmdrcv,"%d %d %d\n",time_now, msg->robot_id, msg->command_kind);

rec_arena_info.txt:
   cnt,time_ms_arena, time_ms_quad, x,y,z,vx,vy,vz,ax,ay,az,(target)x,y,qz,qw,x,y,qz,qw,...,(obs)x,y,qz,qw)
# uint32_t time_now=arena_time_now();
# fprintf(fp,"%d %u ",cnt,time_now);
# fprintf(fp,"%u %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf %.2lf ",quad_status.tms, quad_status.x, quad_status.y, quad_status.z,
# quad_status.vx, quad_status.vy, quad_status.vz,  quad_status.ax, quad_status.ay, quad_status.az); 
# for(int k=0; k<N_TRG; k++)
# {
#    fprintf(fp,"%d %.2lf %.2lf %.2lf %.2lf ",k,trg[k].position.x,trg[k].position.y,trg[k].orientation.z,trg[k].orientation.w);
#  }
# for(int k=0; k<N_OBS; k++)
# {
#    fprintf(fp,"%d %.2lf %.2lf %.2lf %.2lf ",k,obs[k].position.x,obs[k].position.y,obs[k].orientation.z,obs[k].orientation.w);
# }
# fprintf(fp,"\n");

rec_task_env.txt
#  fprintf(_fp_task_env, "%d %u %d %d ", _plan_seq,  time_now, _tgt_status.size(), _obs_status.size());
#	fprintf(_fp_task_env, " %d %d %u\n",  taskslist.size(), taskslist.size() >0 ? taskslist[0].task_seq : 0,  arena_time_now());

rec_path_env.txt
#fprintf(_fp_path_env, "%u %.2lf %.2lf %.2lf %u ",arena_time_now(), dst_x, dst_y, dst_z, (unsigned int)(dst_time * 1000.0));
#fprintf(_fp_path_env, "%d %d %u\n", wplist.list.size(), wplist.list.size() >0 ? wplist.list[0].seq : 0, time_now_ms);

rec_tracking.txt
# fprintf(_fp_tracking, "%d %d %d %d %.2lf  %.2lf  %.2lf %.2lf  %.2lf  %.2lf %.2lf  %.2lf  %.2lf \
#  %.2lf  %.2lf %.2lf %.2lf  %.2lf %.2lf  %.2lf %.2lf %.2lf \
#  %.2lf %.2lf  %.2lf %.2lf  %d  %d\n",
#                time_now, wp.seq,  _pos_now,  _wp_list[_pos_now % list_capacity].tms,
#                _state_x[0], _state_x[1], _state_x[2],
#                _state_x[3], _state_x[4], _state_x[5],
#                _state_x[6], _state_x[7], _state_x[8],
#                wp_now[0], wp_now[1], wp_now[2],
#                wp_now[3], wp_now[4], wp_now[5],
#                wp_now[6], wp_now[7], wp_now[8],
#                _control_u[0], _control_u[1], _control_u[2], cmd.mav_vyawdegree,
#				cmd.robot_turn_id, cmd.robot_turn_kind);

rec_controller.txt
#    if( _fp_controller != NULL){
#        fprintf(_fp_controller,"%d %d %d %.2lf %.2lf %d %.2lf %.2lf %.2lf %.2lf %d  %d\n",
#    		time_now, task.task_seq, _pos_now, wp.x, wp.y, wp.tms,
#                _state_x[0], _state_x[1], _control_u[0], _control_u[1], cmd.robot_turn_id, cmd.robot_turn_kind);
#    }
