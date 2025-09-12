-- Create/Update a dedicated Directus DB user and grant required privileges
-- Usage:
--   psql -h 127.0.0.1 -p 5432 -U postgres -d directus_db \
--     -v ON_ERROR_STOP=1 \
--     -v DIRECTUS_PASSWORD='your-strong-password' \
--     -f scripts/create-directus-db-user.sql

BEGIN;

-- Create role if missing, else update its password
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'directus_user') THEN
    CREATE ROLE directus_user LOGIN PASSWORD :'DIRECTUS_PASSWORD';
  ELSE
    RAISE NOTICE 'Role directus_user already exists; updating password.';
    ALTER ROLE directus_user WITH LOGIN PASSWORD :'DIRECTUS_PASSWORD';
  END IF;
END$$;

-- Ensure the user can connect to this database
GRANT CONNECT ON DATABASE current_database() TO directus_user;

-- Schema-level privileges (Directus uses the public schema by default)
GRANT USAGE, CREATE ON SCHEMA public TO directus_user;

-- Object privileges on existing objects
GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public TO directus_user;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO directus_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO directus_user;

-- Default privileges for future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER ON TABLES TO directus_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO directus_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO directus_user;

-- Optional but recommended if this DB is dedicated to Directus:
-- make directus_user the owner of the public schema and all its objects
ALTER SCHEMA public OWNER TO directus_user;

DO $$
DECLARE
  r RECORD;
BEGIN
  -- Transfer ownership of tables, views, materialized views, foreign tables
  FOR r IN
    SELECT quote_ident(n.nspname) AS nsp, quote_ident(c.relname) AS rel, c.relkind
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname = 'public' AND c.relkind IN ('r','p','v','m','f')
  LOOP
    EXECUTE format('ALTER TABLE %s.%s OWNER TO directus_user', r.nsp, r.rel);
  END LOOP;

  -- Transfer ownership of sequences
  FOR r IN
    SELECT quote_ident(n.nspname) AS nsp, quote_ident(c.relname) AS rel
    FROM pg_class c
    JOIN pg_namespace n ON n.oid = c.relnamespace
    WHERE n.nspname = 'public' AND c.relkind = 'S'
  LOOP
    EXECUTE format('ALTER SEQUENCE %s.%s OWNER TO directus_user', r.nsp, r.rel);
  END LOOP;
END$$;

COMMIT;

