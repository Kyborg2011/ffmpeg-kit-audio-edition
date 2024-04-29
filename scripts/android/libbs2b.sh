#!/bin/bash

# UPDATE BUILD FLAGS
export SNDFILE_CFLAGS="$(pkg-config --cflags sndfile)"
export SNDFILE_LIBS="$(pkg-config --libs --static sndfile)"

echo $SNDFILE_CFLAGS
echo $SNDFILE_LIBS

# ALWAYS CLEAN THE PREVIOUS BUILD
make distclean 2>/dev/null 1>/dev/null

# REGENERATE BUILD FILES IF NECESSARY OR REQUESTED
export HAVE_AUTORECONF="no"
./autogen.sh
cp ltmain.sh ./build-aux/
./autogen.sh

./configure \
  --prefix="${LIB_INSTALL_PREFIX}" \
  --with-pic \
  --with-sysroot="${ANDROID_SYSROOT}" \
  --enable-static \
  --disable-shared \
  --disable-fast-install \
  --host="${HOST}" \
  CFLAGS="${SNDFILE_CFLAGS}" \
  LDFLAGS="${SNDFILE_LIBS}" || return 1

sed -e '/AC_FUNC_MALLOC/ s/^#*/#/' ./configure.ac | tee ./configure.ac

# WORKAROUND TO DISABLE BUILDING OF DOCBOOK - BUILD SCRIPTS DO NOT GENERATE A TARGET FOR IT
${SED_INLINE} 's/dist_man_MANS = .*/dist_man_MANS =/g' "${BASEDIR}"/src/"${LIB_NAME}"/doc/Makefile || return 1

make -j$(get_cpu_count) || return 1

make install || return 1

# MANUALLY COPY PKG-CONFIG FILES
cp ./*.pc "${INSTALL_PKG_CONFIG_DIR}" || return 1
