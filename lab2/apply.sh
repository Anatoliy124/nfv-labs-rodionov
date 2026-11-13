#!/bin/bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

bash "$DIR/configs/r1.sh"
bash "$DIR/configs/r2.sh"

docker exec clab-rodionov-l2-r1 sudo supervisorctl start bgpd || true
docker exec clab-rodionov-l2-r2 sudo supervisorctl start bgpd || true

docker exec -i clab-rodionov-l2-r1 vtysh < "$DIR/configs/r1-frr.conf"
docker exec -i clab-rodionov-l2-r2 vtysh < "$DIR/configs/r2-frr.conf"
