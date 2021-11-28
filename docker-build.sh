#!/usr/bin/env bash

if mvn clean package; then
  docker build --build-arg JAR_FILE=./target/mjs-backend-0.0.1-SNAPSHOT.jar -t rimvanvliet/mjs-backend:latest .
  docker push rimvanvliet/mjs-backend:latest
else
  echo mvn clean package FAILED!!!
fi

