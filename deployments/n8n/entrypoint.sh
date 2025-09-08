#!/bin/bash
set -e

export N8N_PORT=${PORT:-8080}
export EXECUTIONS_MODE=${EXECUTIONS_MODE:-main}

if [ -n "$N8N_ENCRYPTION_KEY" ]; then
  echo "Encryption key is set"
fi

echo "Starting n8n on port ${N8N_PORT}..."
echo "Public URL: ${N8N_PUBLIC_URL}"
echo "Database: ${N8N_DATABASE_TYPE}"
echo "Execution mode: ${EXECUTIONS_MODE}"

exec n8n start