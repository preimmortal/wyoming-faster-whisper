FROM python:3.11-slim-bookworm

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

WORKDIR /app

COPY script/setup ./script/
COPY setup.py requirements.txt MANIFEST.in ./
COPY wyoming_faster_whisper/ ./wyoming_faster_whisper/

RUN script/setup

COPY script/run ./script/
COPY docker/run ./

EXPOSE 10300

ENTRYPOINT ["/app/run"]
