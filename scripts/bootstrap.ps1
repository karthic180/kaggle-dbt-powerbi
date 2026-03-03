$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting Kaggle dbt Bootstrap"

if (!(Test-Path "venv")) {
    python -m venv venv
}

.\venv\Scripts\Activate.ps1

pip install --upgrade pip
pip install -r requirements.txt

python load_data.py

dbt clean
dbt run --target duckdb
if ($LASTEXITCODE -ne 0) {
    dbt run --target sqlite
}

dbt test --target duckdb
dbt snapshot --target duckdb

python export_powerbi.py

Write-Host "✅ Bootstrap Complete"