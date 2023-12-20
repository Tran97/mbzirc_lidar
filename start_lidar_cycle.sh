#!/bin/bash

# Function to launch the ROS2 node
launch_node() {
    ros2 launch sick_scan_xd sick_multiscan.launch.py hostname:="${HOSTNAME}" udp_receiver_ip:=${UDP_RECEIVER}
}

# Launch the ROS2 node in the background
launch_node &

# Capture the PID of the background process
background_pid=$!

# Sleep for a while to simulate the node running
sleep 5

# Send SIGINT (Ctrl+C) to the background process
kill -SIGINT "$background_pid"

# Sleep again to allow the node to shut down
sleep 5

# Launch the ROS2 node again
launch_node