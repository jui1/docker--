# Base image
FROM ubuntu:latest

# Non-interactive for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update, upgrade, install curl and Node.js + npm
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl nodejs npm build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependency files first for caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Optional: download something with curl
RUN curl -sL https://example.com -o /tmp/example.txt

# Expose port
EXPOSE 8080

# Start your app (updated)
CMD ["node", "main.js"]
