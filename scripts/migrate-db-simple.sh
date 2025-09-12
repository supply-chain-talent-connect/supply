#!/bin/bash

# Simplified Database Migration Script
# Migrates data from NAS PostgreSQL to Cloud SQL using pg_dump and psql

set -euo pipefail

# Configuration - Set these environment variables or update values here
NAS_HOST="${NAS_HOST:-10.0.20.3}"
NAS_DB="${NAS_DB:-directus}"
NAS_USER="${NAS_USER:-magicsocial_user}"
NAS_CONTAINER="${NAS_CONTAINER:-postgresql15}"

CLOUD_SQL_IP="${CLOUD_SQL_IP:-10.0.20.10}"
CLOUD_SQL_DB="${CLOUD_SQL_DB:-directus}"
CLOUD_SQL_USER="${CLOUD_SQL_USER:-directus_user}"
CLOUD_SQL_PASSWORD="${CLOUD_SQL_PASSWORD:-your_password_here}"

BACKUP_DIR="/tmp"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_FILE="$BACKUP_DIR/directus-migration-$TIMESTAMP.sql"
CLEANED_FILE="$BACKUP_DIR/directus-migration-$TIMESTAMP-cleaned.sql"
LOG_FILE="$BACKUP_DIR/directus-migration-$TIMESTAMP.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1"
    echo -e "${GREEN}[INFO]${NC} $1"
    echo "$msg" >> "$LOG_FILE"
}

log_error() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1"
    echo -e "${RED}[ERROR]${NC} $1"
    echo "$msg" >> "$LOG_FILE"
}

log_warning() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [WARNING] $1"
    echo -e "${YELLOW}[WARNING]${NC} $1"
    echo "$msg" >> "$LOG_FILE"
}

log_debug() {
    local msg="$(date '+%Y-%m-%d %H:%M:%S') [DEBUG] $1"
    echo -e "${BLUE}[DEBUG]${NC} $1"
    echo "$msg" >> "$LOG_FILE"
}

# Cleanup function to remove temporary files
cleanup() {
    log_info "Cleaning up temporary files..."
    rm -f "$BACKUP_FILE" "$CLEANED_FILE"
    
    # Keep log file for debugging
    log_info "Migration log saved to: $LOG_FILE"
}

# Set trap to ensure cleanup happens even if script fails
trap cleanup EXIT

# Validate SSH connection
validate_ssh_connection() {
    log_info "Validating SSH connection to NAS..."
    if ! ssh -o ConnectTimeout=10 root@$NAS_HOST "echo 'SSH connection successful'" >/dev/null 2>&1; then
        log_error "Cannot establish SSH connection to NAS at $NAS_HOST"
        log_error "Please check:"
        log_error "1. NAS is reachable at $NAS_HOST"
        log_error "2. SSH service is running on NAS"
        log_error "3. SSH keys are properly configured"
        exit 1
    fi
    log_info "SSH connection to NAS validated successfully"
}

# Validate database connections
validate_db_connections() {
    log_info "Validating database connections..."
    
    # Test NAS database connection
    if ! ssh root@$NAS_HOST "docker exec $NAS_CONTAINER pg_isready -U $NAS_USER -d $NAS_DB" >/dev/null 2>&1; then
        log_error "Cannot connect to NAS PostgreSQL database"
        exit 1
    fi
    
    # Test Cloud SQL connection
    export PGPASSWORD="$CLOUD_SQL_PASSWORD"
    if ! psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" -c "SELECT 1;" >/dev/null 2>&1; then
        log_error "Cannot connect to Cloud SQL database"
        log_error "Please check:"
        log_error "1. Cloud SQL is reachable at $CLOUD_SQL_IP"
        log_error "2. Database credentials are correct"
        log_error "3. Database $CLOUD_SQL_DB exists"
        exit 1
    fi
    
    log_info "Database connections validated successfully"
}

# Main migration process
main() {
    log_info "Starting database migration from NAS to Cloud SQL..."
    log_info "Migration log file: $LOG_FILE"
    
    # Validate required tools
    log_info "Validating required tools..."
    for tool in ssh psql pg_dump; do
        if ! command -v "$tool" &> /dev/null; then
            log_error "$tool command not found"
            exit 1
        fi
    done
    log_info "All required tools found"
    
    # Validate connections
    validate_ssh_connection
    validate_db_connections
    
    # Step 1: Dump database from NAS
    log_info "Dumping database from NAS PostgreSQL..."
    local start_time=$(date +%s)
    
    if ! ssh root@$NAS_HOST "docker exec $NAS_CONTAINER pg_dump -U $NAS_USER -d $NAS_DB --clean --if-exists --no-owner --no-acl" > "$BACKUP_FILE" 2>>"$LOG_FILE"; then
        log_error "Failed to dump database from NAS - check log for details"
        exit 1
    fi
    
    # Check if backup was successful
    if [ ! -s "$BACKUP_FILE" ]; then
        log_error "Backup file is empty or doesn't exist"
        exit 1
    fi
    
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    FILE_SIZE=$(ls -lh "$BACKUP_FILE" | awk '{print $5}')
    log_info "Database dump created successfully: $FILE_SIZE (took ${duration}s)"
    
    # Step 2: Clean backup for Cloud SQL compatibility
    log_info "Cleaning backup for Cloud SQL compatibility..."
    start_time=$(date +%s)
    
    # More comprehensive cleaning for Cloud SQL
    sed -e '/^\\connect/d' \
        -e '/^\\encoding/d' \
        -e '/^\\echo/d' \
        -e '/^\\set/d' \
        -e '/^\\unset/d' \
        -e '/DROP DATABASE/d' \
        -e '/CREATE DATABASE/d' \
        -e '/\\connect/d' \
        "$BACKUP_FILE" > "$CLEANED_FILE"
    
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    log_info "Backup cleaning completed (took ${duration}s)"
    
    # Step 3: Import to Cloud SQL
    log_info "Importing to Cloud SQL..."
    start_time=$(date +%s)
    
    export PGPASSWORD="$CLOUD_SQL_PASSWORD"
    if ! psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" -f "$CLEANED_FILE" >>"$LOG_FILE" 2>&1; then
        log_error "Failed to import to Cloud SQL - check log for details"
        exit 1
    fi
    
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    log_info "Database import completed successfully (took ${duration}s)"
    
    log_info "Database migration completed successfully!"
    log_info "Summary:"
    log_info "- Source: $NAS_HOST ($NAS_DB)"
    log_info "- Destination: $CLOUD_SQL_IP ($CLOUD_SQL_DB)"
    log_info "- Backup file: $FILE_SIZE"
    log_info "- Log file: $LOG_FILE"
}

# Run main function
main "$@"