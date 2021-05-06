#!/bin/sh
DIST_FRONTEND_PATH='../backend/dist/frontend/'
BUILD_FRONEND_PATH='./build/.'

echo '---BACKEND BUILD STARTING---'
cd 'backend/'
yarn install --production=false
yarn run build
echo '---BACKEND BUILD END---'

echo '---FRONTEND BUILD STARTING---'
cd '../frontend'
yarn install --production=false
yarn run build
echo '---FRONTEND BUILD END---'
echo '---MOVE FRONTEND FILES TO BACKEND STARTING---'
if [ -d "$DIST_FRONTEND_PATH" ]; then
  rm -rf $DIST_FRONTEND_PATH
fi
mkdir $DIST_FRONTEND_PATH
cp -a $BUILD_FRONEND_PATH $DIST_FRONTEND_PATH
echo '---MOVE FRONTEND FILES TO BACKEND END---'
