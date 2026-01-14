# Use the official Ubuntu base image (e.g., 22.04, 24.04, etc.)
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install the postgresql-client package
RUN apt-get update && apt-get install -y postgresql-client iputils-ping \
    && rm -rf /var/lib/apt/lists/*

