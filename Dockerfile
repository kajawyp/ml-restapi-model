FROM python:3.11-slim-buster as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

FROM python:3.11-slim-buster

WORKDIR /app

COPY --from=builder /usr/local /usr/local

COPY app.py .

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=8000

EXPOSE 8000

CMD ["flask", "run"]
