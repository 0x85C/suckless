#!/bin/bash -e

# Backup all patch files
mkdir -p ./temp-patches/dmenu
mkdir -p ./temp-patches/st
mkdir -p ./temp-patches/slock
mv ./dmenu/patches/* ./temp-patches/dmenu/
mv ./st/patches/* ./temp-patches/st/
mv ./slock/patches/* ./temp-patches/slock/

# Remove local source code and pull from upstream
rm -rf ./dmenu
rm -rf ./st
rm -rf ./slock
git clone https://git.suckless.org/dmenu
git clone https://git.suckless.org/st
git clone https://git.suckless.org/slock

# Build dmenu 5.3 with patches
cd ./dmenu
git checkout 5.3
mkdir ./patches
mv ./../temp-patches/dmenu/* ./patches/
git apply patches/dmenu-localpaths-5.3-0x85c.diff
git apply patches/dmenu-center-5.3-0x85c.diff
git apply patches/dmenu-border-5.3-0x85c.diff
make clean all
cd ../

# Build st 0.9.2 with patches
cd ./st
git checkout 0.9.2
mkdir ./patches
mv ./../temp-patches/st/* ./patches/
git apply patches/st-dracula-0.9.2-0x85c.diff
git apply patches/st-scrollback-0.9.2-0x85c.diff
git apply patches/st-scrollback-reflow-0.9.2-0x85c.diff
git apply patches/st-scrollback-mouse-altscreen-0.9.2-0x85c.diff
make clean all
cd ../

# Build slock 1.5 with patches
cd ./slock
git checkout 1.5
mkdir ./patches
mv ./../temp-patches/slock/* ./patches/
git apply patches/slock-all-black-1.5-0x85c.diff
make clean all
cd ../

# clean up
rm -rf ./temp-patches
