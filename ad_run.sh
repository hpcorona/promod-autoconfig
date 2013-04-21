#!/bin/bash

echo "Starting L4D2 server..."
sleep 1
cd ~/hlds/left4dead2
screen -A -m -d -S left4dead2 ./srcds_run +hostport 27015 +map c5m1_waterfront -game left4dead2 -ip 0.0.0.0 -maxplayers 18
