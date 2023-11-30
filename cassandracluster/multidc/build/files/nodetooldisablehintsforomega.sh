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

nodetool disablehintsfordc omega