#!/bin/bash
set -e

containerlab destroy -t lab2.clab.yml
containerlab deploy -t lab2.clab.yml
./apply.sh

sleep 30

docker exec clab-rodionov-l2-r1 vtysh -c "show ip bgp summary"
docker exec clab-rodionov-l2-r2 vtysh -c "show ip bgp summary"

docker exec clab-rodionov-l2-pc1 ping -c 4 10.53.2.10
docker exec clab-rodionov-l2-pc1 ping -c 4 10.53.255.2
