# -- Builder Stage --
FROM python:3.11-slim as builder

WORKDIR /app

# Install system build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install python dependencies into a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY pyproject.toml README.md ./
# We install dependencies via pip. The 'mrds' package is installed in standard mode (not editable)
RUN pip install --no-cache-dir --upgrade pip setuptools && \
    pip install --no-cache-dir .

# -- Runner Stage --
FROM python:3.11-slim as runner

# Production optimizations
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PATH="/opt/venv/bin:$PATH" \
    PORT=8000

WORKDIR /app

# Install runtime dependencies (e.g., curl for healthcheck)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and group
RUN groupadd -r mrds_group && useradd -r -g mrds_group mrds_user \
    && chown -R mrds_user:mrds_group /app

# Copy the virtual environment from the builder stage
COPY --from=builder --chown=mrds_user:mrds_group /opt/venv /opt/venv

# Copy the application code
COPY --chown=mrds_user:mrds_group . .

# Switch to non-root user
USER mrds_user

# Expose API port
EXPOSE 8000

# Healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Default command to start the FastAPI server
CMD uvicorn mrds.presentation.api.main:app --host 0.0.0.0 --port $PORT
