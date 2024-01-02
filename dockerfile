FROM python:3.8

WORKDIR /app

COPY echo_server.py .
COPY index.html .

CMD ["python", "echo_server.py"]
