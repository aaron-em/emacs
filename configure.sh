#!/bin/bash

set -euo pipefail

# export 
SYSTEM_LIB_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/lib"
# export HOMEBREW_GCC_LIB_PATH="/opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/current/gcc/aarch64-apple-darwin21/13/"
# export LIBRARY_PATH="${SYSTEM_LIB_PATH}:${HOMEBREW_GCC_LIB_PATH}:${LIBRARY_PATH:-""}"
# export LIBRARY_PATH="${SYSTEM_LIB_PATH}:${LIBRARY_PATH:-""}"

rm -fv ./src/emacs.pdmp

echo "Using LIBRARY_PATH: ${LIBRARY_PATH}"

./configure \
    --with-x-toolkit=no \
    --with-xwidgets \
    --with-mac-metal \
    --with-json \
    --with-modules \
    --with-makeinfo \
    --enable-mac-app \
    --enable-mac-self-contained \
    --with-imagemagick \
    --with-json \
    --with-tree-sitter \
    --with-native-compilation=no

if [[ "$?" == "0" ]]; then
    make clean
    make
fi


# diff --git a/configure.sh b/configure.sh
# index 0e5297a1c21..681fdddab93 100644
# --- a/configure.sh
# +++ b/configure.sh
# @@ -3,8 +3,9 @@
#  set -euo pipefail
#  
#  export SYSTEM_LIB_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX12.1.sdk/usr/lib"
# -export HOMEBREW_GCC_LIB_PATH="/opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/current/gcc/aarch64-apple-darwin21/13/"
# -export LIBRARY_PATH="${SYSTEM_LIB_PATH}:${HOMEBREW_GCC_LIB_PATH}:${LIBRARY_PATH:-""}"
# +# export HOMEBREW_GCC_LIB_PATH="/opt/homebrew/Cellar/gcc/13.1.0/lib/gcc/current/gcc/aarch64-apple-darwin21/13/"
# +# export LIBRARY_PATH="${SYSTEM_LIB_PATH}:${HOMEBREW_GCC_LIB_PATH}:${LIBRARY_PATH:-""}"
# +export LIBRARY_PATH="${SYSTEM_LIB_PATH}:${LIBRARY_PATH:-""}"
#  
#  rm -fv ./src/emacs.pdmp
#  
# @@ -22,8 +23,9 @@
#      --with-imagemagick \
#      --with-json \
#      --with-tree-sitter \
# -    --with-native-compilation=aot
# +    --with-native-compilation=no
#  
#  if [[ "$?" == "0" ]]; then
# +    make clean
#      make
#  fi
