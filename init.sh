#!/bin/bash
set -e

# Generate SSH host keys if they don't exist
ssh-keygen -A

# Start SSH daemon
/usr/sbin/sshd

# Start Next.js application
npm start
