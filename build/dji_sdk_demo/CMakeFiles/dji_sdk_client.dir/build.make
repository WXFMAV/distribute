# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/exbot/workspace/hehualin_ws/distribute/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/exbot/workspace/hehualin_ws/distribute/build

# Include any dependencies generated for this target.
include dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/depend.make

# Include the progress variables for this target.
include dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/progress.make

# Include the compile flags for this target's objects.
include dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/flags.make

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/flags.make
dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o: /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/client.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/exbot/workspace/hehualin_ws/distribute/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dji_sdk_client.dir/src/client.cpp.o -c /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/client.cpp

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dji_sdk_client.dir/src/client.cpp.i"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/client.cpp > CMakeFiles/dji_sdk_client.dir/src/client.cpp.i

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dji_sdk_client.dir/src/client.cpp.s"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/client.cpp -o CMakeFiles/dji_sdk_client.dir/src/client.cpp.s

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.requires:
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.requires

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.provides: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.requires
	$(MAKE) -f dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/build.make dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.provides.build
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.provides

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.provides.build: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/flags.make
dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o: /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/iarc.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/exbot/workspace/hehualin_ws/distribute/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o -c /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/iarc.cpp

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.i"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/iarc.cpp > CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.i

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.s"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo/src/iarc.cpp -o CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.s

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.requires:
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.requires

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.provides: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.requires
	$(MAKE) -f dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/build.make dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.provides.build
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.provides

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.provides.build: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o

# Object files for target dji_sdk_client
dji_sdk_client_OBJECTS = \
"CMakeFiles/dji_sdk_client.dir/src/client.cpp.o" \
"CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o"

# External object files for target dji_sdk_client
dji_sdk_client_EXTERNAL_OBJECTS =

/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/build.make
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libroslib.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libactionlib.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libroscpp.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_signals.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_filesystem.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/librosconsole.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/liblog4cxx.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_regex.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /home/exbot/workspace/hehualin_ws/distribute/devel/lib/libdji_sdk_lib.a
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/librostime.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_date_time.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /opt/ros/indigo/lib/libcpp_common.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_system.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libboost_thread.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libpthread.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: /usr/lib/i386-linux-gnu/libconsole_bridge.so
/home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client"
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dji_sdk_client.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/build: /home/exbot/workspace/hehualin_ws/distribute/devel/lib/dji_sdk_demo/dji_sdk_client
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/build

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/requires: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/client.cpp.o.requires
dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/requires: dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/src/iarc.cpp.o.requires
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/requires

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/clean:
	cd /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo && $(CMAKE_COMMAND) -P CMakeFiles/dji_sdk_client.dir/cmake_clean.cmake
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/clean

dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/depend:
	cd /home/exbot/workspace/hehualin_ws/distribute/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/exbot/workspace/hehualin_ws/distribute/src /home/exbot/workspace/hehualin_ws/distribute/src/dji_sdk_demo /home/exbot/workspace/hehualin_ws/distribute/build /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo /home/exbot/workspace/hehualin_ws/distribute/build/dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dji_sdk_demo/CMakeFiles/dji_sdk_client.dir/depend
