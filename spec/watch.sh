#!/bin/bash -eu

# Usage
# source ./spec/watch.sh

echo '==============INPUT=============='
cat spec/fixtures/example.sh

echo '=============OUTPUT=============='
bundle exec ruby exe/script2md ./spec/fixtures/example.sh

