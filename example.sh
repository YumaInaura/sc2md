#!/bin/bash -eu

for script_file in $(find ./spec/fixtures -type f -maxdepth 1 | grep -v '\.md'); do
  echo "============================"
  echo "Convert $script_file"
  echo "============================"
  bundle exec ruby exe/sc2md "$script_file"
done
