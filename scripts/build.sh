#!/bin/sh

PROJECT_HOME=`pwd`
PROJECT_PATH=./decomposer
PROJECT_NAME="decomposer"

BUILD_TARGET="decomposer"

DSTROOT=../builds
OBJROOT=../builds
SYMROOT=../builds

#set -e

export DSTROOT
echo "[#] - Building project"
echo "-------------------------------------------------------------"
xcodebuild -project ${PROJECT_PATH}/${PROJECT_NAME}.xcodeproj \
		   -target ${BUILD_TARGET} \
		   	clean build \
  		   		DSTROOT=${DSTROOT} \
  		   		SYMROOT=${SYMROOT} \
  		   		OBJROOT=${OBJROOT}