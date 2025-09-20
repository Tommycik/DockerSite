
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone your repo (replace with your repo URL)
RUN git clone https://github.com/Tommycik/appTesi

# Install dependencies (initial layer)
RUN cd appTesi && pip install --no-cache-dir -r requirements.txt

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8000

# Always run startup script
CMD ["/start.sh"]