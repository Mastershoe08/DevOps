Flask and GitHub Actions Test Deployment

This repository contains a simple Flask application and a GitHub Actions workflow for building and deploying it using Docker Compose.

Purpose:
This project was created to experiment with:

    GitHub Actions — setting up a CI/CD pipeline

    Docker & Docker Compose — containerizing a small app

    Flask — serving a minimal Python web app

It currently deploys in a GitHub Actions sandbox. Future iterations will target an EC2 instance for automated remote deployment.
Structure

flask-stack/
├─- docker-compose.yml   # Docker services definition
├── Dockerfile           # Flask app container build
├── flask/               # Application source code
└── requirements.txt     # Python dependencies
deploy_stack.sh          # Deployment script

How It Works:

    Push changes to the repository.

    GitHub Actions triggers the workflow.

    The Docker image is built and started with Docker Compose.

Notes:

    This repository is for learning and demonstration purposes only.

    No sensitive information is stored in this repo.
