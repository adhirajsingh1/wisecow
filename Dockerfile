FROM ubuntu:20.04

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    fortune cowsay netcat dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the script
COPY wisecow.sh .

# Fix line endings (Windows CRLF -> Unix LF)
RUN dos2unix wisecow.sh

# Make executable
RUN chmod +x wisecow.sh

# Expose port
EXPOSE 4499

# Start the application
CMD ["./wisecow.sh"]
