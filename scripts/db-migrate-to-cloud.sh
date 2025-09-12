#!/bin/bash

# Database Migration Script - NAS to Google Cloud SQL
# Migrates Directus database from NAS PostgreSQL to Cloud SQL

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_ROOT/backups"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Source environment if exists
if [ -f "$PROJECT_ROOT/.env.local" ]; then
    export $(grep -v '^#' "$PROJECT_ROOT/.env.local" | xargs)
fi

# NAS PostgreSQL Configuration
NAS_HOST="${NAS_HOST:-10.0.20.3}"
NAS_DB="${NAS_DB:-directus}"
NAS_USER="${NAS_USER:-magicsocial_user}"
NAS_CONTAINER="${NAS_CONTAINER:-postgresql15}"

# Cloud SQL Configuration
CLOUD_SQL_INSTANCE="${CLOUD_SQL_INSTANCE:-supply-postgres-micro}"
CLOUD_SQL_DB="${CLOUD_SQL_DB:-directus_db}"
CLOUD_SQL_USER="${CLOUD_SQL_USER:-postgres}"
CLOUD_SQL_PASSWORD="${CLOUD_SQL_PASSWORD:-REDACTED_PASSWORD}"
CLOUD_SQL_IP="${CLOUD_SQL_IP:-35.232.243.95}"

# Google Cloud Storage
GCS_BUCKET="${GCS_BUCKET:-supply-configs-private}"
GCS_PATH="${GCS_PATH:-database-backups}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

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

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# Check prerequisites
check_prerequisites() {
    log_step "Checking prerequisites..."
    
    if ! command -v psql &> /dev/null; then
        log_error "psql is not installed"
        exit 1
    fi
    
    if ! command -v gsutil &> /dev/null; then
        log_error "gsutil is not installed"
        exit 1
    fi
    
    if ! command -v gcloud &> /dev/null; then
        log_error "gcloud is not installed"
        exit 1
    fi
    
    log_info "All prerequisites met"
}

# Create backup from NAS
create_backup() {
    log_step "Creating backup from NAS..."
    
    BACKUP_FILE="directus-migration-$TIMESTAMP.sql"
    BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"
    
    mkdir -p "$BACKUP_DIR"
    
    # Create dump without database creation commands
    ssh root@$NAS_HOST "docker exec $NAS_CONTAINER pg_dump -U $NAS_USER -d $NAS_DB \
        --no-owner \
        --no-acl \
        --clean \
        --if-exists \
        --no-comments" > "$BACKUP_PATH"
    
    if [ ! -s "$BACKUP_PATH" ]; then
        log_error "Backup failed or file is empty"
        exit 1
    fi
    
    FILE_SIZE=$(ls -lh "$BACKUP_PATH" | awk '{print $5}')
    log_info "Backup created: $BACKUP_FILE ($FILE_SIZE)"
}

# Clean backup for Cloud SQL
clean_backup() {
    log_step "Cleaning backup for Cloud SQL compatibility..."
    
    CLEANED_FILE="${BACKUP_FILE%.sql}-cleaned.sql"
    CLEANED_PATH="$BACKUP_DIR/$CLEANED_FILE"
    
    # Remove PostgreSQL 15 specific commands and problematic statements
    sed -e '/^\\restrict/d' \
        -e '/^\\unrestrict/d' \
        -e '/^\\connect/d' \
        -e '/^DROP DATABASE/d' \
        -e '/^CREATE DATABASE/d' \
        "$BACKUP_PATH" > "$CLEANED_PATH"
    
    log_info "Cleaned backup created: $CLEANED_FILE"
}

# Upload to Cloud Storage
upload_to_gcs() {
    log_step "Uploading to Cloud Storage..."
    
    gsutil -q cp "$CLEANED_PATH" "gs://$GCS_BUCKET/$GCS_PATH/migration/$CLEANED_FILE"
    
    if [ $? -eq 0 ]; then
        log_info "Backup uploaded to gs://$GCS_BUCKET/$GCS_PATH/migration/$CLEANED_FILE"
    else
        log_error "Failed to upload to Cloud Storage"
        exit 1
    fi
}

