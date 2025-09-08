# Database Management Scripts

This directory contains scripts for managing database backups and migrations between NAS PostgreSQL and Google Cloud SQL.

## Prerequisites

- SSH access to NAS (10.0.20.3)
- PostgreSQL client tools (`psql`, `pg_dump`)
- Google Cloud SDK (`gcloud`, `gsutil`)
- Proper credentials in `.env.local`

## Configuration

Create a `.env.local` file in the project root with:

```bash
# NAS PostgreSQL
NAS_HOST=10.0.20.3
NAS_DB=directus
NAS_USER=magicsocial_user
NAS_CONTAINER=postgresql15

# Google Cloud SQL
CLOUD_SQL_INSTANCE=supply-postgres-micro
CLOUD_SQL_DB=directus_db
CLOUD_SQL_USER=postgres
CLOUD_SQL_PASSWORD=your_password
CLOUD_SQL_IP=35.232.243.95

# Google Cloud Storage
GCS_BUCKET=supply-configs-private
GCS_PATH=database-backups
```

## Scripts

### 1. `db-backup.sh` - Database Backup

Creates backups from NAS PostgreSQL and stores them locally and in Cloud Storage.

**Usage:**
```bash
# Full backup (schema + data)
./scripts/db-backup.sh full

# Schema only
./scripts/db-backup.sh schema

# Data only
./scripts/db-backup.sh data
```

**Features:**
- Automatic PostgreSQL 15 command cleanup for Cloud SQL compatibility
- Upload to Google Cloud Storage
- Local backup retention (7 days)
- Timestamped backups

**Output:**
- Local: `backups/directus-{type}-{timestamp}.sql`
- Cloud: `gs://supply-configs-private/database-backups/`

### 2. `db-migrate-to-cloud.sh` - Full Migration

Migrates entire database from NAS to Cloud SQL.

**Usage:**
```bash
# Fresh migration (drops existing data)
./scripts/db-migrate-to-cloud.sh --clean

# Incremental migration (preserves existing)
./scripts/db-migrate-to-cloud.sh
```

**Process:**
1. Creates backup from NAS
2. Cleans PostgreSQL 15 specific commands
3. Uploads to Cloud Storage
4. Enables PostGIS in Cloud SQL
5. Imports data
6. Verifies migration

**Important:** The `--clean` flag will DROP all existing data in Cloud SQL!

### 3. `db-sync.sh` - Data Synchronization

Quick data synchronization between NAS and Cloud SQL.

**Usage:**
```bash
# Sync all tables
./scripts/db-sync.sh --full

# Sync specific table
./scripts/db-sync.sh --table Map_Cities

# Verify record counts
./scripts/db-sync.sh --verify

# Quick sync (critical tables only)
./scripts/db-sync.sh
```

**Tables synced (in order):**
- Directus system tables
- Company and translations
- Hero and translations
- Navigation and translations
- Trust logos and images
- Map_Cities (with PostGIS geometry)
- Map animations

## Database Details

### NAS PostgreSQL
- Host: 10.0.20.3
- Container: postgresql15
- Database: directus
- Version: PostgreSQL 15.14
- PostGIS: 3.6

### Google Cloud SQL
- Instance: supply-postgres-micro
- Database: directus_db
- Version: PostgreSQL 15
- PostGIS: 3.5
- IP: 35.232.243.95

## Common Tasks

### Daily Backup
```bash
# Add to crontab for daily 2 AM backup
0 2 * * * /home/brad/projects/supply/scripts/db-backup.sh full
```

### Restore from Backup
```bash
# 1. Find backup file
ls -la backups/

# 2. Import to Cloud SQL
export PGPASSWORD="your_password"
psql -h 35.232.243.95 -U postgres -d directus_db -f backups/directus-full-cleaned.sql
```

### Check Migration Status
```bash
# Verify data in Cloud SQL
./scripts/db-sync.sh --verify
```

## Troubleshooting

### Import Errors
- **"invalid command \restrict"**: Use cleaned backup files (*-cleaned.sql)
- **"permission denied"**: Check Cloud SQL user permissions
- **"geometry type does not exist"**: Enable PostGIS extension first

### PostGIS Issues
```sql
-- Enable PostGIS in Cloud SQL
CREATE EXTENSION IF NOT EXISTS postgis;

-- Check version
SELECT postgis_version();
```

### Connection Issues
```bash
# Test NAS connection
ssh root@10.0.20.3 "docker exec postgresql15 psql -U magicsocial_user -d directus -c 'SELECT 1'"

# Test Cloud SQL connection
PGPASSWORD="your_password" psql -h 35.232.243.95 -U postgres -d directus_db -c "SELECT 1"
```

## Data Overview

Current database contains:
- 46 tables total
- 124 cities with geometry coordinates
- 4 hero translations (en, fr, de, es)
- 7 navigation items
- Company configuration
- Trust logos setup
- Map animation configurations

## Security Notes

- `.env.local` is gitignored - never commit credentials
- Use strong passwords for Cloud SQL
- Restrict Cloud SQL access to necessary IPs only
- Regular backups to Cloud Storage
- Test restore procedures periodically