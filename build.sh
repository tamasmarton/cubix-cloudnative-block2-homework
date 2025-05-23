#!/bin/bash

set -e

echo "=== Running Maven build for frontapp ==="
docker run --rm -v "$PWD/frontapp":/app -w /app maven:3.9-eclipse-temurin-21 ./mvnw clean verify

echo "=== Running Maven build for backapp ==="
docker run --rm -v "$PWD/backapp":/app -w /app maven:3.9-eclipse-temurin-21 ./mvnw clean verify

echo "=== Building Docker image: frontapp ==="
docker build -t frontapp-img -f ./Dockerfile ./frontapp

echo "=== Building Docker image: backapp ==="
docker build -t backapp-img -f ./Dockerfile ./backapp

echo "=== Verifying image labels ==="

echo "- frontapp:"
docker inspect frontapp-img | grep cubix.homework.owner

echo "- backapp:"
docker inspect backapp-img | grep cubix.homework.owner

echo "=== Done ==="