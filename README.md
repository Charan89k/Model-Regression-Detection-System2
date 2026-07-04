# 🚀 Model Regression Detection System (MRDS)

> A production-grade evaluation platform that detects behavioral regressions in Large Language Model (LLM) applications before they reach production.

![Python](https://img.shields.io/badge/Python-3.11+-blue)
![FastAPI](https://img.shields.io/badge/FastAPI-Latest-green)
![Docker](https://img.shields.io/badge/Docker-Ready-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)
![CI](https://img.shields.io/badge/CI-GitHub%20Actions-success)
![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)

---

## 📖 Overview

Modern AI applications change constantly.

Prompt updates, model upgrades, and provider changes can silently degrade output quality. Traditional software testing cannot detect these behavioral regressions because the code hasn't changed—the model behavior has.

The **Model Regression Detection System (MRDS)** brings software engineering best practices to AI systems by treating LLM outputs as testable artifacts.

Whenever a prompt or model changes, MRDS automatically:

- Executes a curated evaluation suite
- Scores outputs using multiple evaluation strategies
- Detects regressions against historical baselines
- Generates detailed HTML reports
- Sends Slack alerts
- Integrates with GitHub Actions to prevent regressions from reaching production

---

# ✨ Features

### Evaluation Engine

- Human-curated golden datasets
- Versioned prompt management
- Multi-provider LLM support
- Parallel asynchronous execution
- Configurable evaluation pipelines

---

### Scoring System

Supports multiple scoring strategies:

- Exact Match
- Regular Expression Matching
- Cosine Similarity
- LLM-as-a-Judge
- Custom Scorers

---

### Regression Detection

Automatically compares runs and identifies:

- Accuracy regressions
- Accuracy improvements
- Category-level deltas
- Pass rate trends
- Slow model drift
- Statistical threshold alerts

---

### REST API

FastAPI backend exposing endpoints for:

- Trigger evaluation
- Compare runs
- Retrieve reports
- Health checks
- Evaluation history

Interactive Swagger documentation included.

---

### CLI

Developer-friendly CLI powered by Typer.

Example:

```bash
mrds run support_routing 1.0 router 1.0
```

---

### Reporting

Generates professional HTML reports containing:

- Overall accuracy
- Pass/fail summary
- Regression table
- Improved cases
- Token usage
- Latency metrics
- Historical trends

---

### Notifications

Slack Incoming Webhook integration.

Receive alerts such as:

```
Evaluation Completed

Accuracy: 94% → 88%

⚠ 6 regressions detected

Prompt Version: router-v2

Model: GPT-4o
```

---

### CI/CD

GitHub Actions automatically runs evaluations whenever prompts change.

If a critical regression is detected:

- Pull Request fails
- Report is generated
- Slack notification sent
- Merge blocked

---

# 🏗 Architecture

```
                    GitHub Actions
                           │
                           ▼
                Evaluation Orchestrator
                           │
          ┌────────────────┴──────────────┐
          ▼                               ▼
   Prompt Registry                 Dataset Loader
          │                               │
          └──────────────┬────────────────┘
                         ▼
                  LLM Runner Factory
                         │
     ┌──────────┬────────┴──────────┐
     ▼          ▼                   ▼
 OpenAI     Anthropic            Gemini
                         │
                         ▼
                  Scoring Engine
                         │
                         ▼
              Regression Detector
                         │
        ┌────────────────┴─────────────┐
        ▼                              ▼
   SQLite Database             HTML Report
                                       │
                                       ▼
                               Slack Notification
```

---

# 📂 Project Structure

```
Model-Regression-Detection-System/
│
├── src/
│   ├── adapters/
│   ├── core/
│   ├── domain/
│   ├── presentation/
│   └── use_cases/
│
├── prompts/
├── datasets/
├── reports/
├── tests/
├── docs/
├── .github/workflows/
├── Dockerfile
├── docker-compose.yml
├── pyproject.toml
└── README.md
```

---

# 🛠 Technology Stack

| Layer | Technology |
|--------|------------|
| Language | Python 3.11 |
| API | FastAPI |
| CLI | Typer |
| Validation | Pydantic v2 |
| Database | SQLite / PostgreSQL |
| ORM | SQLAlchemy Async |
| Logging | Structlog |
| Testing | Pytest |
| Linting | Ruff |
| Type Checking | Mypy |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| LLM Providers | OpenAI • Anthropic • Gemini |

---

# 🚀 Quick Start

This guide walks you through setting up the **Model Regression Detection System (MRDS)** from scratch.

---

# Prerequisites

Ensure the following software is installed on your system.

| Software | Version |
|----------|----------|
| Python | 3.11+ |
| Git | Latest |
| Docker Desktop | Latest |
| Docker Compose | Latest |
| pip | Latest |

Verify installation:

```bash
python --version
git --version
docker --version
docker compose version
```

# Clone the Repository

```bash
git clone https://github.com/Charan89k/Model-Regression-Detection-System2.git

cd Model-Regression-Detection-System2
```
---

# Create a Virtual Environment

Windows

```powershell
python -m venv .venv

.venv\Scripts\activate
```

Linux / macOS

```bash
python3 -m venv .venv

source .venv/bin/activate
```
---

# Install Dependencies

```bash
pip install --upgrade pip

pip install -e .

pip install -e ".[dev]"
```

This installs

- FastAPI
- SQLAlchemy
- Typer
- Ruff
- Mypy
- Pytest
- OpenAI SDK
- Anthropic SDK
- Google Gemini SDK
- Docker support

---

# Environment Variables

Copy the example file.

```bash
cp .env.example .env
```

Windows

```powershell
copy .env.example .env
```

---

Edit `.env`

```env
##########################################
# Database
##########################################

DATABASE_URL=sqlite+aiosqlite:///./mrds.db

##########################################
# OpenAI
##########################################

OPENAI_API_KEY=your_openai_api_key

##########################################
# Anthropic
##########################################

ANTHROPIC_API_KEY=your_anthropic_api_key

##########################################
# Google Gemini
##########################################

GEMINI_API_KEY=your_gemini_api_key

##########################################
# Slack (Optional)
##########################################

SLACK_WEBHOOK_URL=https://hooks.slack.com/services/...

##########################################
# Logging
##########################################

LOG_LEVEL=INFO
```
---

# API Keys

MRDS supports multiple LLM providers.

## OpenAI

Create an API key:

https://platform.openai.com/api-keys

---

## Anthropic Claude

Create an API key:

https://console.anthropic.com/

---

## Google Gemini

Create an API key:

https://aistudio.google.com/app/apikey

---

## Slack (Optional)

Incoming Webhooks

https://api.slack.com/messaging/webhooks

Slack is only required if you want automatic regression alerts.

---

# Running the API

```bash
uvicorn src.main:app --reload
```

API

```
http://localhost:8000
```

Swagger Docs

```
http://localhost:8000/docs
```

OpenAPI

```
http://localhost:8000/openapi.json
```

Health Check

```
http://localhost:8000/health
```

---

# Running the CLI

Show help

```bash
python -m mrds.presentation.cli.main --help
```

or

```bash
mrds --help
```

Run an evaluation

```bash
mrds run support_routing 1.0 router 1.0
```

---

# Running Tests

Run all tests

```bash
python -m pytest
```

---

# Linting

```bash
python -m ruff check .
```

Automatically fix issues

```bash
python -m ruff check . --fix
```

---

# Formatting

Check formatting

```bash
python -m ruff format --check .
```

Format the project

```bash
python -m ruff format .
```

---

# Static Type Checking

```bash
python -m mypy --strict src
```

---

# Docker

Build the image

```bash
docker build -t mrds .
```

Run

```bash
docker run -p 8000:8000 \
-e OPENAI_API_KEY=YOUR_KEY \
-e ANTHROPIC_API_KEY=YOUR_KEY \
-e GEMINI_API_KEY=YOUR_KEY \
mrds
```

Swagger

```
http://localhost:8000/docs
```

---

# Docker Compose

Start

```bash
docker compose up --build
```

Detached

```bash
docker compose up -d
```

Stop

```bash
docker compose down
```

---

# Project Structure

```
.
├── datasets/
├── prompts/
├── reports/
├── scripts/
├── src/
│   └── mrds/
│       ├── adapters/
│       ├── core/
│       ├── domain/
│       ├── infrastructure/
│       ├── presentation/
│       └── use_cases/
├── tests/
├── Dockerfile
├── docker-compose.yml
├── pyproject.toml
└── README.md
```

---

# Supported Providers

✅ OpenAI GPT Models

✅ Anthropic Claude Models

✅ Google Gemini Models

---

# CI/CD

GitHub Actions automatically performs

- Ruff Lint
- Ruff Format
- Mypy
- Unit Tests
- Docker Build Verification

on every push and pull request.

---

# Common Commands

Run API

```bash
uvicorn src.main:app --reload
```

Run Tests

```bash
python -m pytest
```

Lint

```bash
python -m ruff check .
```

Type Check

```bash
python -m mypy --strict src
```

Docker

```bash
docker build -t mrds .
docker run -p 8000:8000 mrds
```

---

# Troubleshooting

## API won't start

Ensure all required environment variables are configured.

Check

```bash
python -m pytest
```

---

## Docker fails

Verify Docker Desktop is running.

```bash
docker info
```

---

## CLI not found

Run

```bash
pip install -e .
```

or

```bash
python -m mrds.presentation.cli.main --help
```

---

## Missing API Key

Without provider API keys:

- API starts successfully ✅
- Swagger works ✅
- Health endpoint works ✅
- Evaluation requests will fail until a valid provider key is configured.

---

# Production Deployment

MRDS can be deployed on

- Render
- Railway
- Koyeb
- Fly.io
- Azure Container Apps
- Google Cloud Run
- Oracle Cloud Free Tier

using the provided Dockerfile.

# 📈 Example Workflow

```
Prompt Updated
       │
       ▼
GitHub Action Triggered
       │
       ▼
Evaluation Started
       │
       ▼
LLM Execution
       │
       ▼
Scoring
       │
       ▼
Regression Detection
       │
       ▼
HTML Report Generated
       │
       ▼
Slack Notification Sent
```

---

# 📊 Sample Evaluation Metrics

| Metric | Example |
|----------|---------|
| Accuracy | 94% |
| Regression Count | 6 |
| Improvements | 4 |
| Average Latency | 1.18 s |
| Average Tokens | 382 |
| Overall Status | PASS |

---

# 🔐 Security

The project follows several secure engineering practices:

- Environment-based secret management
- No hardcoded credentials
- Path traversal protection
- Prompt injection mitigation
- Structured exception handling
- Input validation using Pydantic
- Async-safe architecture

---

# 📚 Engineering Principles

This project follows:

- Clean Architecture
- SOLID Principles
- Domain-Driven Design
- Repository Pattern
- Factory Pattern
- Strategy Pattern
- Dependency Injection
- Async-first Design


# 📌 Roadmap

- PostgreSQL Integration Tests
- Google GenAI SDK Migration
- Cost Analytics Dashboard
- Custom Dataset Upload UI
- Multi-model Benchmarking
- Historical Trend Dashboard

---

# 🤝 Contributing

Contributions are welcome.

Please:

1. Fork the repository
2. Create a feature branch
3. Add tests
4. Ensure all checks pass
5. Open a Pull Request

---

# 👨‍💻 Author

**N. Sri Charan**

Aspiring AI Infrastructure & Machine Learning Engineer

- GitHub: https://github.com/Charan89k
- LinkedIn: https://www.linkedin.com/in/charan89k
