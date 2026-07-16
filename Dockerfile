FROM python:3.10-slim

WORKDIR /app

# Install system compilation tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first
COPY requirements.txt ./

# Install python dependencies cleanly
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source files last (protected by .dockerignore)
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
