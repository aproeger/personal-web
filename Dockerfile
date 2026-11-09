# Stage 1: Build the Vue application
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package descriptors first to leverage layer caching
COPY package.json package-lock.json ./

RUN npm ci

# Copy source files
COPY . .

# Build production bundle (runs vue-tsc and vite build)
RUN npm run build

# Stage 2: Minimal static web server with Nginx
FROM nginx:alpine

# Copy optimized Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy compiled static files
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

