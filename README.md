🚀 Kaggle Analytics Engineering Project
dbt + DuckDB + Power BI (Zero Cloud, Fully Reproducible)

This project demonstrates a complete modern analytics engineering workflow using:

🧱 dbt

🦆 DuckDB

📊 Microsoft Power BI Desktop

🐳 Docker (optional)


📌 Project Overview

This project uses the Brazilian e-commerce dataset from Kaggle to:

Load raw CSV data

Transform data using dbt

Create fact and dimension models

Implement data tests

Build SCD Type 2 snapshot

Export analytics-ready tables

Visualize results in Power BI

🏗 Architecture
Kaggle CSV
    ↓
DuckDB
    ↓
dbt (staging → marts)
    ↓
Snapshots + Tests
    ↓
CSV Export
    ↓
Power BI Dashboard

📊 Data Source

Dataset: Brazilian E-Commerce Public Dataset

Download from:

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

After downloading:

Place CSV files inside:

data/

(These files are not committed to keep repo lightweight.)

🚀 Quick Start
Option 1 — Docker (No Python Required)

Install:

Docker

Run:

docker compose up
Option 2 — Windows
.\scripts\bootstrap.ps1
Option 3 — Mac / Linux
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
🧱 dbt Features Included

Staging models

Fact table (fct_orders)

Dimension table (dim_customers)

Data tests (unique, not_null)

Snapshot (SCD Type 2)

DuckDB primary engine

SQLite fallback

Run manually:

dbt run --target duckdb
dbt test --target duckdb
dbt snapshot --target duckdb
📊 Power BI Setup

Open:

Microsoft Power BI Desktop

Import CSV from:

powerbi/data/

Create relationship:

dim_customers.customer_id → fct_orders.customer_id

Example DAX:

Total Revenue = SUM(fct_orders[total_price])
Total Orders = DISTINCTCOUNT(fct_orders[order_id])
Average Order Value = DIVIDE([Total Revenue], [Total Orders])
🎯 What This Project Demonstrates

Analytics engineering best practices

ELT architecture

Star schema modeling

Data quality testing

Snapshot versioning

Reproducible pipelines

Cross-platform automation

BI integration



📄 License

MIT License