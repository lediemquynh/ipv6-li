#!/bin/bash

IFACE="enp0s3"
PREFIX="fd17:625c:f037:2::"
START=100
END=110

echo "Xoa tu ${PREFIX}${START} den ${PREFIX}${END} tren $IFACE"

for i in $(seq $START $END); do
 sudo ip -6 addr del ${PREFIX}${i}/64 dev $IFACE
 echo " -${PREFIX}${i}"
done

echo "Xong"
