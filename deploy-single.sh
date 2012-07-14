#!/bin/sh

SUBDIR="$1"
REPO="$2"

if [ "x$2" = "x" ]; then
	REPO="snapshot-repo"
fi

if [ ! -d $SUBDIR ]; then
	echo "unable to find dir: $SUBDIR"
	exit 1
fi
cd $SUBDIR
mvn -DaltDeploymentRepository=${REPO}::default::file:../snapshots/ clean deploy
cd -
