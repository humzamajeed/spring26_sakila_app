# ================================================
# Maintainer: Muhammad Humza Majeed
# Version: 1.0.0
# Description: Sakila Flask Application
# ================================================

FROM python:3.9-slim

# Add metadata labels
LABEL maintainer="YOUR_NAME"
LABEL version="1.0.0"
LABEL description="Sakila Flask Web Application"

# Set working directory
WORKDIR /app

# Create non-root user for security
RUN useradd -m -r appuser

# Copy requirements FIRST (before app code) to leverage Docker layer caching
COPY requirements.txt .

# Install all dependencies in a single RUN command
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the application code
COPY . .

# Set ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Only expose the Flask application port
EXPOSE 5000

# Health check to verify app is responding
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000')" || exit 1

# Environment variables WITHOUT sensitive values (passed at runtime)
ENV MYSQL_HOST=localhost
ENV MYSQL_USER=root
ENV MYSQL_DB=sakila

# Run the application
CMD ["python", "app.py"]
