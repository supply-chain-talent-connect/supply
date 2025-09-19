# Security Configuration Guide

## Important Security Notice

This repository has been cleaned of sensitive credentials. All passwords, API keys, and other sensitive data have been removed from both current files and git history.

## Configuration Files

### Docker Compose Files

Never commit `docker-compose.local.yml` files with hardcoded credentials. Instead:

1. Use the `docker-compose.local.yml.template` file as a starting point
2. Copy it to `docker-compose.local.yml`
3. Create a `.env` file with your actual credentials (see `.env.example`)
4. The `.env` file is gitignored and will never be committed

### Environment Variables

All sensitive configuration should be stored in environment variables:

- Database passwords
- API keys
- Admin credentials
- Service account keys

### Required Environment Variables

For Directus deployment:
- `DB_USER` - Database username
- `DB_PASSWORD` - Database password (NEVER hardcode!)
- `ADMIN_EMAIL` - Admin email address
- `ADMIN_PASSWORD` - Admin password (NEVER hardcode!)
- `DIRECTUS_KEY` - Directus security key (generate with: openssl rand -hex 32)
- `DIRECTUS_SECRET` - Directus secret (generate with: openssl rand -hex 32)

For database scripts:
- `CLOUD_SQL_PASSWORD` - Cloud SQL password (required, no default)

## Best Practices

1. **Never commit credentials** - Always use environment variables
2. **Use .env files locally** - These are gitignored by default
3. **Generate new keys** - Don't reuse keys from examples
4. **Rotate credentials regularly** - Especially after any potential exposure
5. **Check before committing** - Review your changes for any sensitive data

## Files in .gitignore

The following patterns are ignored to prevent accidental credential commits:
- `*.env*` - All environment files
- `deployments/*/docker-compose.local.yml` - Local docker compose files
- `*-key.json` - Service account key files
- `*credentials*.json` - Credential files
- `*service-account*.json` - Service account files

## What to Do After Cloning

1. Copy template files:
   ```bash
   cp deployments/directus/docker-compose.local.yml.template deployments/directus/docker-compose.local.yml
   ```

2. Create your `.env` file:
   ```bash
   cp deployments/directus/.env.example deployments/directus/.env
   ```

3. Edit the `.env` file with your actual credentials

4. Generate new security keys:
   ```bash
   openssl rand -hex 32  # For DIRECTUS_KEY
   openssl rand -hex 32  # For DIRECTUS_SECRET
   ```

## Emergency Response

If credentials are accidentally committed:

1. Immediately rotate all affected credentials
2. Remove the file from the repository
3. Clean git history using git-filter-repo
4. Force push the cleaned history
5. Notify all team members to re-clone the repository

## Security Audit Checklist

- [ ] No passwords in code files
- [ ] No API keys in configuration files
- [ ] All sensitive files in .gitignore
- [ ] Environment variables used for all secrets
- [ ] Template files provided for configuration
- [ ] README includes security guidelines