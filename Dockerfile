FROM python:3.12.7-bullseye

WORKDIR /app

# Copy just requirements to build dependencies 
COPY requirements.txt .

# Install the dependencies
RUN pip install -U pip wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Add a run script to the PATH
RUN echo 'gunicorn -b :8000 -k uvicorn.workers.UvicornWorker api:app' > /bin/serve-api && \
    chmod +x /bin/serve-api

# Run the API
CMD exec gunicorn --bind :$PORT --timeout 0 --worker-class uvicorn_worker.UvicornWorker api:app
