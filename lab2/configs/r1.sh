#!/bin/bash
set -e
R1=clab-rodionov-l2-r1

docker exec "$R1" sudo config interface startup Ethernet0
docker exec "$R1" sudo config interface startup Ethernet4
docker exec "$R1" sudo config interface ip add Ethernet0 10.53.1.1/24 || true
docker exec "$R1" sudo config interface ip add Ethernet4 10.53.0.0/31 || true
docker exec "$R1" sudo config loopback add Loopback0 || true
docker exec "$R1" sudo config interface ip add Loopback0 10.53.255.1/32 || true
