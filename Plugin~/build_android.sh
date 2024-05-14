#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables for paths and settings
BUILD_DIR="build_android"
CMAKE_TOOLCHAIN_FILE="/Users/sukhyunseo/Library/Android/sdk/ndk/25.1.8937393/build/cmake/android.toolchain.cmake"
ANDROID_ABI="arm64-v8a"
ANDROID_PLATFORM="android-21"
ANDROID_STL="c++_static"

# Create and navigate to the build directory
if [ -d "$BUILD_DIR" ]; then
    echo "Build directory exists, removing it..."
    rm -rf "$BUILD_DIR"
fi

echo "Creating build directory..."
mkdir "$BUILD_DIR"
cd "$BUILD_DIR"

# Run CMake to configure the project
echo "Running CMake configuration..."
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
      -DANDROID_ABI="$ANDROID_ABI" \
      -DANDROID_PLATFORM="$ANDROID_PLATFORM" \
      -DANDROID_STL="$ANDROID_STL" \
      ..

# Build the project
echo "Building the project..."
make -j$(nproc)

echo "Build completed successfully."
