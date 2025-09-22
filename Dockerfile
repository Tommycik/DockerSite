
FROM pytorch/pytorch:2.3.1-cuda12.1-cudnn8-runtime

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    dos2unix \
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
RUN pip install --upgrade pip setuptools wheel
# Install dependencies (initial layer)
RUN cd appTesi && cat requirements.txt &&\
    pip install --no-cache-dir -r requirements.txt

# Copy startup script
COPY start.sh /start.sh
RUN dos2unix /start.sh
RUN chmod +x /start.sh

EXPOSE 8000

# Always run startup script
CMD ["/start.sh"]