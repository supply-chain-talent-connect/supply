#!/usr/bin/env bash
set -euo pipefail

# Configure GCS Interoperability (S3-compatible) for n8n binary data.
# Creates a dedicated service account, generates HMAC keys, stores them as secrets,
# and grants the Cloud Run runtime SA access to read those secrets.
#
# Usage:
#   scripts/setup-n8n-s3-gcs.sh \
#     --project supply-chain-talent-connect \
#     --region us-central1 \
#     --service n8n \
#     --bucket n8n-binary-data-supply-chain-talent-connect \
#     [--sa-id n8n-gcs-hmac]
#
# Requires: gcloud (with Secret Manager and Storage APIs enabled) and gsutil.

PROJECT=""
REGION="us-central1"
SERVICE="n8n"
BUCKET=""
SA_ID="n8n-gcs-hmac"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project) PROJECT="$2"; shift 2 ;;
    --region) REGION="$2"; shift 2 ;;
    --service) SERVICE="$2"; shift 2 ;;
    --bucket) BUCKET="$2"; shift 2 ;;
    --sa-id) SA_ID="$2"; shift 2 ;;
    *) echo "Unknown arg: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$PROJECT" ]]; then
  PROJECT=$(gcloud config get-value project 2>/dev/null || true)
fi
if [[ -z "$PROJECT" || -z "$BUCKET" ]]; then
  echo "Usage: $0 --project <id> --bucket <name> [--region <r>] [--service <name>] [--sa-id <id>]" >&2
  exit 1
fi

echo "Project     : ${PROJECT}"
echo "Region      : ${REGION}"
echo "Service     : ${SERVICE}"
echo "Bucket      : gs://${BUCKET}"
echo "HMAC SA ID  : ${SA_ID}"

echo "Ensuring service account exists..."
SA_EMAIL="${SA_ID}@${PROJECT}.iam.gserviceaccount.com"
if ! gcloud iam service-accounts describe "$SA_EMAIL" --project "$PROJECT" >/dev/null 2>&1; then
  gcloud iam service-accounts create "$SA_ID" --project "$PROJECT" --display-name "n8n GCS HMAC"
fi
echo "HMAC SA     : ${SA_EMAIL}"

echo "Granting Storage Object Admin on the bucket to HMAC SA..."
gcloud storage buckets add-iam-policy-binding "gs://${BUCKET}" \
  --member "serviceAccount:${SA_EMAIL}" \
  --role roles/storage.objectAdmin \
  --project "$PROJECT"

echo "Creating HMAC keys for SA (via gsutil)..."
ACCESS_KEY=""
SECRET_KEY=""
OUT=$(gsutil hmac create -p "$PROJECT" "$SA_EMAIL")
# Parse lines like:
# Access ID:   GOOG....
# Secret:      <secret>
ACCESS_KEY=$(echo "$OUT" | sed -n 's/^Access ID:[[:space:]]*\(.*\)$/\1/p')
SECRET_KEY=$(echo "$OUT" | sed -n 's/^Secret:[[:space:]]*\(.*\)$/\1/p')

if [[ -z "$ACCESS_KEY" || -z "$SECRET_KEY" ]]; then
  echo "Failed to create or parse HMAC keys" >&2
  exit 1
fi
echo "Access Key  : ${ACCESS_KEY}"
echo "Secret Key  : (hidden)"

echo "Creating/updating Secret Manager secrets..."
create_or_add_secret() {
  local NAME="$1"; shift
  local VALUE="$1"; shift
  if ! gcloud secrets describe "$NAME" --project "$PROJECT" >/dev/null 2>&1; then
    printf %s "$VALUE" | gcloud secrets create "$NAME" --project "$PROJECT" --data-file=- >/dev/null
    echo "Created secret $NAME"
  else
    printf %s "$VALUE" | gcloud secrets versions add "$NAME" --project "$PROJECT" --data-file=- >/dev/null
    echo "Added version to secret $NAME"
  fi
}

create_or_add_secret n8n-s3-access-key "$ACCESS_KEY"
create_or_add_secret n8n-s3-secret-key "$SECRET_KEY"

echo "Granting runtime SA access to the secrets..."
RUNTIME_SA=$(gcloud run services describe "$SERVICE" --region "$REGION" --project "$PROJECT" --format='value(spec.template.spec.serviceAccountName)' 2>/dev/null || true)
if [[ -z "$RUNTIME_SA" ]]; then
  PROJECT_NUMBER=$(gcloud projects describe "$PROJECT" --format='value(projectNumber)')
  RUNTIME_SA="${PROJECT_NUMBER}-compute@developer.gserviceaccount.com"
fi
for SECRET in n8n-s3-access-key n8n-s3-secret-key; do
  gcloud secrets add-iam-policy-binding "$SECRET" \
    --member "serviceAccount:${RUNTIME_SA}" \
    --role roles/secretmanager.secretAccessor \
    --project "$PROJECT" >/dev/null
done
echo "Runtime SA  : ${RUNTIME_SA} has access to S3 secrets"

echo "Done. Deploy with substitutions:"
echo "  gcloud builds submit --config deployments/n8n/cloudbuild.yaml \\
        --project ${PROJECT} --substitutions=_N8N_GCS_BUCKET=${BUCKET}"
