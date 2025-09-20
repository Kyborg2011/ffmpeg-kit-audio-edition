#!/bin/bash

export ANDROID_SDK_ROOT="/home/$(whoami)/Android/Sdk"
export ANDROID_NDK_ROOT="${ANDROID_SDK_ROOT}/ndk/29.0.14033849"

./android.sh --debug --no-ffmpeg-kit-protocols \
  --enable-libsndfile --enable-libilbc --enable-android-zlib --enable-android-media-codec \
  --enable-custom-library-1-name=libbs2b \
  --enable-custom-library-1-repo=https://github.com/alexmarsev/libbs2b \
  --enable-custom-library-1-package-config-file-name=libbs2b \
  --enable-custom-library-1-ffmpeg-enable-flag=libbs2b \
  --enable-custom-library-1-license-file=COPYING \
  --enable-custom-library-1-repo-commit=5ca2d59888df047f1e4b028e3a2fd5be8b5a7277
