# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "iarc_arena_simulator: 8 messages, 0 services")

set(MSG_I_FLAGS "-Iiarc_arena_simulator:/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Inav_msgs:/opt/ros/indigo/share/nav_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(iarc_arena_simulator_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg" "geometry_msgs/Point:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg" "iarc_arena_simulator/IARCWaypoint:std_msgs/Header"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg" "geometry_msgs/Point:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg" NAME_WE)
add_custom_target(_iarc_arena_simulator_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "iarc_arena_simulator" "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg" "geometry_msgs/Point:iarc_arena_simulator/IARCTask:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg"
  "${MSG_I_FLAGS}"
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_cpp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
)

### Generating Services

### Generating Module File
_generate_module_cpp(iarc_arena_simulator
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(iarc_arena_simulator_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(iarc_arena_simulator_generate_messages iarc_arena_simulator_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_cpp _iarc_arena_simulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iarc_arena_simulator_gencpp)
add_dependencies(iarc_arena_simulator_gencpp iarc_arena_simulator_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iarc_arena_simulator_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg"
  "${MSG_I_FLAGS}"
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_lisp(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
)

### Generating Services

### Generating Module File
_generate_module_lisp(iarc_arena_simulator
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(iarc_arena_simulator_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(iarc_arena_simulator_generate_messages iarc_arena_simulator_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_lisp _iarc_arena_simulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iarc_arena_simulator_genlisp)
add_dependencies(iarc_arena_simulator_genlisp iarc_arena_simulator_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iarc_arena_simulator_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg"
  "${MSG_I_FLAGS}"
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)
_generate_msg_py(iarc_arena_simulator
  "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
)

### Generating Services

### Generating Module File
_generate_module_py(iarc_arena_simulator
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(iarc_arena_simulator_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(iarc_arena_simulator_generate_messages iarc_arena_simulator_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTargets.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCQuadStatus.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypointsList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCWaypoint.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCCommand.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCObstacles.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTask.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/exbot/workspace/hehualin_ws/distribute/src/iarc_arena_simulator/msg/IARCTasksList.msg" NAME_WE)
add_dependencies(iarc_arena_simulator_generate_messages_py _iarc_arena_simulator_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(iarc_arena_simulator_genpy)
add_dependencies(iarc_arena_simulator_genpy iarc_arena_simulator_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS iarc_arena_simulator_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/iarc_arena_simulator
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(iarc_arena_simulator_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(iarc_arena_simulator_generate_messages_cpp nav_msgs_generate_messages_cpp)
add_dependencies(iarc_arena_simulator_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/iarc_arena_simulator
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(iarc_arena_simulator_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(iarc_arena_simulator_generate_messages_lisp nav_msgs_generate_messages_lisp)
add_dependencies(iarc_arena_simulator_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/iarc_arena_simulator
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(iarc_arena_simulator_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(iarc_arena_simulator_generate_messages_py nav_msgs_generate_messages_py)
add_dependencies(iarc_arena_simulator_generate_messages_py geometry_msgs_generate_messages_py)
