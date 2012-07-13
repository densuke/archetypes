#!/bin/sh

REPO="$1"
SUBDIRS="myapp mywebapp"

if [ "x$1" = "x" ]; then
	REPO="snapshot-repo"
fi

for i in ${SUBDIRS}; do
	if [ ! -d $i ]; then
		echo "unable to find dir: $i"
		continue
	fi
	cd $i
 	mvn -DaltDeploymentRepository=${REPO}::default::file:../snapshots/ clean deploy
	cd -
done
