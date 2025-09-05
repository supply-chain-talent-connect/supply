#!/bin/bash

# Deploy Listmonk and Ghost on NAS (10.0.20.3)

NAS_HOST="10.0.20.3"
NAS_USER="root"

echo "Creating MinIO buckets on NAS..."
ssh ${NAS_USER}@${NAS_HOST} << 'ENDSSH'
# Create MinIO buckets using mc (MinIO client)
docker exec minio mc alias set local http://localhost:9000 minioadmin minioadmin 2>/dev/null || true
docker exec minio mc mb local/supply-assets-public 2>/dev/null || true
docker exec minio mc mb local/supply-user-private 2>/dev/null || true
docker exec minio mc anonymous set download local/supply-assets-public 2>/dev/null || true
echo "MinIO buckets created"
ENDSSH

echo "Deploying Listmonk on NAS..."
ssh ${NAS_USER}@${NAS_HOST} << 'ENDSSH'
# Stop existing Listmonk if running
docker stop listmonk 2>/dev/null || true
docker rm listmonk 2>/dev/null || true

# Create Listmonk config
cat > /tmp/listmonk-config.toml << 'EOF'
[app]
address = "0.0.0.0:9000"
admin_username = "admin"
admin_password = "Choogu9i;"

[db]
host = "10.0.20.3"
port = 5432
user = "postgres"
password = "Choogu9i;"
database = "listmonk_db"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
EOF

# Run Listmonk
docker run -d \
  --name listmonk \
  --restart unless-stopped \
  -p 9001:9000 \
  -v /tmp/listmonk-config.toml:/listmonk/config.toml \
  listmonk/listmonk:latest

echo "Listmonk deployed on port 9001"
ENDSSH

echo "Deploying Ghost on NAS..."
ssh ${NAS_USER}@${NAS_HOST} << 'ENDSSH'
# Stop existing Ghost if running
docker stop ghost 2>/dev/null || true
docker rm ghost 2>/dev/null || true

# Create Ghost data directory
mkdir -p /data/ghost

# Run Ghost
docker run -d \
  --name ghost \
  --restart unless-stopped \
  -p 2368:2368 \
  -v /data/ghost:/var/lib/ghost/content \
  -e database__client=postgres \
  -e database__connection__host=10.0.20.3 \
  -e database__connection__port=5432 \
  -e database__connection__database=ghost_db \
  -e database__connection__user=postgres \
  -e database__connection__password=Choogu9i\; \
  -e url=http://10.0.20.3:2368 \
  ghost:5-alpine

echo "Ghost deployed on port 2368"
ENDSSH

echo "Deployment complete!"
echo "Access Listmonk at: http://10.0.20.3:9001"
echo "Access Ghost at: http://10.0.20.3:2368"