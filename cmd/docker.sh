#!/bin/bash

function install_extended_packages() {
  required_file=$(pwd)/extended_requirements.txt
  SETUPTOOLS_USE_DISTUTILS=stdlib python3 -m pip --no-cache-dir install -r $required_file
}
