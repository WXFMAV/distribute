
(cl:in-package :asdf)

(defsystem "iarc_arena_simulator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "IARCQuadStatus" :depends-on ("_package_IARCQuadStatus"))
    (:file "_package_IARCQuadStatus" :depends-on ("_package"))
    (:file "IARCWaypoint" :depends-on ("_package_IARCWaypoint"))
    (:file "_package_IARCWaypoint" :depends-on ("_package"))
    (:file "IARCTask" :depends-on ("_package_IARCTask"))
    (:file "_package_IARCTask" :depends-on ("_package"))
    (:file "IARCCommand" :depends-on ("_package_IARCCommand"))
    (:file "_package_IARCCommand" :depends-on ("_package"))
    (:file "IARCWaypointsList" :depends-on ("_package_IARCWaypointsList"))
    (:file "_package_IARCWaypointsList" :depends-on ("_package"))
    (:file "IARCCommands" :depends-on ("_package_IARCCommands"))
    (:file "_package_IARCCommands" :depends-on ("_package"))
    (:file "IARCObstacles" :depends-on ("_package_IARCObstacles"))
    (:file "_package_IARCObstacles" :depends-on ("_package"))
    (:file "IARCTargets" :depends-on ("_package_IARCTargets"))
    (:file "_package_IARCTargets" :depends-on ("_package"))
    (:file "IARCTasksList" :depends-on ("_package_IARCTasksList"))
    (:file "_package_IARCTasksList" :depends-on ("_package"))
  ))