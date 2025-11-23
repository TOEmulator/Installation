#!/bin/bash
# Auto script to stop Talisman Online servers

# Set base directory (adjust this to your server root if needed)
BASE_DIR=/root

# Stop db_server
pkill -f "./db_server"
sleep 1
rm -f $BASE_DIR/game/game_server.pid

# Stop login_server
pkill -f "./login_server"
sleep 1
rm -f $BASE_DIR/login/login_server.pid

# Stop game_server
pkill -f "./game_server"
sleep 1
rm -f $BASE_DIR/db/db_server.pid

echo "✅ All servers stopped and PID files removed (db_server, login_server, game_server)."
