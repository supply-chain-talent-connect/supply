FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache bash curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER node

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]