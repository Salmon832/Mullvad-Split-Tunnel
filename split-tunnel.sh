#!/bin/bash

monitor_processes() {
    while true; do
        # Find all Vivaldi and Steam PIDs
        PIDS=$(pgrep -f 'process1|process2|process3')

        if [[ -n "$PIDS" ]]; then
            for PID in $PIDS; do
                echo "Adding PID $PID to Mullvad split tunnel..."
                mullvad split-tunnel add "$PID"
            done
        fi

        # Wait for 5 seconds before checking again (adjust as needed)
        sleep 5
    done
}

monitor_processes
