; Auto-generated. Do not edit!


(cl:in-package iarc_arena_simulator-msg)


;//! \htmlinclude IARCWaypointsList.msg.html

(cl:defclass <IARCWaypointsList> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (seq
    :reader seq
    :initarg :seq
    :type cl:integer
    :initform 0)
   (list
    :reader list
    :initarg :list
    :type (cl:vector iarc_arena_simulator-msg:IARCWaypoint)
   :initform (cl:make-array 0 :element-type 'iarc_arena_simulator-msg:IARCWaypoint :initial-element (cl:make-instance 'iarc_arena_simulator-msg:IARCWaypoint))))
)

(cl:defclass IARCWaypointsList (<IARCWaypointsList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IARCWaypointsList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IARCWaypointsList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iarc_arena_simulator-msg:<IARCWaypointsList> is deprecated: use iarc_arena_simulator-msg:IARCWaypointsList instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IARCWaypointsList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:header-val is deprecated.  Use iarc_arena_simulator-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'seq-val :lambda-list '(m))
(cl:defmethod seq-val ((m <IARCWaypointsList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:seq-val is deprecated.  Use iarc_arena_simulator-msg:seq instead.")
  (seq m))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <IARCWaypointsList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:list-val is deprecated.  Use iarc_arena_simulator-msg:list instead.")
  (list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IARCWaypointsList>) ostream)
  "Serializes a message object of type '<IARCWaypointsList>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IARCWaypointsList>) istream)
  "Deserializes a message object of type '<IARCWaypointsList>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'seq)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'iarc_arena_simulator-msg:IARCWaypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IARCWaypointsList>)))
  "Returns string type for a message object of type '<IARCWaypointsList>"
  "iarc_arena_simulator/IARCWaypointsList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IARCWaypointsList)))
  "Returns string type for a message object of type 'IARCWaypointsList"
  "iarc_arena_simulator/IARCWaypointsList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IARCWaypointsList>)))
  "Returns md5sum for a message object of type '<IARCWaypointsList>"
  "8d3da800b642bca88f56e03fa772af9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IARCWaypointsList)))
  "Returns md5sum for a message object of type 'IARCWaypointsList"
  "8d3da800b642bca88f56e03fa772af9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IARCWaypointsList>)))
  "Returns full string definition for message of type '<IARCWaypointsList>"
  (cl:format cl:nil "# waypoint~%Header header~%uint32 seq~%IARCWaypoint[] list~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: iarc_arena_simulator/IARCWaypoint~%# waypoint~%Header header~%uint32 seq~%uint32 tms~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%uint32 robot_id~%uint32 robot_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IARCWaypointsList)))
  "Returns full string definition for message of type 'IARCWaypointsList"
  (cl:format cl:nil "# waypoint~%Header header~%uint32 seq~%IARCWaypoint[] list~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: iarc_arena_simulator/IARCWaypoint~%# waypoint~%Header header~%uint32 seq~%uint32 tms~%float32 x~%float32 y~%float32 z~%float32 vx~%float32 vy~%float32 vz~%float32 ax~%float32 ay~%float32 az~%uint32 robot_id~%uint32 robot_cmd~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IARCWaypointsList>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IARCWaypointsList>))
  "Converts a ROS message object to a list"
  (cl:list 'IARCWaypointsList
    (cl:cons ':header (header msg))
    (cl:cons ':seq (seq msg))
    (cl:cons ':list (list msg))
))
