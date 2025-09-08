#!/bin/sh
set -e

# Wait for database to be ready
echo "Waiting for database..."
until mysql -h"$database__connection__host" -u"$database__connection__user" -p"$database__connection__password" -e "SELECT 1" >/dev/null 2>&1; do
  echo "Database is unavailable - sleeping"
  sleep 2
done

echo "Database is up - starting Ghost"

# Run the original Ghost entrypoint
exec docker-entrypoint.sh "$@"