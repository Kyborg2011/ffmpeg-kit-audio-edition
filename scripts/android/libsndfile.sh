#!/bin/bash

# ALWAYS CLEAN THE PREVIOUS BUILD
make distclean 2>/dev/null 1>/dev/null

# REGENERATE BUILD FILES IF NECESSARY OR REQUESTED
autoreconf -vif 1>>"${BASEDIR}"/build.log
cp ltmain.sh ./build-aux/
autoreconf -vif 1>>"${BASEDIR}"/build.log

#./Scripts/android-configure.sh
./configure \
  --prefix="${LIB_INSTALL_PREFIX}" \
  --with-pic \
  --with-sysroot="${ANDROID_SYSROOT}" \
  --enable-static \
  --disable-shared \
  --disable-fast-install \
  --disable-sqlite \
  --disable-alsa \
  --disable-full-suite \
  --disable-external-libs \
  --host="${HOST}" || return 1

make -j$(get_cpu_count) || return 1

make install || return 1

# MANUALLY COPY PKG-CONFIG FILES
cp ./*.pc "${INSTALL_PKG_CONFIG_DIR}" || return 1
