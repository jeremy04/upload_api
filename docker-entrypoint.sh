#!/bin/bash
set -ex

bundle check || bundle install --jobs 20 --retry 5 --binstubs="$BUNDLE_BIN"
exec "$@"
