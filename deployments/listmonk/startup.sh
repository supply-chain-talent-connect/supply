#!/bin/sh
set -e

# Wait for Cloud SQL proxy to be ready
sleep 2

# Create config from environment variables
cat > config.toml <<EOF
[app]
address = "0.0.0.0:9000"

[db]
host = "/cloudsql/supply-chain-talent-connect:us-central1:supply-postgres-micro"
port = 5432
user = "postgres"
password = "${DATABASE_PASSWORD}"
database = "listmonk_db"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
params = ""
EOF

# Initialize database if needed (idempotent - only runs if not already setup)
echo "Initializing database..."
./listmonk --install --idempotent --yes --config config.toml

# Start listmonk
echo "Starting listmonk..."
exec ./listmonk --config config.toml