
#!/bin/bash
set -e

echo "Starting NIDS Master..."

# Initialize NameNode only once
if [ ! -d "/data/hdfs/namenode/current" ]; then
    echo "Formatting HDFS NameNode..."
    hdfs namenode -format -force
fi

# Start HDFS NameNode
echo "Starting HDFS NameNode..."
hdfs --daemon start namenode

# Wait for HDFS to become available
echo "Waiting for HDFS..."

attempt=0
until hdfs dfs -mkdir -p /spark-logs; do
    attempt=$((attempt + 1))

    if [ "$attempt" -ge 60 ]; then
        echo "ERROR: HDFS did not become ready in time."
        exit 1
    fi

    echo "HDFS is not ready yet. Attempt $attempt/60..."
    sleep 5
done

echo "HDFS is ready."

# Start YARN ResourceManager
echo "Starting YARN ResourceManager..."
yarn --daemon start resourcemanager

# Start Spark History Server
echo "Starting Spark History Server..."
mkdir -p /opt/spark/logs
$SPARK_HOME/sbin/start-history-server.sh

echo "NIDS Master services started."

# Keep container alive
tail -f /dev/null
