#!/bin/bash

set -vex

###
### LLVM Embedded Toolchain for ARM
###

VER=19.1.5

if [[ "$(uname -s)" == "Darwin" ]]; then
    FILE=LLVM-ET-Arm-${VER}-Darwin-universal
    EXT=dmg
    SHA=0451e67dc9a9066c17f746c26654962fa3889d4df468db1245d1bae69438eaf5
elif [[ "$(uname -s)" == "Linux" && "$(uname -m)" == "aarch64" ]]; then
    FILE=LLVM-ET-Arm-${VER}-Linux-AArch64
    EXT=tar.xz
    SHA=5e2f6b8c77464371ae2d7445114b4bdc19f56138e8aa864495181b52f57d0b85
elif [[ "$(uname -s)" == "Linux" && "$(uname -m)" == "x86_64" ]]; then
    FILE=LLVM-ET-Arm-${VER}-Linux-x86_64
    EXT=tar.xz
    SHA=34ee877aadc78c5e9f067e603a1bc9745ed93ca7ae5dbfc9b4406508dc153920
else
    echo "No LLVM toolchain for this OS/arch ($(uname -s), $(uname -m))"
    exit 1
fi

FOUND=no
SHA_MATCHES=no
if [[ -f /tmp/${FILE}.${EXT} ]]; then
    FOUND=yes
    if sha256 -c $SHA /tmp/${FILE}.${EXT}; then
        SHA_MATCHES=yes
    fi
fi

if [[ "$FOUND" = "no" || "$SHA_MATCHES" = "no" ]]; then
    curl https://github.com/ARM-software/LLVM-embedded-toolchain-for-Arm/releases/download/release-${VER}/${FILE}.${EXT} \
            -L -O --output-dir /tmp
fi

if [[ "$EXT" = "dmg" ]]; then
    hdiutil attach /tmp/${FILE}.${EXT}
    ls -al /Volumes/${FILE}
    rm -r ./llvm-toolchain || true
    cp -a /Volumes/${FILE}/${FILE} ./llvm-toolchain
    diskutil eject /Volumes/${FILE}
elif [[ "$EXT" = "tar.xz" ]]; then
    rm -r ./llvm-toolchain || true
    mkdir -p ./llvm-toolchain
    tar -xvf /tmp/${FILE}.${EXT} -C ./llvm-toolchain --strip-components 1
else
    exit 1
fi



###
### LVGL
###

rm -rf ./lvgl || true
git clone https://github.com/lvgl/lvgl.git --branch release/v9.2
