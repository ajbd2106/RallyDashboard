# syntax=docker/dockerfile:1

ARG IMAGE_VARIANT=slim-buster
ARG OPENJDK_VERSION=8
ARG PYTHON_VERSION=3.9.5

FROM python:${PYTHON_VERSION}-${IMAGE_VARIANT} AS py3
FROM openjdk:${OPENJDK_VERSION}-${IMAGE_VARIANT}

COPY --from=py3 / /

ARG PYSPARK_VERSION=3.1.2
RUN pip --no-cache-dir install pyspark==${PYSPARK_VERSION}

# Setting Home Directory for containers
WORKDIR /app

# Installing python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copying src code to Container
COPY . .

# Application Environment variables
ENV APP_ENV development

# Exposing Ports
EXPOSE 5035

# Setting Persistent data
VOLUME ["/app-data"]

CMD [ "python3", "-m" , "main"]
