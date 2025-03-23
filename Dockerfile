FROM n8nio/n8n:latest

# Install any additional dependencies if needed
# RUN npm install -g some-package

# Set execution permissions
USER root
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Switch back to node user for security
USER node

EXPOSE 5678

# The default command from the base image will be used
# CMD ["n8n", "start"]