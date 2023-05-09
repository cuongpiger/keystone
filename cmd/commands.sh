#!/bin/bash

function fernet_setup {
  if command -v pip >/dev/null 2>&1; then
    if pip freeze | grep -q keystone; then
      keystone-manage --config-dir /etc/keystone fernet_setup
    else
      echo "[ERROR:$LINENO] --- keystone-manage has not been installed, using pip install -e <keystone_directory> to install first."
    fi
  else
    echo "[ERROR:$LINENO] --- pip is not installed, please install pip and then try again."
  fi
}
