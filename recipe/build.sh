#!/usr/bin/env bash

# Not only does this hopefully make pcre2 faster,
# it fixes a test failure on macOS. See link below.
#
# ref: https://bugs.exim.org/show_bug.cgi?id=1642
#
CFLAGS="${CFLAGS} -O3"
CXXFLAGS="${CXXFLAGS} -O3"

mkdir build_cmake
pushd build_cmake
cmake \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DPCRE2_SUPPORT_JIT=ON \
    -GNinja \
    ..

ninja
ninja test
ninja install
