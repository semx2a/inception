#!/bin/bash

# This script is used to generate the environment file for the application

if [ -f ./src/.env ]; then
  echo "Environment file already exists"
  exit 1
else
  cp ./src/.env.example ./src/.env
  echo "Environment file created at ./src/.env"
fi
