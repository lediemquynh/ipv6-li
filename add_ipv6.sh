#!/bin/bash

IFACE="${1:-enp0s3}"
PREFIX="${2:-fd17:625c:f037:2::}"
START="${3:-100}"
END="${4:-110}"

echo "Interface: $IFACE"
echo "Prefix: $PREFIX"
echo "Them tu: $START den $END"
echo "--"

for i in $(seq $START $END); do
 sudo ip -6 addr add ${PREFIX}${i}/64 dev $IFACE nodad
 echo " +${PREFIX}${i}"
done

echo "Kiem tra"
ip -6 addr show dev $IFACE | grep "inet6 ${PREFIX}"

