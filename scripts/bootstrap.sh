#!/bin/bash
set -e

echo "🚀 Starting Kaggle dbt Bootstrap"

# Create venv if not exists
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi

source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

python load_data.py

dbt clean
dbt run --target duckdb || dbt run --target sqlite
dbt test --target duckdb
dbt snapshot --target duckdb

python export_powerbi.py

echo "✅ Bootstrap Complete"
echo "Import CSV from powerbi/data into Power BI"