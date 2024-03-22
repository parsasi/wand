#!/bin/bash

# Check if port number is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <port_number>"
    exit 1
fi

# Extract port number from arguments
port=$1

# Find PID using lsof for the specified port
pid=$(sudo lsof -ti:$port)

# Check if any process is using the specified port
if [ -z "$pid" ]; then
    echo "No process found using port $port"
    exit 1
fi

# Kill the process using the extracted PID
sudo kill -9 $pid

echo "Process using port $port has been killed"
