#!/bin/bash
export DEEPSEEK_API_KEY="sk-009fb16aaa58425c847934145431ce3c"
# File to store process IDs
PID_FILE="process_ids.txt"

# Empty the PID file if it exists or create if not
> $PID_FILE

# List of topics
topics=("math")

# Loop through each topic and run the command in the background
for topic in "${topics[@]}"; do
    python run_deepseek.py --category "$topic" &
    echo $! >> $PID_FILE
done

echo "All processes have been started and their PIDs stored in $PID_FILE."

# Watche for the process.
tail -f /dev/null