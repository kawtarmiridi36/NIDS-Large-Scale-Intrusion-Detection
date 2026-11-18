#!/bin/bash
set -e

echo "Starting NIDS Worker: $(hostname)"

# Start HDFS DataNode
hdfs --daemon start datanode

# Start YARN NodeManager
yarn --daemon start nodemanager

echo "NIDS Worker services started."

tail -f /dev/null
