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

casshosts=( cass-alpha1 cass-alpha2 cass-alpha3 cass-alpha4 cass-omega1 cass-omega2 cass-omega3 cass-omega4)

for i in "${casshosts[@]}"
do
   logit "Running repair on ${i}"
   nodetool -h $i repair -pr --full
   logit "Finished repair on ${i}"
done

echo "Cluster Repaired"