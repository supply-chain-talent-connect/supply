# Build stage
FROM node:20-alpine as builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --legacy-peer-deps

# Copy source code
COPY . .

# Inject build-time Directus URL for Vite
ARG VITE_DIRECTUS_URL
ENV VITE_DIRECTUS_URL=$VITE_DIRECTUS_URL

# Generate Prisma client
RUN npx prisma generate

# Build the app
RUN npm run build

# Production stage
FROM node:20-alpine

WORKDIR /app

# Install serve globally
RUN npm install -g serve

# Copy built assets from builder stage
COPY --from=builder /app/dist ./dist

# Copy locales for i18n
COPY --from=builder /app/public/locales ./dist/locales

EXPOSE 3000

# Use serve to run the app on port 3000
CMD ["serve", "-s", "dist", "-l", "3000"]