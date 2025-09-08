#!/bin/bash

echo "Deploying Keila to NAS..."

# SSH into NAS and deploy Keila
ssh brad@10.0.20.3 << 'EOF'
# Create directory for Keila
mkdir -p ~/keila
cd ~/keila

# Create docker-compose file
cat > docker-compose.yml << 'COMPOSE'
version: '3.8'

services:
  keila:
    image: pentacent/keila:latest
    container_name: keila
    ports:
      - "4000:4000"
    environment:
      DB_URL: "postgres://magicsocial_user:tnd6xpw0byg.ytd4DJW@10.0.20.3:5432/keila_db"
      SECRET_KEY_BASE: "0ylCinlELkQ0+uCNmrHkYnqiF1TawGam1hHWhsNCsXv7zycgl/eUm4y7la/0ZAfW"
      URL_HOST: "10.0.20.3:4000"
      URL_SCHEMA: "http"
      KEILA_USER: "brad.a.johnson@gmail.com"
      KEILA_PASSWORD: "ihOCzCzTzN44zqF7neUI42Dk"
      MAILER_SMTP_HOST: "smtp.resend.com"
      MAILER_SMTP_PORT: "465"
      MAILER_SMTP_FROM_EMAIL: "hello@magicsocial.ai"
      MAILER_SMTP_USER: "resend"
      MAILER_SMTP_PASSWORD: "re_fENTfZtD_FY5iKSHrAkiF58nTh1CTADfU"
      MAILER_ENABLE_SSL: "true"
      DISABLE_REGISTRATION: "false"
    volumes:
      - /mnt/user/appdata/keila/uploads:/opt/app/uploads
    restart: unless-stopped
COMPOSE

# Stop existing container if running
docker stop keila 2>/dev/null || true
docker rm keila 2>/dev/null || true

# Pull latest image and start
docker-compose pull
docker-compose up -d

# Check status
sleep 5
docker ps | grep keila
echo "Keila should be accessible at http://10.0.20.3:4000"
EOF

echo "Deployment complete!"