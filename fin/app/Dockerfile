#checkov:skip=CKV_DOCKER_2: Healthcheck is included in Docker Compose instead(find at cloud-init.yml.tpl)
FROM python:3.12-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"
RUN --mount=type=cache,target=~/.cache/pip pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim AS worker
WORKDIR /app
RUN useradd -u 10001 -m user_app && chown -R user_app:user_app /app
COPY --from=builder /app/venv ./venv
ENV PATH="/app/venv/bin:$PATH"
COPY main.py .
USER user_app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
