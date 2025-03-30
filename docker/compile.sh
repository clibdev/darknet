#!/bin/bash

WORKDIR=$(pwd)

# OpenCV
cd $WORKDIR
git clone https://github.com/opencv/opencv.git --depth=1 --branch=2.4.13.7

cd opencv
mkdir build && cd build

cmake -S ../ -B . -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_ZLIB=ON -DBUILD_JPEG=ON -DBUILD_PNG=ON -DBUILD_TIFF=OFF \
    -DWITH_TBB=OFF -DWITH_LAPACK=OFF -DWITH_ZLIB_NG=OFF -DWITH_OPENEXR=OFF -DBUILD_opencv_apps=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt/darknet/deps
cmake --build . -j$(nproc)
cmake --install . --strip

for file in /opt/darknet/deps/lib/*.so; do
    patchelf --set-rpath '$ORIGIN' "$file"
done
