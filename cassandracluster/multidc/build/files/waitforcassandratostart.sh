#!/usr/bin/env bash
set -e

logit() {
    local logdate=$(date +"%Y%m%d-%H:%M:%S %Z")
    local message="[${logdate}] - ${*}"
    echo "${message}"
    logger "${message}"
}
eexit() {
    local error_str="$@"
    logit $error_str
    exit 1
}

CASSHOST=$1

logit "Waiting for cassandra to start on : $CASSHOST";

waitforit.sh $CASSHOST:9042 --timeout=180 --strict -- echo 'Cassandra is up and listening on CQL port 9042'

logit "Finished waiting for Cassandra to start on : $CASSHOST";