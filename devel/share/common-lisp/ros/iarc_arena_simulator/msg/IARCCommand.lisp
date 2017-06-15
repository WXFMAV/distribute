; Auto-generated. Do not edit!


(cl:in-package iarc_arena_simulator-msg)


;//! \htmlinclude IARCCommand.msg.html

(cl:defclass <IARCCommand> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (command_kind
    :reader command_kind
    :initarg :command_kind
    :type cl:integer
    :initform 0)
   (robot_id
    :reader robot_id
    :initarg :robot_id
    :type cl:integer
    :initform 0))
)

(cl:defclass IARCCommand (<IARCCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IARCCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IARCCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name iarc_arena_simulator-msg:<IARCCommand> is deprecated: use iarc_arena_simulator-msg:IARCCommand instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <IARCCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:header-val is deprecated.  Use iarc_arena_simulator-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'command_kind-val :lambda-list '(m))
(cl:defmethod command_kind-val ((m <IARCCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:command_kind-val is deprecated.  Use iarc_arena_simulator-msg:command_kind instead.")
  (command_kind m))

(cl:ensure-generic-function 'robot_id-val :lambda-list '(m))
(cl:defmethod robot_id-val ((m <IARCCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader iarc_arena_simulator-msg:robot_id-val is deprecated.  Use iarc_arena_simulator-msg:robot_id instead.")
  (robot_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IARCCommand>) ostream)
  "Serializes a message object of type '<IARCCommand>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'command_kind)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'robot_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IARCCommand>) istream)
  "Deserializes a message object of type '<IARCCommand>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command_kind) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IARCCommand>)))
  "Returns string type for a message object of type '<IARCCommand>"
  "iarc_arena_simulator/IARCCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IARCCommand)))
  "Returns string type for a message object of type 'IARCCommand"
  "iarc_arena_simulator/IARCCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IARCCommand>)))
  "Returns md5sum for a message object of type '<IARCCommand>"
  "9c609693fd9ce982d29367b2eed37c0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IARCCommand)))
  "Returns md5sum for a message object of type 'IARCCommand"
  "9c609693fd9ce982d29367b2eed37c0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IARCCommand>)))
  "Returns full string definition for message of type '<IARCCommand>"
  (cl:format cl:nil "# obstacles~%Header header~%int32 command_kind~%int32 robot_id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IARCCommand)))
  "Returns full string definition for message of type 'IARCCommand"
  (cl:format cl:nil "# obstacles~%Header header~%int32 command_kind~%int32 robot_id~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IARCCommand>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IARCCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'IARCCommand
    (cl:cons ':header (header msg))
    (cl:cons ':command_kind (command_kind msg))
    (cl:cons ':robot_id (robot_id msg))
))
