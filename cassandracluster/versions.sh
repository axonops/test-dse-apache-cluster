#!/bin/bash
#set -x

readonly PROGNAME=`basename "$0"`
readonly CASSANDRA_VERSION='4.0.11'
readonly DRIVER_VERSION='4.17'

readonly NC='\033[0m' # No Color
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'

logit() {
    local logdate=$(date +"%Y%m%d-%H:%M:%S %Z")
    local message="[INFO]\t[${PROGNAME}]-[${logdate}] - ${*}"
    echo -e "${GREEN}${message}${NC}"
}

logdebug() {
    local logdate=$(date +"%Y%m%d-%H:%M:%S %Z")
    local message="[DEBUG]\t[${PROGNAME}]-[${logdate}] - ${*}"
    echo -e "${NC}${message}${NC}"
}

eexit() {
    local logdate=$(date +"%Y%m%d-%H:%M:%S %Z")
    local message="[ERROR]\t[${PROGNAME}]-[${logdate}] - ${*}"
    echo -e "${RED}${message}${NC}"
    exit 1
}

init() {

    if [ "x$(which docker)" == "x" ]; then
        eexit "Docker is not detected. Exiting"
    fi

    docker info > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        eexit "Unable to talk to the docker daemon"
    fi

    local message="$PROGNAME is being executed. Cassandra Version: $CASSANDRA_VERSION. Driver Version: $DRIVER_VERSION."
    logit ${message}
}
init