#!/bin/bash

# Base directory (set this to your server root folder)
BASE_DIR="$HOME/"

# Start DB server in first tab
konsole --new-tab -e bash -c "
cd \"$BASE_DIR/db\" || exit
if [ -f db_server.pid ]; then
    rm -f db_server.pid
    echo 'Removed old db_server.pid'
fi
sleep 2
./db_server
exec bash
" &

# Wait before starting login server
sleep 5

# Start Login server in second tab
konsole --new-tab -e bash -c "
cd \"$BASE_DIR/login\" || exit
if [ -f login_server.pid ]; then
    rm -f login_server.pid
    echo 'Removed old login_server.pid'
fi
sleep 2
./login_server
exec bash
" &


# Wait before starting login server
sleep 10

# Start Login server in second tab
konsole --new-tab -e bash -c "
cd \"$BASE_DIR/game\" || exit
if [ -f game_server.pid ]; then
    rm -f game_server.pid
    echo 'Removed old game_server.pid'
fi
sleep 2
./game_server
exec bash
" &
