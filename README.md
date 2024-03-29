# Inception

This project was a comprehensive exercise in System Administration, particularly focusing on Docker and containerization.

## Project Overview

The primary objective of this project was to set up a small infrastructure composed of different services, each running in a dedicated Docker container. The project was entirely carried out in a container, using docker-compose.

## Skills and Knowledge Gained

This project required a deep understanding of Docker usage and system administration concepts. Key skills and knowledge gained during this project include:

- Creating and managing Docker images and containers
- Writing Dockerfiles for each service
- Understanding and implementing Docker volumes and networks
- Ensuring container stability and managing crash recovery
- Configuring a domain name to point to a local IP address
- Adhering to security best practices, such as not storing passwords in Dockerfiles

## Project Details

The infrastructure set up as part of this project included:

- A Docker container running NGINX with TLSv1.2 or TLSv1.3 only
- A Docker container running WordPress + php-fpm, installed and configured without NGINX
- A Docker container running MariaDB without NGINX
- A Docker volume containing the WordPress database
- A second Docker volume containing WordPress website files
- A docker-network to establish the connection between containers


<p align="center">
  <img src="./.img/inception.png" alt="Inception" width="600">
</p>

## Usage

Before running the project, ensure that Docker and Docker Compose are installed on your system.

Run the following command to copy the environment variables file:

```bash
cp ./src/.env.example ./src/.env
```

Then, change the values in the `.env` file to match your desired configuration.

To start the project, run the following command:

```bash
make
```

## Troubleshooting

This project has only been tested on Ubuntu 20.04. If you encounter any issues while running the project, please ensure that you are using a compatible operating system.

On macOS, you can use OrbStack to run the project in a containerized environment.

If docker-compose is not installed on your system, you can install it using the following command:

```bash
make install
```
