#!/bin/bash

# Database Sync Script - Quick data synchronization
# Syncs data from NAS to Cloud SQL (preserves schema, updates data only)

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
CLOUD_SQL_IP="${CLOUD_SQL_IP:-35.232.243.95}"
CLOUD_SQL_DB="${CLOUD_SQL_DB:-directus_db}"
CLOUD_SQL_USER="${CLOUD_SQL_USER:-postgres}"
CLOUD_SQL_PASSWORD="${CLOUD_SQL_PASSWORD:-REDACTED_PASSWORD}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Functions
log_info() { echo -e "${GREEN}[INFO]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_step() { echo -e "${BLUE}[STEP]${NC} $1"; }

# Tables to sync (in order to handle foreign keys)
SYNC_TABLES=(
    "directus_roles"
    "directus_users"
    "directus_folders"
    "directus_files"
    "company"
    "company_translations"
    "hero"
    "hero_translations"
    "navigation"
    "navigation_translations"
    "\"Trust_Logos\""
    "\"Trust_Logos_translations\""
    "\"Trust_Logo_Images\""
    "\"Trust_Logo_Images_translations\""
    "\"Map_Cities\""
    "map_animation"
    "\"map_animation_Map_Cities\""
)

# Quick sync mode (specific tables only)
quick_sync() {
    local table=$1
    log_info "Syncing table: $table"
    
    # Export data from NAS
    local export_file="$BACKUP_DIR/sync-${table//\"}-$TIMESTAMP.sql"
    ssh root@$NAS_HOST "docker exec $NAS_CONTAINER pg_dump -U $NAS_USER -d $NAS_DB \
        --no-owner --no-acl --data-only --disable-triggers \
        -t $table" > "$export_file" 2>/dev/null
    
    if [ ! -s "$export_file" ]; then
        log_warning "No data found for table $table"
        rm -f "$export_file"
        return
    fi
    
    # Clean the export
    sed -i '/^\\restrict/d; /^\\unrestrict/d; /^\\connect/d' "$export_file"
    
    # Truncate and import to Cloud SQL
    PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -c "TRUNCATE TABLE $table CASCADE;" 2>/dev/null || true
    
    PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -f "$export_file" > /dev/null 2>&1
    
    # Get record count
    local count=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
        -t -c "SELECT COUNT(*) FROM $table;" 2>/dev/null | xargs || echo "0")
    
    log_info "  → Synced $count records"
    
    # Clean up
    rm -f "$export_file"
}

# Full sync (all tables)
full_sync() {
    log_step "Starting full data sync..."
    
    for table in "${SYNC_TABLES[@]}"; do
        quick_sync "$table"
    done
}

# Verify sync
verify_sync() {
    log_step "Verifying sync..."
    
    echo -e "\n${GREEN}Record counts in Cloud SQL:${NC}"
    
    for table in "${SYNC_TABLES[@]}"; do
        local count=$(PGPASSWORD="$CLOUD_SQL_PASSWORD" psql -h "$CLOUD_SQL_IP" -U "$CLOUD_SQL_USER" -d "$CLOUD_SQL_DB" \
            -t -c "SELECT COUNT(*) FROM $table;" 2>/dev/null | xargs || echo "0")
        printf "  %-30s %s records\n" "$table:" "$count"
    done
}

# Usage information
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --full          Sync all tables"
    echo "  --table TABLE   Sync specific table"
    echo "  --verify        Verify record counts only"
    echo "  --help          Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 --full                    # Sync all tables"
    echo "  $0 --table Map_Cities        # Sync only Map_Cities table"
    echo "  $0 --verify                  # Check record counts"
}

# Main execution
main() {
    echo -e "${GREEN}=== Database Sync: NAS → Cloud SQL ===${NC}\n"
    
    case "$1" in
        --full)
            full_sync
            verify_sync
            ;;
        --table)
            if [ -z "$2" ]; then
                log_error "Table name required"
                usage
                exit 1
            fi
            quick_sync "$2"
            ;;
        --verify)
            verify_sync
            ;;
        --help)
            usage
            exit 0
            ;;
        *)
            # Default: sync important tables
            log_step "Syncing critical tables..."
            quick_sync "\"Map_Cities\""
            quick_sync "hero_translations"
            quick_sync "navigation"
            quick_sync "company"
            verify_sync
            ;;
    esac
    
    echo -e "\n${GREEN}=== Sync Complete ===${NC}"
}

# Check prerequisites
if ! command -v psql &> /dev/null; then
    log_error "psql is not installed"
    exit 1
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Run main
main "$@"