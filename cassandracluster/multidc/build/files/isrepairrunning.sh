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


numprocesses=$(ps aux | grep java | grep -ie repair | grep -v grep | wc -l)
if [[ $numprocesses -gt 0 ]] ; then
  logit "Cassandra repair is running"
else
  logit "Cassandra repair is not running"
fi

