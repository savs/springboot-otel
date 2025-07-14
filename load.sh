#!/bin/bash
# Bash script to repeatedly hit http://localhost:8080/ with a random pause between 0 and 2 seconds

ADDRESS=10.0.0.31
PORT=30080

count=0
while true; do
  response=$(curl -s http://$ADDRESS:$PORT/)
  count=$((count+1))
  echo "Response: $response"
  echo "Total requests made: $count"
  # Sleep for a random duration between 0 and 2 seconds
  sleep_time=$(awk -v min=0 -v max=5 'BEGIN{srand(); print min+rand()*(max-min)}')
  sleep $sleep_time
done
