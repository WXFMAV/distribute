; Auto-generated. Do not edit!


(cl:in-package iarc_arena_simulator-msg)


;//! \htmlinclude IARCTask.msg.html

(cl:defclass <IARCTask> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (task_type
    :reader task_type
    :initarg :task_type
    :type cl:fixnum
    :initform 0)
   (task_seq
    :reader task_seq
    :initarg :task_seq
    :type cl:integer
    :initform 0)
   (task_value
    :reader task_value
    :initarg :task_value
    :type cl:float
    :initform 0.0)
   (time_start
    :reader time_start
    :initarg :time_start
    :type cl:integer
    :initform 0)
   (time_end
    :reader time_end
    :initarg :time_end
    :type cl:integer
    :initform 0)
   (robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:integer
    :initform 0)
   (robot_cmd
    :reader robot_cmd
    :initarg :robot_cmd
    :type cl:integer
    :initform 0)
   (final_pose
    :reader final_pose
    :initarg :final_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (final_bound
    :reader final_bound
    :initarg :final_bound
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass IARCTask (<IARCTask>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IARCTask>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IARCTask)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iarc_arena_simulator-msg:<IARCTask> is deprecated: use iarc_arena_simulator-msg:IARCTask instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:header-val is deprecated.  Use iarc_arena_simulator-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'task_type-val :lambda-list '(m))
(cl:defmethod task_type-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:task_type-val is deprecated.  Use iarc_arena_simulator-msg:task_type instead.")
  (task_type m))

(cl:ensure-generic-function 'task_seq-val :lambda-list '(m))
(cl:defmethod task_seq-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:task_seq-val is deprecated.  Use iarc_arena_simulator-msg:task_seq instead.")
  (task_seq m))

(cl:ensure-generic-function 'task_value-val :lambda-list '(m))
(cl:defmethod task_value-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:task_value-val is deprecated.  Use iarc_arena_simulator-msg:task_value instead.")
  (task_value m))

(cl:ensure-generic-function 'time_start-val :lambda-list '(m))
(cl:defmethod time_start-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:time_start-val is deprecated.  Use iarc_arena_simulator-msg:time_start instead.")
  (time_start m))

(cl:ensure-generic-function 'time_end-val :lambda-list '(m))
(cl:defmethod time_end-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:time_end-val is deprecated.  Use iarc_arena_simulator-msg:time_end instead.")
  (time_end m))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:robot_id-val is deprecated.  Use iarc_arena_simulator-msg:robot_id instead.")
  (robot_id m))

(cl:ensure-generic-function 'robot_cmd-val :lambda-list '(m))
(cl:defmethod robot_cmd-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:robot_cmd-val is deprecated.  Use iarc_arena_simulator-msg:robot_cmd instead.")
  (robot_cmd m))

(cl:ensure-generic-function 'final_pose-val :lambda-list '(m))
(cl:defmethod final_pose-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:final_pose-val is deprecated.  Use iarc_arena_simulator-msg:final_pose instead.")
  (final_pose m))

(cl:ensure-generic-function 'final_bound-val :lambda-list '(m))
(cl:defmethod final_bound-val ((m <IARCTask>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:final_bound-val is deprecated.  Use iarc_arena_simulator-msg:final_bound instead.")
  (final_bound m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IARCTask>) ostream)
  "Serializes a message object of type '<IARCTask>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'task_seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'task_seq)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'task_seq)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'task_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_start)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_end)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_end)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_end)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_end)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_cmd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_cmd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_cmd)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_cmd)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'final_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'final_bound) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IARCTask>) istream)
  "Deserializes a message object of type '<IARCTask>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'task_seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'task_seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'task_seq)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'task_seq)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'task_value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_start)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'time_end)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'time_end)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'time_end)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'time_end)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'robot_cmd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'robot_cmd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'robot_cmd)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'robot_cmd)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'final_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'final_bound) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IARCTask>)))
  "Returns string type for a message object of type '<IARCTask>"
  "iarc_arena_simulator/IARCTask")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IARCTask)))
  "Returns string type for a message object of type 'IARCTask"
  "iarc_arena_simulator/IARCTask")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IARCTask>)))
  "Returns md5sum for a message object of type '<IARCTask>"
  "05a68d9a9434319b9367e7aa299c52f7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IARCTask)))
  "Returns md5sum for a message object of type 'IARCTask"
  "05a68d9a9434319b9367e7aa299c52f7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IARCTask>)))
  "Returns full string definition for message of type '<IARCTask>"
  (cl:format cl:nil "# task~%Header header~%uint8 task_type~%uint32 task_seq~%float32 task_value~%uint32 time_start~%uint32 time_end~%uint32 robot_id~%uint32 robot_cmd~%geometry_msgs/Pose final_pose~%geometry_msgs/Pose final_bound~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IARCTask)))
  "Returns full string definition for message of type 'IARCTask"
  (cl:format cl:nil "# task~%Header header~%uint8 task_type~%uint32 task_seq~%float32 task_value~%uint32 time_start~%uint32 time_end~%uint32 robot_id~%uint32 robot_cmd~%geometry_msgs/Pose final_pose~%geometry_msgs/Pose final_bound~%~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IARCTask>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'final_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'final_bound))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IARCTask>))
  "Converts a ROS message object to a list"
  (cl:list 'IARCTask
    (cl:cons ':header (header msg))
    (cl:cons ':task_type (task_type msg))
    (cl:cons ':task_seq (task_seq msg))
    (cl:cons ':task_value (task_value msg))
    (cl:cons ':time_start (time_start msg))
    (cl:cons ':time_end (time_end msg))
    (cl:cons ':robot_id (robot_id msg))
    (cl:cons ':robot_cmd (robot_cmd msg))
    (cl:cons ':final_pose (final_pose msg))
    (cl:cons ':final_bound (final_bound msg))
))
