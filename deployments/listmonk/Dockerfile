FROM listmonk/listmonk:latest

# Install bash for better script compatibility
RUN apk add --no-cache bash

# Set working directory
WORKDIR /listmonk

# Copy the run script
COPY run.sh /listmonk/run.sh
RUN chmod +x /listmonk/run.sh

# Expose port
EXPOSE 9000

# Override entrypoint completely
ENTRYPOINT ["/bin/bash"]
CMD ["/listmonk/run.sh"]