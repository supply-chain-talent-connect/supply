#!/bin/bash

# Simple database migration script
source .env.local

echo "Backing up from NAS..."
ssh root@$NAS_HOST "docker exec $NAS_CONTAINER pg_dump -U $NAS_USER -d $NAS_DB --clean --if-exists" > /tmp/backup.sql

echo "Cleaning backup..."
sed -e '/^\\restrict/d' -e '/^\\unrestrict/d' -e '/^\\connect/d' /tmp/backup.sql > /tmp/backup-clean.sql

echo "Importing to Cloud SQL..."
PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" -f /tmp/backup-clean.sql

echo "Done"