#!/usr/bin/env bash

# Print the commands being run so that we can see the command that triggers
# an error.  It is also useful for following along as the install occurs.
set -o xtrace

# Make sure custom grep options don't get in the way
unset GREP_OPTIONS

# We also have to unset other variables that might impact LC_ALL
# taking effect.
unset LANG
unset LANGUAGE
LC_ALL=en_US.utf8
export LC_ALL

# Clear all OpenStack related envvars
unset $(env | grep -E '^OS_' | cut -d = -f 1)

# Make sure umask is sane
umask 022

# Not all distros have sbin in PATH for regular users.
# osc will normally be installed at /usr/local/bin/openstack so ensure
# /usr/local/bin is also in the path
PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin

# Keep track of the DevStack directory
TOP_DIR=$(cd $(dirname "$0") && pwd)

# Check for uninitialized variables, a big cause of bugs
NOUNSET=${NOUNSET:-}
if [[ -n "$NOUNSET" ]]; then
  set -o nounset
fi

# Set start of devstack timestamp
DEVSTACK_START_TIME=$(date +%s)

# Clean up last environment var cache
if [[ -r $TOP_DIR/.stackenv ]]; then
  rm $TOP_DIR/.stackenv
fi

# ``stack.sh`` keeps the list of ``deb`` and ``rpm`` dependencies, config
# templates and other useful files in the ``files`` subdirectory
FILES=$TOP_DIR/files
if [ ! -d $FILES ]; then
  set +o xtrace
  echo "[ERR] missing devstack/files"
  exit 1
fi
