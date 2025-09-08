#!/bin/bash
source /home/brad/google-cloud-sdk/path.bash.inc
PW=$(gcloud secrets versions access latest --secret=db-password --project=supply-chain-talent-connect)
echo -n "postgresql://postgres:${PW}@/umami_db?host=/cloudsql/supply-chain-talent-connect:us-central1:supply-postgres-micro" | gcloud secrets versions add umami-database-url --data-file=- --project=supply-chain-talent-connect