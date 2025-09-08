FROM ghost:5-alpine

# Install Cloud SQL proxy client
RUN apk add --no-cache mysql-client

# Set environment to production
ENV NODE_ENV=production

# Expose Ghost port
EXPOSE 2368

# Use a custom entrypoint that waits for DB
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["node", "current/index.js"]