# Pin to a stable n8n version to avoid breaking changes in `latest`.
# Update deliberately after testing.
# Known-good baseline for current config (no task runners):
FROM n8nio/n8n:1.67.1

USER root

RUN apk add --no-cache bash curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER node

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
