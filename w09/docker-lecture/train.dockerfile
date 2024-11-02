FROM python:3.10

WORKDIR /usr/local/app

# Install the application dependencies
COPY . .
RUN pip install -r requirements.txt

CMD ["python", "docker_lecture/modeling/train.py"]