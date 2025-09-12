#!/bin/bash
set -e

export N8N_PORT="${PORT:-8080}"
# Harmonize execution mode for recent n8n versions:
# Prefer N8N_EXECUTIONS_MODE if provided; default to "regular".
if [ -n "${N8N_EXECUTIONS_MODE}" ]; then
  export EXECUTIONS_MODE="${N8N_EXECUTIONS_MODE}"
else
  export EXECUTIONS_MODE="regular"
fi

DB_TYPE_EFFECTIVE="${DB_TYPE:-${N8N_DATABASE_TYPE}}"

if [ -n "$N8N_ENCRYPTION_KEY" ]; then
  echo "Encryption key is set"
fi

echo "Starting n8n on port ${N8N_PORT}..."
echo "Public URL: ${N8N_PUBLIC_URL}"
echo "Webhook URL: ${WEBHOOK_URL}"
echo "Database type: ${DB_TYPE_EFFECTIVE}"
echo "Execution mode: ${EXECUTIONS_MODE}"

exec n8n start
