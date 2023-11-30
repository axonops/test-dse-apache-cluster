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


numprocesses=$(ps aux | grep java | grep -ie cassandra | grep -v grep | wc -l)
if [[ $numprocesses -gt 0 ]] ; then
  logit "Killing Cassandra"
  ps aux | grep java | grep -ie cassandra | awk '{print $2}' | xargs kill -9
  logit "Cassandra Killed"
else
  logit "Cassandra is not running, nothing to kill..."
fi