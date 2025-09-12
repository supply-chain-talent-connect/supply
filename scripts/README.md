# Database Migration Scripts

This directory contains scripts for migrating data between different database environments.

## Available Scripts

### migrate-db-simple.sh
A simplified, robust migration script that:
- Dumps the entire database from NAS PostgreSQL
- Cleans the dump for Cloud SQL compatibility
- Imports the data to Cloud SQL

Usage:
```bash
chmod +x migrate-db-simple.sh
./migrate-db-simple.sh
```

### migrate-data-only.sh
Migrates only data (not schema) from NAS PostgreSQL to Cloud SQL. Useful for incremental updates.

Usage:
```bash
chmod +x migrate-data-only.sh
./migrate-data-only.sh
```

### migrate-schema-only.sh
Migrates only schema (not data) from NAS PostgreSQL to Cloud SQL. Useful for structure changes.

Usage:
```bash
chmod +x migrate-schema-only.sh
./migrate-schema-only.sh
```

## Configuration

All scripts use environment variables that can be set in your shell or a .env file:
- NAS_HOST: IP address of the NAS server (default: 10.0.20.3)
- NAS_DB: Database name on NAS (default: directus)
- NAS_USER: Username for NAS database (default: magicsocial_user)
- NAS_CONTAINER: Docker container name for PostgreSQL on NAS (default: postgresql15)
- CLOUD_SQL_IP: IP address of Cloud SQL instance (default: 10.0.20.10)
- CLOUD_SQL_DB: Database name on Cloud SQL (default: directus)
- CLOUD_SQL_USER: Username for Cloud SQL (default: directus_user)
- CLOUD_SQL_PASSWORD: Password for Cloud SQL user

## Prerequisites

- SSH access to the NAS server
- PostgreSQL client tools (psql, pg_dump) installed locally
- Network connectivity to both NAS and Cloud SQL instances