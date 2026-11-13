#!/bin/bash
set -e
R2=clab-rodionov-l2-r2

docker exec "$R2" sudo config interface startup Ethernet0
docker exec "$R2" sudo config interface startup Ethernet4
docker exec "$R2" sudo config interface ip add Ethernet0 10.53.2.1/24 || true
docker exec "$R2" sudo config interface ip add Ethernet4 10.53.0.1/31 || true
docker exec "$R2" sudo config loopback add Loopback0 || true
docker exec "$R2" sudo config interface ip add Loopback0 10.53.255.2/32 || true