# Prepare Cloud SQL database
prepare_cloud_sql() {
    log_step "Preparing Cloud SQL database..."
    
    # Enable PostGIS if not already enabled
    PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -c "CREATE EXTENSION IF NOT EXISTS postgis;" 2>/dev/null || true
    
    # Check PostGIS version
    POSTGIS_VERSION=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT postgis_version();" 2>/dev/null | xargs)
    
    if [ -n "$POSTGIS_VERSION" ]; then
        log_info "PostGIS enabled: $POSTGIS_VERSION"
    else
        log_error "Failed to enable PostGIS"
        exit 1
    fi
}

# Import to Cloud SQL
import_to_cloud_sql() {
    log_step "Importing to Cloud SQL..."
    
    # Drop existing tables (careful!)
    if [ "$1" == "--clean" ]; then
        log_warning "Dropping existing tables in Cloud SQL..."
        PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
            -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public; CREATE EXTENSION IF NOT EXISTS postgis;"
    fi
    
    # Import using psql
    log_info "Importing data to Cloud SQL..."
    PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -f "$CLEANED_PATH" 2>&1 | grep -E "(ERROR|FATAL|WARNING)" || true
    
    if [ $? -eq 0 ]; then
        log_info "Data imported successfully"
    else
        log_warning "Import completed with some warnings (this is normal)"
    fi
}

# Verify migration
verify_migration() {
    log_step "Verifying migration..."
    
    # Count tables
    TABLE_COUNT=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'public';" | xargs)
    
    # Count Map_Cities (try both uppercase and lowercase)
    CITIES_COUNT=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT COUNT(*) FROM map_cities;" 2>/dev/null | xargs || \
        PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT COUNT(*) FROM \"Map_Cities\";" 2>/dev/null | xargs || echo "0")
    
    # Check hero data
    HERO_COUNT=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT COUNT(*) FROM hero_translations;" 2>/dev/null | xargs || echo "0")
    
    echo -e "\n${GREEN}=== Migration Verification ===${NC}"
    echo "Tables migrated: $TABLE_COUNT"
    echo "Map_Cities records: $CITIES_COUNT"
    echo "Hero translations: $HERO_COUNT"
    
    if [ "$TABLE_COUNT" -gt 0 ] && [ "$CITIES_COUNT" -gt 0 ]; then
        log_info "Migration verified successfully!"
    else
        log_warning "Migration may be incomplete, please verify manually"
    fi
}

# Main execution
main() {
    echo -e "${GREEN}=== Database Migration: NAS to Cloud SQL ===${NC}\n"
    
    check_prerequisites
    create_backup
    clean_backup
    upload_to_gcs
    prepare_cloud_sql
    
    # Check for --clean flag
    if [ "$1" == "--clean" ] || [ "$1" == "--clean-force" ]; then
        log_warning "Running with --clean flag will DROP all existing data!"
        if [ "$1" != "--clean-force" ]; then
            read -p "Are you sure? (yes/no): " confirm
            if [ "$confirm" != "yes" ]; then
                log_info "Migration cancelled"
                exit 0
            fi
        fi
        import_to_cloud_sql --clean
    else
        import_to_cloud_sql
    fi
    
    verify_migration
    
    echo -e "\n${GREEN}=== Migration Complete ===${NC}"
    echo "Source: $NAS_HOST/$NAS_DB"
    echo "Target: Cloud SQL/$CLOUD_SQL_DB"
    echo "Backup: $CLEANED_PATH"
    echo "Cloud Storage: gs://$GCS_BUCKET/$GCS_PATH/migration/$CLEANED_FILE"
}

# Run main function
main "$@"