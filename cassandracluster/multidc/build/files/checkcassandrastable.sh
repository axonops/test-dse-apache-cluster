#!/bin/bash
# stop on errors
set -e

source /etc/profile

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

checkCassandraNodesAllUp(){
    local upcount=$(nodetool status | grep 'UN\|UJ' | wc -l)
    logit "[INFO] - $upcount Cassandra nodes are up with status of UN"
    local cluster_count=$(nodetool describecluster |grep  '\['|awk -F'[' '{print $2}'|tr ']' ' '|tr ',' ' ' | wc -w)
    logit "[INFO] - Cluster contains a total of $cluster_count Cassandra nodes"
    if [[ $upcount -ne $cluster_count ]]; then
        eexit "[CRIT] - Cluster contains ${cluster_count} nodes but only ${upcount} have a status of UN. Cluster is not in stable state."
    fi
    logit "[OK] - All Cassandra nodes in cluster have status of UN."
}

checkCassandraNodesAllUp

logit "Cassandra OK"

exit 0