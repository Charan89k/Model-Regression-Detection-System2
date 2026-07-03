.PHONY: help install lint test clean build run-api run-cli

help:
	@echo "Available commands:"
	@echo "  install    - Install dependencies (including dev)"
	@echo "  lint       - Run Ruff and Mypy"
	@echo "  test       - Run Pytest"
	@echo "  clean      - Remove cache and temporary files"
	@echo "  run-api    - Run the FastAPI server"
	@echo "  run-cli    - Run the Typer CLI"

install:
	pip install -e ".[dev]"

lint:
	ruff check .
	mypy src tests

test:
	pytest

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache __pycache__ src/**/__pycache__ tests/**/__pycache__
	rm -rf .coverage htmlcov coverage.xml

run-api:
	uvicorn mrds.presentation.api.main:app --reload --host 0.0.0.0 --port 8000

run-cli:
	mrds --help
