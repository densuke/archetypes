#!/bin/sh

REPO="$1"
SUBDIRS="myapp mywebapp kdweb kdapp"

if [ "x$1" = "x" ]; then
	REPO="snapshot-repo"
fi

for i in ${SUBDIRS}; do
	./deploy-single.sh $i $REPO 
done
