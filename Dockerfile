# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory to /app
WORKDIR /app

# Install RiboSeq-DP-Tools from PyPI
RUN pip install pandas==1.5.2 psite
