FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install dbt-duckdb duckdb pandas

CMD ["bash", "scripts/bootstrap.sh"]