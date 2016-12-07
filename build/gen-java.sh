#!/bin/bash

source ../version.sh

CURRDIR=`dirname "$0"`
BASEDIR=`cd "$CURRDIR"; pwd`

if [ -z "$VERSION" ]; then
	echo "ERROR: env VERSION is not set!"
	exit 1
fi

cd $BASEDIR/java
./gen-java.sh $@

if [ $? -ne 0 ] 
then
	echo "gen java failed"
	exit -1
fi


