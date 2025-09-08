#!/bin/bash

# Database Backup Script for NAS PostgreSQL
# Backs up Directus database from NAS to local and Cloud Storage

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_ROOT/backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# NAS PostgreSQL Configuration
NAS_HOST="${NAS_HOST:-10.0.20.3}"
NAS_DB="${NAS_DB:-directus}"
NAS_USER="${NAS_USER:-magicsocial_user}"
NAS_CONTAINER="${NAS_CONTAINER:-postgresql15}"

# Google Cloud Storage
GCS_BUCKET="${GCS_BUCKET:-supply-configs-private}"
GCS_PATH="${GCS_PATH:-database-backups}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Backup type (full, schema, data)
BACKUP_TYPE="${1:-full}"

log_info "Starting $BACKUP_TYPE backup of NAS PostgreSQL database..."

# Generate backup filename based on type
case $BACKUP_TYPE in
    full)
        BACKUP_FILE="directus-full-$TIMESTAMP.sql"
        DUMP_CMD="pg_dump -U $NAS_USER -d $NAS_DB --no-owner --no-acl --clean --if-exists"
        ;;
    schema)
        BACKUP_FILE="directus-schema-$TIMESTAMP.sql"
        DUMP_CMD="pg_dump -U $NAS_USER -d $NAS_DB --no-owner --no-acl --schema-only"
        ;;
    data)
        BACKUP_FILE="directus-data-$TIMESTAMP.sql"
        DUMP_CMD="pg_dump -U $NAS_USER -d $NAS_DB --no-owner --no-acl --data-only --disable-triggers"
        ;;
    *)
        log_error "Invalid backup type. Use: full, schema, or data"
        exit 1
        ;;
esac

# Perform backup
log_info "Creating backup: $BACKUP_FILE"
ssh root@$NAS_HOST "docker exec $NAS_CONTAINER $DUMP_CMD" > "$BACKUP_DIR/$BACKUP_FILE" 2>/dev/null

# Check if backup was successful
if [ $? -eq 0 ] && [ -s "$BACKUP_DIR/$BACKUP_FILE" ]; then
    FILE_SIZE=$(ls -lh "$BACKUP_DIR/$BACKUP_FILE" | awk '{print $5}')
    log_info "Backup created successfully: $BACKUP_FILE ($FILE_SIZE)"
else
    log_error "Backup failed or file is empty"
    exit 1
fi

# Clean PostgreSQL 15 specific commands for Cloud SQL compatibility
log_info "Cleaning backup for Cloud SQL compatibility..."
CLEANED_FILE="${BACKUP_FILE%.sql}-cleaned.sql"
sed '/^\\restrict/d; /^\\unrestrict/d; /^\\connect/d' "$BACKUP_DIR/$BACKUP_FILE" > "$BACKUP_DIR/$CLEANED_FILE"

# Upload to Google Cloud Storage
if command -v gsutil &> /dev/null; then
    log_info "Uploading to Google Cloud Storage..."
    
    # Upload original
    gsutil -q cp "$BACKUP_DIR/$BACKUP_FILE" "gs://$GCS_BUCKET/$GCS_PATH/original/$BACKUP_FILE"
    
    # Upload cleaned version
    gsutil -q cp "$BACKUP_DIR/$CLEANED_FILE" "gs://$GCS_BUCKET/$GCS_PATH/cleaned/$CLEANED_FILE"
    
    if [ $? -eq 0 ]; then
        log_info "Backup uploaded to Cloud Storage"
    else
        log_warning "Failed to upload to Cloud Storage"
    fi
else
    log_warning "gsutil not found, skipping Cloud Storage upload"
fi

# Clean up old local backups (keep last 7 days)
log_info "Cleaning up old local backups..."
find "$BACKUP_DIR" -name "directus-*.sql" -type f -mtime +7 -delete

# Summary
echo -e "\n${GREEN}=== Backup Summary ===${NC}"
echo "Type: $BACKUP_TYPE"
echo "File: $BACKUP_DIR/$BACKUP_FILE"
echo "Cleaned: $BACKUP_DIR/$CLEANED_FILE"
echo "Cloud: gs://$GCS_BUCKET/$GCS_PATH/"
echo "Timestamp: $TIMESTAMP"

log_info "Backup completed successfully!"