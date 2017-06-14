#ifndef __LOGGING_H__
#define __LOGGING_H__

#include<iostream>
#include<string>

/*
 google::InitGoogleLogging(argv[0]);
    FLAGS_log_dir=ros::package::getPath("dji_sdk_demo")+"/../../build/test_results";
    std::cout<<FLAGS_log_dir<<std::endl;
    LOG(INFO) << "record info to this file";
*/
#define LOG(a)  std::cout
static std::string FLAGS_log_dir;
namespace google{
int InitGoogleLogging(char *argv);

};
#endif
