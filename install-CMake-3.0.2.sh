#!/bin/bash

echo "Installing CMake-3.0.2"

SOFTWARE=cmake
MAJOR_VERSION=3
MINOR_VERSION=0
RELEASE_VERSION=2
VERSION=$MAJOR_VERSION.$MINOR_VERSION.$RELEASE_VERSION
PACKAGE=$SOFTWARE-$VERSION
PACKAGE_TAR_FILE=$PACKAGE.tar
PACKAGE_ZIP_FILE=$PACKAGE_TAR_FILE.gz
ROOT_DIR=$PACKAGE
BUILD_DIR=$ROOT_DIR/build
DST_DIR=$LOCAL_SW_INSTALL_DIR/$SOFTWARE/$VERSION
PROTOCOL=https
SERVER=cmake.org
SERVER_DIR=files/v3.0
URL=$PROTOCOL://$SERVER/$SERVER_DIR/$PACKAGE_ZIP_FILE

cd $LOCAL_SW_BUILD_DIR;
wget $URL;
tar xvfz $PACKAGE_ZIP_FILE;
rm -f $PACKAGE_ZIP_FILE;
mkdir -p $BUILD_DIR;
mkdir -p $DST_DIR;
cd $BUILD_DIR;
../configure \
  --qt-gui \
  --prefix=$DST_DIR
make;
make install;
