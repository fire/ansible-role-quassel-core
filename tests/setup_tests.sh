#!/bin/sh -xe

# https://djw8605.github.io/2016/05/03/building-centos-packages-on-travisci/
# This script starts docker and systemd (if el7)

docker run --privileged -d -ti -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup -v `pwd`:/htcondor-ce:rw  centos:centos${OS_VERSION}   /usr/sbin/init
DOCKER_CONTAINER_ID=$(docker ps | grep centos | awk '{print $1}')
docker logs $DOCKER_CONTAINER_ID
docker exec -ti $DOCKER_CONTAINER_ID /bin/bash -xec "bash -xe /htcondor-ce/tests/test_inside_docker.sh ${OS_VERSION};
  echo -ne \"------\nEND HTCONDOR-CE TESTS\n\";"
docker ps -a
docker stop $DOCKER_CONTAINER_ID
docker rm -v $DOCKER_CONTAINER_ID
