#!/bin/sh

set -e

if [ "$RUN_E2E_TESTS" != "true" ]; then
  echo "Skipping end to end tests."
else
  echo "Running end to end tests..."
  wget https://github.com/segmentio/library-e2e-tester/releases/download/0.1.1/tester_linux_amd64
  chmod +x tester_linux_amd64
  ./tester_linux_amd64 -segment-write-key="$SEGMENT_WRITE_KEY" -runscope-token="$RUNSCOPE_TOKEN" -runscope-bucket="$RUNSCOPE_BUCKET" -path='.buildscript/cli.sh'
  echo "End to end tests completed!"
fi
