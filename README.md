# SE4453 Final Project - Group 10

This is a Next.js web application deployed to Azure App Service using GitHub Actions and Azure Container Registry (ACR), utilizing the Git-Flow branching strategy.

## Infrastructure Architecture
- **Web Framework:** Next.js
- **Containerization:** Docker with SSH support for App Service
- **CI/CD:** GitHub Actions
- **Registry:** Azure Container Registry (ACR) (`se4453acripek`)
- **Hosting:** Azure App Service (`se4453-app`)
- **Database:** PostgreSQL Flexible Server
- **Secrets Management:** Azure KeyVault
- **Security:** User Assigned Identity with `AcrPull` role

## Branching Strategy (Git-Flow)
This repository uses the Git-Flow strategy:
- `main`: Production-ready code. Commits to this branch trigger the CI/CD pipeline to deploy to Azure.
- `develop`: Main development branch. Features and bug fixes are merged here before being released to `main`.

## Deployment
The deployment is fully automated via GitHub Actions (`.github/workflows/deploy.yml`). When code is pushed to `main` or `develop`:
1. The Docker image is built.
2. The image is pushed to ACR.
3. Azure App Service pulls the latest image and restarts the container.
