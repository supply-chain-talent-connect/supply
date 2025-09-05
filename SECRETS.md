# Google Secret Manager - Secret Names

## Secrets Created

1. **db-password**
   - Database password for PostgreSQL
   - Used by: All Cloud Run services

2. **db-host** 
   - Database host IP address (35.232.243.95)
   - Used by: All Cloud Run services

## Usage in Cloud Run

Secrets are automatically injected as environment variables:
- DATABASE_PASSWORD (from db-password)
- DATABASE_HOST (from db-host)

## Commands to Access

```bash
# View secret value
gcloud secrets versions access latest --secret="db-password"

# List all secrets
gcloud secrets list

# Update a secret
echo -n 'new-value' | gcloud secrets versions add db-password --data-file=-
```

## Service Accounts

Cloud Run services automatically have access to these secrets via the default service account.