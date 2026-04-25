# Bandha: AI Tracker & Cloud Ecosystem (AWS EC2)

A unified financial tracking ecosystem powered by a Quad-LLM architecture, deployed on a production-grade AWS cloud infrastructure.

## Cloud & DevOps Architecture

This project demonstrates modern DevOps practices, taking a Node.js backend from a local environment to a fully containerized cloud deployment:

* **Infrastructure as Code (IaC):** Server provisioning (EC2 `t3.micro`), Security Groups, and storage are codified using **Terraform** (see `/terraform` folder).
* **Containerization:** The backend is fully isolated and optimized using **Docker** (Alpine Linux), ensuring extremely low memory footprint (<60MB RAM usage).
* **Automated CI/CD:** Engineered a zero-downtime deployment pipeline using **GitHub Actions**. Every push to the `main` branch triggers an automated SSH connection, Docker image rebuild, and container restart on the AWS server.
* **Networking & Security:** Traffic is securely routed via **Nginx Reverse Proxy** and encrypted using **Certbot (Let's Encrypt)**.

## Quad-LLM Engine

The core application integrates 4 state-of-the-art Large Language Models to automate expense tracking:

1. **Gemini 2.5 Flash:** Smart OCR for extracting data from physical receipts.
2. **GPT Whisper v3:** High-fidelity voice-to-text recording for instant transaction input.
3. **Llama 3.3 70b:** Natural Language Processing (NLP) to extract structured entities from casual chat input.
4. **GPT OSS 120b:** Deep financial analysis and insight generation.

## Tech Stack

* **Backend:** Node.js, Express
* **Database:** Google Sheets API (Real-time sync)
* **Cloud & Ops:** AWS EC2, Docker, GitHub Actions, Nginx, Terraform
* **Cost & Resource Optimization:** Architected a highly memory-efficient containerization strategy, successfully running a complex Quad-LLM backend on a low-tier EC2 instance (t3.micro) with a <60MB RAM footprint, effectively minimizing cloud infrastructure costs without sacrificing performance.