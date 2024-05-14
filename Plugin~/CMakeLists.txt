cmake_minimum_required(VERSION 3.18)

# Project name
project(MeshSyncPlugin)

# Set CMake module path and source root directory
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/Build/cmake_modules)
set(src_root ${CMAKE_CURRENT_SOURCE_DIR}/Src)

# Allow CMake to organize files by folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Include directories and library directories for ZSTD
set(ZSTD_INCLUDE_DIR "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/include")
set(ZSTD_LIBRARY_DIR "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/lib/android/arm64-v8a")
set(ZSTD_LIBRARY "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/lib/android/arm64-v8a/libzstd.so")

include_directories(${ZSTD_INCLUDE_DIR})
link_directories(${ZSTD_LIBRARY_DIR})

# Include directories and library directories for Poco
set(POCO_INCLUDE_DIR "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/poco/include")
set(POCO_LIBRARY_DIR "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/poco/lib/android/arm64-v8a")

include_directories(${POCO_INCLUDE_DIR})
link_directories(${POCO_LIBRARY_DIR})

# Disable ISPC (if necessary, you can add a condition here to control ISPC)
message("ISPC Off")

# List of Poco libraries to link against
list(APPEND Poco_LIBRARIES 
    "libPocoActiveRecord.so"
    "libPocoData.so"
    "libPocoEncodings.so"
    "libPocoFoundation.so"
    "libPocoJSON.so"
    "libPocoMongoDB.so"
    "libPocoNet.so"
    "libPocoPrometheus.so"
    "libPocoRedis.so"
    "libPocoUtil.so"
    "libPocoXML.so"
    "libPocoZip.so"
)

# Custom scripts
include(AddPlugin)

# Set C++ standard and compiler flags
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Force Unicode character set
add_definitions(-DUNICODE -D_UNICODE)

# Use Poco static lib (if needed, otherwise this can be removed)
add_definitions(-DPOCO_STATIC)

# Options
option(BUILD_TESTS "Build tests" OFF)

# Specify available modules
add_subdirectory(${src_root}/MeshUtils)
add_subdirectory(${src_root}/MeshSync)
add_subdirectory(${src_root}/mscore)

# Tests
if(BUILD_TESTS)
    add_subdirectory(${src_root}/MeshSyncTest)
endif()
