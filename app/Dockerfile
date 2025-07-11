# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy source code
COPY app.py .

# Expose port
EXPOSE 5000

# Start the app
CMD ["python", "app.py"]
