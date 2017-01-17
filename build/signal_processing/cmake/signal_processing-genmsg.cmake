# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "signal_processing: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isignal_processing:/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(signal_processing_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg" NAME_WE)
add_custom_target(_signal_processing_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "signal_processing" "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(signal_processing
  "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/signal_processing
)

### Generating Services

### Generating Module File
_generate_module_cpp(signal_processing
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/signal_processing
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(signal_processing_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(signal_processing_generate_messages signal_processing_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg" NAME_WE)
add_dependencies(signal_processing_generate_messages_cpp _signal_processing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(signal_processing_gencpp)
add_dependencies(signal_processing_gencpp signal_processing_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS signal_processing_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(signal_processing
  "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/signal_processing
)

### Generating Services

### Generating Module File
_generate_module_lisp(signal_processing
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/signal_processing
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(signal_processing_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(signal_processing_generate_messages signal_processing_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg" NAME_WE)
add_dependencies(signal_processing_generate_messages_lisp _signal_processing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(signal_processing_genlisp)
add_dependencies(signal_processing_genlisp signal_processing_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS signal_processing_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(signal_processing
  "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/signal_processing
)

### Generating Services

### Generating Module File
_generate_module_py(signal_processing
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/signal_processing
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(signal_processing_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(signal_processing_generate_messages signal_processing_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mateusz/Pulpit/Robotic_Environment/lab10_ros_sigal_processing/catkin_ws/src/signal_processing/msg/Signal.msg" NAME_WE)
add_dependencies(signal_processing_generate_messages_py _signal_processing_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(signal_processing_genpy)
add_dependencies(signal_processing_genpy signal_processing_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS signal_processing_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/signal_processing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/signal_processing
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(signal_processing_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/signal_processing)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/signal_processing
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(signal_processing_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/signal_processing)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/signal_processing\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/signal_processing
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(signal_processing_generate_messages_py std_msgs_generate_messages_py)
