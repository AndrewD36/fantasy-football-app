# 1  Base image
FROM python:3.12-slim

# 2  Env flags
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3  Workdir inside container
WORKDIR /app

# 4  Install deps first (layer cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5  Copy project code
COPY . .

# 6  Expose port (doc only)
EXPOSE 8000

# 7  Default command
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:${PORT:-8000}"]