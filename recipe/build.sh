#!/usr/bin/env bash

./configure \
    --prefix="${PREFIX}" \
    --enable-jit \

make
make check
make install
