#!/bin/bash

if [[ "$HOSTNAME" =~ -0$ ]];
then
  echo "Running in liftbridge-0 as a bootstrap seed..."
  /liftbridge --config /etc/liftbridge.yaml --raft-bootstrap-seed --id="$HOSTNAME"
else
  echo "Running in $HOSTNAME..."
  /liftbridge --config /etc/liftbridge.yaml --id="$HOSTNAME"
fi