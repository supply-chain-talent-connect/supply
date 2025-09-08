#!/bin/sh
set -e

echo "Starting Keila with Cloud SQL bridge..."

# Start socat in background to bridge Unix socket to TCP
socat TCP-LISTEN:5432,reuseaddr,fork UNIX-CLIENT:/cloudsql/supply-chain-talent-connect:us-central1:supply-postgres-micro/.s.PGSQL.5432 &

# Wait for the bridge to be ready
sleep 2

# Set required environment variables
export DB_URL="postgresql://postgres:aeaab5efaeaf96307d2a794ad42045fbbc67dee5909edc404a0f3a02fb5aeed7@localhost:5432/keila_db"
export PORT="${PORT:-4000}"

# Start Keila directly from the correct location
exec /opt/app/bin/keila start