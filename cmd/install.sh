#!/bin/bash

branch=stable/zed
repo=https://github.com/openstack/keystone.git
pythonVersion=3.8
destDir=/keystone

function checkPython {
  local pythonVersion=$1

  # Python3 is installed
  if command -v python3 >/dev/null; then
    # Check python version
    version=$(python3 -V 2>&1)
    if [[ $version == *$pythonVersion* ]]; then
      return 0  # return true
    fi
  fi
  return 1
}

function gitClone {
  sudo rm -rf $destDir
  git clone --depth 1 --branch $branch $repo $destDir
}

function installPython {
  sudo apt-get update && \
  sudo DEBIAN_FRONTEND=noninteractive http_proxy= https_proxy= no_proxy= apt-get --option Dpkg::Options::=--force-confold --assume-yes install python${pythonVersion}
}

function main {
  if ! checkPython $pythonVersion; then
    echo "Python3 is not installed"
    installPython
    exit 1
  fi

  echo "Python3 is installed"
  gitClone
}

main