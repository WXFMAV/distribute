 #!/usr/bin/env python

import os  
import rospy
import rospkg
 
# get an instance of RosPack with the default search paths
rospack = rospkg.RosPack()
 
# get the file path for rospy_tutorials
path_clean = 'bash ' + rospack.get_path('iarc_arena_simulator') + '/scripts/clean.bash'

status = os.system(path_clean)

