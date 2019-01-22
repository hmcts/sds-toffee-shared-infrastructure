# cnp-rhubarb-shared-infrastructure

This repository contains the shared the common infra components per Environment (persistent) for Rhubarb

- Application Insights
- Azure Key Vault
- Storage Account
- Traffic Manager

## Traffic Manager

This module builds Traffic Manager which points to Application Gateway endpoints which then points to the hostname of the web app.
