# Backend Dockerfile (Python 3.13)
FROM python:3.13-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv for package management
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# 1. Copy only dependency files first to leverage Docker cache
COPY pyproject.toml uv.lock* ./

# 2. Install dependencies before copying the rest of the app
RUN uv sync --frozen

# Use the virtual environment created by uv
ENV PATH="/app/.venv/bin:$PATH"

# 3. Copy the rest of the application code
COPY app/ ./app/

# Expose Django port
EXPOSE 8000

# Run the Django development server
CMD ["python", "app/finance/manage.py", "runserver", "0.0.0.0:8000"]
