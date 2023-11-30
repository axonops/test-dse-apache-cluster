#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

while true; do
    read -p "Do you delete all of the local docker mounted volumes contents containing Cassandra data, logs etc..  (Y/N) ?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

cd ..

echo "${PWD} Deleting docker Cassandra data files and logs"
find ./multidc/docker_containers/cass-alpha1/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha1/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha1/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha1/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha1/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-alpha2/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha2/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha2/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha2/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha2/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-alpha3/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha3/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha3/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha3/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha3/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-alpha4/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha4/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha4/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha4/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-alpha4/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-omega1/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega1/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega1/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega1/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega1/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-omega2/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega2/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega2/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega2/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega2/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-omega3/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega3/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega3/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega3/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega3/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +

find ./multidc/docker_containers/cass-omega4/data/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega4/logs/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega4/commitlog/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega4/hints/* ! -name '.gitkeep' -exec rm -rf {} +
find ./multidc/docker_containers/cass-omega4/saved_caches/* ! -name '.gitkeep' -exec rm -rf {} +