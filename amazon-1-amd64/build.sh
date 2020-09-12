#!/bin/bash -eu
# Copyright 2019 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# Because Pillow's "./setup.py build_ext --inplace" does not work with custom CC and CFLAGS,
# it is necessary to build in the following manner:
#
# Build CPython without instrumentation/sanitization
# Build Pillow in a virtualenv based on uninstrumented and unsanitized CPython. Log the build steps to build.sh
# Build CPython with instrumentation/sanitization
# Rewrite build.sh to compile Pillow based on CPython with instrumentation/sanitization
#
# Why not build Pillow directly with a virtualenv based on instrumented CPython?
# Because the virtualenv will inherit CC and CFLAGS of the instrumented CPython, and that will fail.

cd $SRC/
tar zxf v3.6.12.tar.gz
cd cpython-3.6.12/

# Ignore memory leaks from python scripts invoked in the build
export ASAN_OPTIONS="detect_leaks=0"
export MSAN_OPTIONS="halt_on_error=0:exitcode=0:report_umrs=0"

# Remove -pthread from CFLAGS, this trips up ./configure
# which thinks pthreads are available without any CLI flags
CFLAGS=${CFLAGS//"-pthread"/}

FLAGS=()
case $SANITIZER in
  address)
    FLAGS+=("--with-address-sanitizer")
    ;;
  memory)
    FLAGS+=("--with-memory-sanitizer")
    # installing ensurepip takes a while with MSAN instrumentation, so
    # we disable it here
    FLAGS+=("--without-ensurepip")
    # -msan-keep-going is needed to allow MSAN's halt_on_error to function
    FLAGS+=("CFLAGS=-mllvm -msan-keep-going=1")
    ;;
  undefined)
    FLAGS+=("--with-undefined-behavior-sanitizer")
    ;;
esac

./configure "${FLAGS[@]}"
make -j$(nproc)
make install
