# Frontend Dockerfile (Next.js 16 - Development)
FROM node:20-slim

# Install pnpm
RUN corepack enable && corepack prepare pnpm@11.21.0 --activate

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml* pnpm-workspace.yaml* ./

# Install dependencies
RUN pnpm install

# Copy project source
COPY . .

# Expose Next.js port
EXPOSE 3000

# Use development server for hot-reloading
CMD ["pnpm", "dev"]
