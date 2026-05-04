# Use the official Node.js image.
FROM node:20-alpine

# Install OpenSSH
RUN apk add --no-cache openssh-server bash

# Set up SSH
# Create the SSH run directory
RUN mkdir -p /var/run/sshd
# Set root password to 'Docker!' for Azure App Service custom container SSH
RUN echo "root:Docker!" | chpasswd
# Copy sshd_config
COPY sshd_config /etc/ssh/

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy rest of the application
COPY . .

# Build Next.js application
RUN npm run build

# Copy and configure the init script
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Expose ports
# 3000 for Next.js, 2222 for SSH
EXPOSE 3000 2222

# Start using the init script
CMD ["/init.sh"]
