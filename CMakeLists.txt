cmake_minimum_required(VERSION 3.5)
project(socketcan_demo)

set(CMAKE_CXX_STANDARD 11)

set(SRC_UTIL_FILES ${PROJECT_SOURCE_DIR}/src/util.c)
set(HDR_UTIL_FILES ${PROJECT_SOURCE_DIR}/src/)

set(SRC_CAN_RAW_DEMO ${PROJECT_SOURCE_DIR}/src/socketcan-raw-demo.cpp)
set(SRC_CAN_BCM_DEMO ${PROJECT_SOURCE_DIR}/src/socketcan-bcm-demo.cpp)
set(SRC_CAN_CYC_DEMO ${PROJECT_SOURCE_DIR}/src/socketcan-cyclic-demo.cpp)

include_directories(${HDR_UTIL_FILES})

add_executable(socketcan_raw_demo ${SRC_CAN_RAW_DEMO} ${SRC_UTIL_FILES})
add_executable(socketcan_bcm_demo ${SRC_CAN_BCM_DEMO} ${SRC_UTIL_FILES})
add_executable(socketcan_cyclic_demo ${SRC_CAN_CYC_DEMO} ${SRC_UTIL_FILES})
