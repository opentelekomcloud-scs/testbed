#!/usr/bin/env bash
set -e

source /opt/configuration/scripts/include.sh

MANAGER_VERSION=$(docker inspect --format '{{ index .Config.Labels "org.opencontainers.image.version"}}' osism-ansible)

osism apply -a upgrade gnocchi
osism apply -a upgrade heat

# NOTE: disabled because we have not yet deployed Senlin in the previous version of OSISM
# MANAGER_VERSION=$(docker inspect --format '{{ index .Config.Labels "org.opencontainers.image.version"}}' osism-ansible)
# if [[ $MANAGER_VERSION =~ ^7\.[0-9]\.[0-9]?$ || $MANAGER_VERSION == "latest" ]]; then
#     osism apply -a upgrade senlin
# fi

osism apply -a upgrade manila
