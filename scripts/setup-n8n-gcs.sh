#!/usr/bin/env bash
set -euo pipefail

# Setup a GCS bucket for n8n binary data and grant Cloud Run runtime SA access.
#
# Usage:
#   scripts/setup-n8n-gcs.sh \
#     --project supply-chain-talent-connect \
#     --region us-central1 \
#     --service n8n \
#     --bucket n8n-binary-data
#
# Flags (all optional; script will try to auto-detect sensible defaults):
#   --project   GCP project ID (defaults to `gcloud config get-value project`)
#   --region    Cloud Run region for the service (default: us-central1)
#   --service   Cloud Run service name (default: n8n)
#   --bucket    GCS bucket name (default: n8n-binary-data-<project>)

PROJECT=""
REGION="us-central1"
SERVICE="n8n"
BUCKET=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      PROJECT="$2"; shift; shift ;;
    --region)
      REGION="$2"; shift; shift ;;
    --service)
      SERVICE="$2"; shift; shift ;;
    --bucket)
      BUCKET="$2"; shift; shift ;;
    *)
      echo "Unknown argument: $1" >&2; exit 1 ;;
  esac
done

if [[ -z "$PROJECT" ]]; then
  PROJECT=$(gcloud config get-value project 2>/dev/null || true)
fi
if [[ -z "$PROJECT" ]]; then
  echo "--project not provided and no default set via gcloud config" >&2
  exit 1
fi

if [[ -z "$BUCKET" ]]; then
  BUCKET="n8n-binary-data-${PROJECT}"
fi

echo "Project     : ${PROJECT}"
echo "Region      : ${REGION}"
echo "Service     : ${SERVICE}"
echo "Bucket      : gs://${BUCKET}"

echo "Discovering Cloud Run runtime service account..."
RUNTIME_SA=$(gcloud run services describe "$SERVICE" \
  --region "$REGION" --project "$PROJECT" \
  --format='value(spec.template.spec.serviceAccountName)' 2>/dev/null || true)

if [[ -z "$RUNTIME_SA" ]]; then
  echo "Service account not explicitly set on service. Falling back to default Compute Engine SA"
  PROJECT_NUMBER=$(gcloud projects describe "$PROJECT" --format='value(projectNumber)')
  RUNTIME_SA="${PROJECT_NUMBER}-compute@developer.gserviceaccount.com"
fi

echo "Runtime SA  : ${RUNTIME_SA}"

echo "Creating bucket if it does not exist..."
if gcloud storage buckets describe "gs://${BUCKET}" --project "$PROJECT" >/dev/null 2>&1; then
  echo "Bucket already exists: gs://${BUCKET}"
else
  gcloud storage buckets create "gs://${BUCKET}" \
    --project "$PROJECT" \
    --location "$REGION" \
    --uniform-bucket-level-access
  echo "Created bucket: gs://${BUCKET}"
fi

echo "Granting Storage Object Admin on the bucket to the runtime SA..."
gcloud storage buckets add-iam-policy-binding "gs://${BUCKET}" \
  --member "serviceAccount:${RUNTIME_SA}" \
  --role roles/storage.objectAdmin \
  --project "$PROJECT"

echo "Verifying IAM binding..."
gcloud storage buckets get-iam-policy "gs://${BUCKET}" --project "$PROJECT" \
  --format="table(bindings.role, bindings.members)" | sed 's/^/  /'

echo "Done. Next steps:"
echo "  1) Deploy n8n with bucket mount:"
echo "     gcloud builds submit --config deployments/n8n/cloudbuild.yaml \\
           --project ${PROJECT} --substitutions=_N8N_GCS_BUCKET=${BUCKET}"
echo "  2) Confirm Cloud Run revision becomes Ready and that uploads appear in gs://${BUCKET}"

