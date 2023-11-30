#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source ../../versions.sh

docker image inspect axonops-cassandra:$CASSANDRA_VERSION > /dev/null

status=$?

logit "axonops-cassandra:$CASSANDRA_VERSION exists is $status"

if test $status -eq 1
then
	logit "Building docker image as does not exist"

	# Download the dse version specified in CASSANDRA_VERSION file (assumes you have credentials setup in a 
	# .netrc file or _netrc file under Windows)
	if [ -f "files/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz" ]; then
	    echo "apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz exists."
	else 
	    echo "apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz does not exist. Downloading"
	    curl --netrc -SLO https://archive.apache.org/dist/cassandra/$CASSANDRA_VERSION/apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz
	    mv apache-cassandra-$CASSANDRA_VERSION-bin.tar.gz files/
	fi

	# if [ -f "jna-$JNA_VERSION.jar" ]; then
	#     echo "jna-$JNA_VERSION.jar exists."
	# else 
	#     echo "jna-$JNA_VERSION.jar does not exist. Downloading"
	# 	curl --netrc -SLO https://repo1.maven.org/maven2/net/java/dev/jna/jna/$JNA_VERSION/jna-$JNA_VERSION.jar
	# fi
	docker build -t axonops-cassandra:$CASSANDRA_VERSION .
fi