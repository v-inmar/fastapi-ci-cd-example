# Dockerfile

# Stage 1: Build the wheel for our app, this ensures all dependencies are present
# Use an official Python runtime as a parent image
FROM python:3.13-slim-bookworm AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose port 8000 for the FastAPI application
EXPOSE 8000

# Command to run the FastAPI application with Uvicorn
# This will be the default command executed when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]