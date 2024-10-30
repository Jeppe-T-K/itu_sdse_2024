FROM python:3.9

WORKDIR /usr/local/app

# Install the application dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy in the source code
COPY src ./src

# Setup an app user so the container doesn't run as the root user
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]