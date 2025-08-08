FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt
COPY flask/ /app/

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
