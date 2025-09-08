FROM pentacent/keila:latest

# Install socat to create a TCP bridge
USER root
RUN apk add --no-cache socat

# Create a startup script
COPY start-keila.sh /start-keila.sh
RUN chmod +x /start-keila.sh

# Switch back to app user if needed
USER app

ENTRYPOINT ["/start-keila.sh"]