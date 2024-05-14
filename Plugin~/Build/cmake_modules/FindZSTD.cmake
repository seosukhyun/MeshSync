# * ZSTD_INCLUDE_DIR
# * ZSTD_LIBRARY


find_path(ZSTD_INCLUDE_DIR
    NAMES "zstd.h"
    PATHS "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/include/"
    NO_DEFAULT_PATH
)

find_path(ZSTD_INCLUDE_DIR_TEST
    NAMES "zstd.h"
    PATHS "/Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/include/"
    NO_DEFAULT_PATH
)

#set (ZSTD_INCLUDE_DIR_TEST sss)
message(STATUS "ZSTD_INCLUDE_DIR_TEST: ${ZSTD_INCLUDE_DIR_TEST}")

mark_as_advanced(ZSTD_INCLUDE_DIR)

# Decide the name of the zstd lib based on platform
# Setup library filename and path suffix based on the platform
if(ANDROID)
    # Typically, libraries are named libzstd.so for Android
    set(zstd_lib_filename "libzstd.so")
    set(zstd_external_path_suffix "External/zstd/lib/android/${ANDROID_ABI}/")
endif()   
   
find_file(
    ZSTD_LIBRARY 
    NAMES
        ${zstd_lib_filename}
    PATHS
        ${CMAKE_SOURCE_DIR}
    PATH_SUFFIXES 
        ${zstd_external_path_suffix}
    NO_DEFAULT_PATH        
)

message(STATUS "ZSTD_INCLUDE_DIR: ${ZSTD_INCLUDE_DIR}")

message(STATUS "Checking for zstd.h in: /Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/include/")
message(STATUS "Checking for ${zstd_lib_filename} in: /Users/sukhyunseo/Development/MeshSync/Plugin~/External/zstd/lib/android/${ANDROID_ABI}/")

message(STATUS "CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message(STATUS "ANDROID_ABI: ${ANDROID_ABI}")
message(STATUS "ZSTD include path: ${CMAKE_SOURCE_DIR}/External/zstd/include")
message(STATUS "ZSTD library path: ${CMAKE_SOURCE_DIR}/External/zstd/lib/android/${ANDROID_ABI}/")

mark_as_advanced(ZSTD_LIBRARY)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args("ZSTD"
    DEFAULT_MSG
    ZSTD_INCLUDE_DIR
	ZSTD_LIBRARY
)
