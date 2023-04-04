#!/bin/bash

# This shell script uses to create a Multipass VM and install Keystone component.

function start_env {
  echo "Starting Multipass VM..."
  multipass launch -n keystone -c 4 -m 6G -d 100G --mount ./../../:/devstack 20.04 && \
  multipass shell keystone
}

function delete_env {
  echo "Deleting Multipass VM..."
  multipass delete keystone && multipass purge
}
