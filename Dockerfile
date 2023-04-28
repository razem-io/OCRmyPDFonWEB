FROM python:3.11.3-slim-buster

RUN apt-get update \
    && apt install tesseract-ocr ghostscript pngquant -y \
    && apt-get clean

run mkdir /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt && rm requirements.txt

COPY server.py /app/server.py

ENTRYPOINT ["streamlit", "run", "server.py"]
