FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
RUN --mount=type=cache,target=~/.cache/pip pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim AS worker
WORKDIR /app
COPY --from=builder /app/venv ./venv
ENV PATH="/app/venv/bin:$PATH"
COPY main.py .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]