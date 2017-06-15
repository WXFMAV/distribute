// Generated by gencpp from file dji_sdk/LocalPositionNavigationActionGoal.msg
// DO NOT EDIT!


#ifndef DJI_SDK_MESSAGE_LOCALPOSITIONNAVIGATIONACTIONGOAL_H
#define DJI_SDK_MESSAGE_LOCALPOSITIONNAVIGATIONACTIONGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <actionlib_msgs/GoalID.h>
#include <dji_sdk/LocalPositionNavigationGoal.h>

namespace dji_sdk
{
template <class ContainerAllocator>
struct LocalPositionNavigationActionGoal_
{
  typedef LocalPositionNavigationActionGoal_<ContainerAllocator> Type;

  LocalPositionNavigationActionGoal_()
    : header()
    , goal_id()
    , goal()  {
    }
  LocalPositionNavigationActionGoal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , goal_id(_alloc)
    , goal(_alloc)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef  ::dji_sdk::LocalPositionNavigationGoal_<ContainerAllocator>  _goal_type;
  _goal_type goal;




  typedef boost::shared_ptr< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct LocalPositionNavigationActionGoal_

typedef ::dji_sdk::LocalPositionNavigationActionGoal_<std::allocator<void> > LocalPositionNavigationActionGoal;

typedef boost::shared_ptr< ::dji_sdk::LocalPositionNavigationActionGoal > LocalPositionNavigationActionGoalPtr;
typedef boost::shared_ptr< ::dji_sdk::LocalPositionNavigationActionGoal const> LocalPositionNavigationActionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace dji_sdk

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'nav_msgs': ['/opt/ros/indigo/share/nav_msgs/cmake/../msg'], 'dji_sdk': ['/home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk/msg', '/home/exbot/workspace/hehualin_ws/distribute/devel/share/dji_sdk/msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1df2157854b6b9ab6bda6d7452f970cd";
  }

  static const char* value(const ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1df2157854b6b9abULL;
  static const uint64_t static_value2 = 0x6bda6d7452f970cdULL;
};

template<class ContainerAllocator>
struct DataType< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dji_sdk/LocalPositionNavigationActionGoal";
  }

  static const char* value(const ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalID goal_id\n\
LocalPositionNavigationGoal goal\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalID\n\
# The stamp should store the time at which this goal was requested.\n\
# It is used by an action server when it tries to preempt all\n\
# goals that were requested before a certain time\n\
time stamp\n\
\n\
# The id provides a way to associate feedback and\n\
# result message with specific goal requests. The id\n\
# specified must be unique.\n\
string id\n\
\n\
\n\
================================================================================\n\
MSG: dji_sdk/LocalPositionNavigationGoal\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#x,y,z are in meters\n\
float32 x\n\
float32 y\n\
float32 z\n\
";
  }

  static const char* value(const ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.goal_id);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct LocalPositionNavigationActionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dji_sdk::LocalPositionNavigationActionGoal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::dji_sdk::LocalPositionNavigationGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DJI_SDK_MESSAGE_LOCALPOSITIONNAVIGATIONACTIONGOAL_H