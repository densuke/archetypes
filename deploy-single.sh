#!/bin/sh

SUBDIR="$1"
REPO="$2"

if [ "x$2" = "x" ]; then
	REPO="snapshot-repo"
	DIR=snapshots
fi

if [ "x$2" = "xreleases" ]; then
	REPO="releases"
	DIR="releases"
fi

if [ ! -d $SUBDIR ]; then
	echo "unable to find dir: $SUBDIR"
	exit 1
fi
cd $SUBDIR
git pull
mvn -DaltDeploymentRepository=${REPO}::default::file:../${DIR}/ -Darchetype.filterdExtentions=jpg clean deploy
cd -
