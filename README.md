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

Clone the repository

```bash
git clone https://github.com/Charan89k/Model-Regression-Detection-System2.git

cd Model-Regression-Detection-System2
```

Create a virtual environment

```bash
python -m venv .venv
```

Activate

Windows

```bash
.venv\Scripts\activate
```

Linux/macOS

```bash
source .venv/bin/activate
```

Install dependencies

```bash
pip install -e ".[dev]"
```

Create environment variables

```bash
cp .env.example .env
```

Fill in

```
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
GEMINI_API_KEY=
SLACK_WEBHOOK_URL=
```

---

# ▶ Running an Evaluation

```bash
mrds run support_routing 1.0 router 1.0
```

This will:

- Load prompt
- Load dataset
- Execute LLM
- Score outputs
- Detect regressions
- Save run
- Generate HTML report
- Send Slack notification

---

# 🌐 Running the API

```bash
uvicorn src.main:app --reload
```

Open

```
http://localhost:8000/docs
```

Swagger UI is automatically generated.

---

# 🧪 Running Tests

```bash
python -m pytest
```

---

# 🔍 Static Analysis

```bash
python -m ruff check .
```

```bash
python -m ruff format --check .
```

```bash
python -m mypy --strict src
```

---

# 🐳 Docker

Build

```bash
docker build -t mrds .
```

Run

```bash
docker compose up
```

---

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

---

# 📷 Screenshots

Replace these placeholders with actual screenshots.

## Dashboard

```
docs/images/dashboard.png
```

## HTML Report

```
docs/images/report.png
```

## Swagger

```
docs/images/swagger.png
```

## CLI

```
docs/images/cli.png
```

## Slack Alert

```
docs/images/slack.png
```

---

# 🎥 Demo

Coming Soon

- Loom Walkthrough
- YouTube Demo

---

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

# 📄 License

MIT License

---

# 👨‍💻 Author

**N. Sri Charan**

Aspiring AI Infrastructure & Machine Learning Engineer

- GitHub: https://github.com/Charan89k
- LinkedIn: *(Add your LinkedIn URL here)*

---

> *"Treating LLM behavior as testable software is essential for building reliable AI systems."*
