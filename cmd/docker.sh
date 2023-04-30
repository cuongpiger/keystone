#!/bin/bash

function install_extended_packages() {
  SETUPTOOLS_USE_DISTUTILS=stdlib python3 -m pip --no-cache-dir install -r ../extended_requirements.txt
}
