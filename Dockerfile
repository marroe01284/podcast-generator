FROM ubuntu:latest

# Install Python and necessary tools
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Upgrade pip and install pyYAML within the virtual environment
RUN /opt/venv/bin/pip install --upgrade pip && /opt/venv/bin/pip install pyYAML

# Copy the feed.py script
COPY feed.py /usr/bin/feed.py

# Copy entrypoint.sh script
COPY entrypoint.sh /entrypoint.sh

# Set the virtual environment path in the PATH environment variable
ENV PATH="/opt/venv/bin:$PATH"

# Set entrypoint to the entrypoint.sh script
ENTRYPOINT ["/entrypoint.sh"]

