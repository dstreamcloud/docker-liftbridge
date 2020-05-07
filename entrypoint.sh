#!/bin/bash

CLUSTER_NAME=${CLUSTER_NAME:=cluster}

if [[ "$HOSTNAME" =~ -0$ ]];
then
  echo "Running in liftbridge-0 as a bootstrap seed..."
  /liftbridge --config /etc/liftbridge.yaml --raft-bootstrap-seed --id="${CLUSTER_NAME}-$HOSTNAME"
else
  echo "Running in $HOSTNAME..."
  /liftbridge --config /etc/liftbridge.yaml --id="${CLUSTER_NAME}-$HOSTNAME"
fi