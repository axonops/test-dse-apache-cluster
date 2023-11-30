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

TARGET=$1

logit "Repairing ${TARGET}";

casshosts=( cass-alpha1 cass-alpha2 cass-alpha3 cass-alpha4 cass-omega1 cass-omega2 cass-omega3 cass-omega4)

for i in "${casshosts[@]}"
do
   logit "Repairing ${TARGET} on ${i}"
   nodetool -h $i repair -pr -- ${TARGET}
   logit "Finished ${TARGET} repair on ${i}"
done

echo "${TARGET} repaired on cluster"