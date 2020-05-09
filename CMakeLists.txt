cmake_minimum_required(VERSION 3.4)
project(coding_test)

if (POLICY CMP0015)
    cmake_policy(SET CMP0015 NEW)
endif ()

enable_testing()

find_package(Boost COMPONENTS REQUIRED date_time filesystem iostreams program_options system)
find_package(GTest REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})
include_directories("${PROJECT_SOURCE_DIR}/")

SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --std=c++2a -g --concepts")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wall -Wextra -Wno-deprecated")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-unused-parameter")

message(STATUS "===============================================================")
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif ()

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")
string(TOUPPER "${CMAKE_BUILD_TYPE}" build_type)

set(OPTIMIZATION_OVERRIDE_Release="-Os")
set(OPTIMIZATION_OVERRIDE="OPTIMIZATION_OVERRIDE_${CMAKE_BUILD_TYPE}")

message(STATUS "CMAKE_CXX_FLAGS:         ${CMAKE_CXX_FLAGS}")
message(STATUS "CMAKE_CXX_FLAGS_${build_type}:  ${CMAKE_CXX_FLAGS_${build_type}}")

set(COMMON_LIBS rt dl stdc++fs)
add_subdirectory(${PROJECT_SOURCE_DIR}/tests)

