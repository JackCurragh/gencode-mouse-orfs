# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Install RiboSeq-DP-Tools from PyPI
RUN pip install RiboSeq-DP-Tools
